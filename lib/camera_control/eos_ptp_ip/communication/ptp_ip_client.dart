import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../adapter/ptp_request_factory.dart';
import '../adapter/ptp_response_stream_transformer.dart';
import '../adapter/socket_factory.dart';
import '../extensions/stream_extensions.dart';
import '../models/ptp_packet.dart';
import '../responses/ptp_init_command_response.dart';
import '../responses/ptp_init_event_response.dart';
import '../responses/ptp_response.dart';

class PtpIpClient {
  final SocketFactory socketFactory;
  final PtpResponseStreamTransformer ptpResponseStreamTransformer;
  Socket? _commandSocket;
  Socket? _eventSocket;
  StreamController<Uint8List>? _commandResponseStreamController;
  StreamController<Uint8List>? _eventResponseStreamController;

  PtpIpClient({
    required this.socketFactory,
    required this.ptpResponseStreamTransformer,
  });

  Future<void> connect({
    required InternetAddress address,
    required int port,
    required String clientName,
    required Uint8List guid,
  }) async {
    _commandSocket?.destroy();
    await _commandResponseStreamController?.close();

    print('Trying to connect to socket');
    _commandSocket = await socketFactory.connect(address: address, port: port);
    _commandResponseStreamController = StreamController.broadcast();
    _commandResponseStreamController!.addStream(_commandSocket!);

    print('Sending initCommandRequest');
    await sendCommand(PtpRequestFactory()
        .createInitCommandRequest(name: clientName, guid: guid));

    final initCommandResponse = await commandResponseStream
        .firstWhereType<PtpInitCommandResponse>()
        .timeout(const Duration(seconds: 10));

    print('Received Response');
    print(initCommandResponse.connectionNumber);

    _eventSocket = await socketFactory.connect(address: address, port: port);
    _eventResponseStreamController = StreamController.broadcast();
    _eventResponseStreamController!.addStream(_eventSocket!);

    print("sending initEventRequest");
    await sendEvent(PtpRequestFactory().createInitEventRequest(
        connectionNumber: initCommandResponse.connectionNumber));

    final initEventResponse = await eventResponseStream
        .firstWhereType<PtpInitEventResponse>()
        .timeout(const Duration(seconds: 10));

    print('receieved initEventResponse');
  }

  Future<void> disconnect() async {
    _commandSocket?.destroy();
    _eventSocket?.destroy();
    _commandResponseStreamController?.close();
    _eventResponseStreamController?.close();
  }

  Future<void> sendCommand(PtpPacket packet) async {
    _commandSocket!.add(packet.data);
    await _commandSocket!.flush();
  }

  Future<void> sendEvent(PtpPacket packet) async {
    _eventSocket!.add(packet.data);
    await _eventSocket!.flush();
  }

  Stream<PtpResponse> get commandResponseStream =>
      _commandResponseStreamController!.stream
          .transform(ptpResponseStreamTransformer);

  Stream<PtpResponse> get eventResponseStream =>
      _eventResponseStreamController!.stream
          .transform(ptpResponseStreamTransformer);
}
