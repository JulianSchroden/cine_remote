import 'dart:async';
import 'dart:typed_data';

import 'package:logging/logging.dart';

import '../models/ptp_packet.dart';
import '../responses/ptp_response.dart';
import 'ptp_ip_channel.dart';

class PtpIpClient {
  final PtpIpChannel _commandChannel;
  final PtpIpChannel _eventChannel;
  final Logger logger = Logger('PtpIpClient');

  PtpIpClient(this._commandChannel, this._eventChannel);

  Future<void> disconnect() async {
    await _commandChannel.close();
    await _eventChannel.close();
  }

  Future<void> sendCommand(PtpPacket packet) async {
    await _commandChannel.write(packet);
  }

  Future<void> sendEvent(PtpPacket packet) async {
    await _eventChannel.write(packet);
  }

  Stream<PtpResponse> get onCommandResponse => _commandChannel.onResponse;

  Stream<Uint8List> get onCommandData => _commandChannel.onData;

  Stream<PtpResponse> get onEventResponse => _eventChannel.onResponse;
}
