import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:logging/logging.dart';

import '../../interface/exceptions/camera_connection_exception.dart';
import '../adapter/ptp_response_stream_transformer.dart';
import '../adapter/socket_factory.dart';
import '../models/ptp_packet.dart';
import '../responses/ptp_response.dart';

class PtpIpChannel {
  final Socket _socket;
  final StreamController<Uint8List> _dataStreamController;
  final PtpResponseStreamTransformer _ptpResponseStreamTransformer;
  bool _isOpen = true;

  final Logger _logger = Logger('PtpIpChannel');

  static Future<PtpIpChannel> connect(
    InternetAddress address,
    int port, {
    SocketFactory socketFactory = const SocketFactory(),
  }) async {
    final socket = await socketFactory.connect(address: address, port: port);
    final streamController = StreamController<Uint8List>.broadcast();
    streamController.addStream(socket);

    return PtpIpChannel(socket, streamController);
  }

  PtpIpChannel(
    this._socket,
    this._dataStreamController, [
    this._ptpResponseStreamTransformer = const PtpResponseStreamTransformer(),
  ]) {
    _socket.done.then((_) async {
      _logger.info('Socket closed');

      await _dataStreamController.close();
      _isOpen = false;
    });
  }

  Future<void> write(PtpPacket packet) async {
    if (!_isOpen) {
      throw CameraConnectionException('Cannot write packet. Channel is closed');
    }
    _socket.add(packet.data);
    await _socket.flush();
  }

  Stream<Uint8List> get onData => _dataStreamController.stream;

  Stream<PtpResponse> get onResponse =>
      onData.transform(_ptpResponseStreamTransformer);

  bool get isOpen => _isOpen;

  Future<void> close() async {
    _socket.destroy();
    await _dataStreamController.close();
  }
}
