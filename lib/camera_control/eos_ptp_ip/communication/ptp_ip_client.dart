import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import '../adapter/ptp_request_factory.dart';
import '../extensions/stream_extensions.dart';
import '../models/ptp_packet.dart';
import '../responses/ptp_init_command_response.dart';
import '../responses/ptp_init_event_response.dart';
import '../responses/ptp_response.dart';
import 'ptp_ip_channel.dart';

class PtpIpClient {
  final PtpIpChannel _commandChannel;
  final PtpIpChannel _eventChannel;
  final Logger logger = Logger('PtpIpClient');

  PtpIpClient(this._commandChannel, this._eventChannel);

  static Future<PtpIpClient> connect({
    required InternetAddress address,
    required int port,
    required String clientName,
    required Uint8List guid,
  }) async {
    final logger = Logger('PtpIpClient.connect');

    logger.info('Attempting to open command channel');
    final commandChannel = await PtpIpChannel.connect(address, port);

    logger.info('Sending initCommand request');
    await commandChannel.write(PtpRequestFactory()
        .createInitCommandRequest(name: clientName, guid: guid));

    final initCommandResponse = await commandChannel.onResponse
        .firstWhereType<PtpInitCommandResponse>()
        .timeout(const Duration(seconds: 10));

    logger.info(
        'Received initCommand response with connectionNumber: ${initCommandResponse.connectionNumber}');

    logger.info('Attempting to open event channel');
    final eventChannel = await PtpIpChannel.connect(address, port);

    logger.info("Sending initEvent request");
    await eventChannel.write(PtpRequestFactory().createInitEventRequest(
        connectionNumber: initCommandResponse.connectionNumber));

    await eventChannel.onResponse
        .firstWhereType<PtpInitEventResponse>()
        .timeout(const Duration(seconds: 10));

    logger.info('Received initEvent response');

    return PtpIpClient(commandChannel, eventChannel);
  }

  Future<void> disconnect() async {
    _commandChannel.close();
    _eventChannel.close();
  }

  Future<void> sendCommand(PtpPacket packet) async {
    await _commandChannel.write(packet);
  }

  Future<void> sendEvent(PtpPacket packet) async {
    await _eventChannel.write(packet);
  }

  Stream<PtpResponse> get onCommandResponse => _commandChannel.onResponse;

  Stream<PtpResponse> get onEventResponse => _eventChannel.onResponse;
}
