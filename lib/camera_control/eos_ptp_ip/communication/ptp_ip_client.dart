import 'dart:async';
import 'dart:typed_data';

import '../../interface/exceptions/camera_communication_exception.dart';
import '../logging/eos_ptp_ip_logger.dart';
import '../models/ptp_packet.dart';
import '../responses/ptp_response.dart';
import 'ptp_ip_channel.dart';

class PtpIpClient {
  final PtpIpChannel _commandChannel;
  final PtpIpChannel _eventChannel;
  final EosPtpIpLogger logger = EosPtpIpLogger();
  final Duration commandChannelTimeout;

  PtpIpClient(
    this._commandChannel,
    this._eventChannel, {
    this.commandChannelTimeout = const Duration(seconds: 2),
  });

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

  Stream<PtpResponse> get onCommandResponse =>
      _commandChannel.onResponse.timeout(
        commandChannelTimeout,
        onTimeout: (sink) => sink.addError(
          const CameraCommunicationAbortedException('Communication timed out'),
        ),
      );

  Stream<Uint8List> get onCommandData => _commandChannel.onData;

  Stream<PtpResponse> get onEventResponse => _eventChannel.onResponse;
}
