import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import '../adapter/ptp_response_stream_transformer.dart';
import '../adapter/socket_factory.dart';
import '../models/ptp_packet.dart';
import '../responses/ptp_response.dart';

class PtpIpChannel {
  final Socket _socket;
  final Stream<Uint8List> _dataStream;
  final PtpResponseStreamTransformer _ptpResponseStreamTransformer;

  static Future<PtpIpChannel> connect(
    String address,
    int port, {
    SocketFactory socketFactory = const SocketFactory(),
  }) async {
    final socket = await socketFactory.connect(
      address: InternetAddress(address),
      port: port,
    );

    final dataStream = socket.asBroadcastStream();

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
