import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import '../../interface/exceptions/camera_communication_exception.dart';
import '../adapter/ptp_response_stream_transformer.dart';
import '../adapter/socket_factory.dart';
import '../logging/eos_ptp_ip_logger.dart';
import '../models/ptp_packet.dart';
import '../responses/ptp_response.dart';

class PtpIpChannel {
  final Socket _socket;
  final Stream<Uint8List> _dataStream;
  final PtpResponseStreamTransformer _ptpResponseStreamTransformer;

  final EosPtpIpLogger _logger = EosPtpIpLogger();

  static Future<PtpIpChannel> connect(
    String address,
    int port, {
    SocketFactory socketFactory = const SocketFactory(),
  }) async {
    final socket = await socketFactory.connect(
      address: InternetAddress(address),
      port: port,
    );

    final dataStream = socket.asBroadcastStream().timeout(
          const Duration(seconds: 2),
          onTimeout: (sink) => sink.addError(
            const CameraCommunicationAbortedException(
                'Communication timed out'),
          ),
        );

    return PtpIpChannel(socket, dataStream);
  }

  PtpIpChannel(
    this._socket,
    this._dataStream, [
    this._ptpResponseStreamTransformer = const PtpResponseStreamTransformer(),
  ]);

  Future<void> write(PtpPacket packet) async {
    _socket.add(packet.data);
    await _socket.flush();
  }

  Stream<Uint8List> get onData => _dataStream;

  Stream<PtpResponse> get onResponse =>
      onData.transform(_ptpResponseStreamTransformer);

  Future<void> close() async {
    _socket.destroy();
  }
}
