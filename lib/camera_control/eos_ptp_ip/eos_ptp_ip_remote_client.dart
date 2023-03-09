import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import '../interface/camera_remote_client.dart';
import '../interface/models/camera_handle.dart';
import '../interface/models/camera_update_response.dart';
import '../interface/models/control_prop.dart';
import '../interface/models/control_prop_type.dart';
import 'adapter/ptp_request_factory.dart';
import 'adapter/ptp_response_parser.dart';
import 'extensions/dump_bytes_extensions.dart';
import 'models/ptp_packet.dart';
import 'responses/ptp_init_command_response.dart';
import 'responses/ptp_init_event_response.dart';

class EosPtpIpRemoteClient extends CameraRemoteClient {
  Socket? socket;
  Socket? eventSocket;
  StreamSubscription<Uint8List>? subscription;
  StreamSubscription<Uint8List>? eventSubscription;
  final PtpRequestFactory _ptpRequestFactory;
  final PtpResponseParser _ptpResponseParser;

  EosPtpIpRemoteClient()
      : _ptpRequestFactory = PtpRequestFactory(),
        _ptpResponseParser = PtpResponseParser();

  @override
  Future<CameraHandle> connect() async {
    const clientName = 'Cine Remote';
    const cameraIp = '192.168.178.43';
    const port = 15740;
    final guid = Uint8List.fromList(List.generate(16, (index) => 0x00));

    print('Attempting to connect');
    final address = InternetAddress.tryParse(cameraIp);
    await subscription?.cancel();
    socket?.destroy();

    await eventSubscription?.cancel();
    eventSocket?.destroy();

    final initCommandCompleter = Completer<PtpInitCommandResponse>();

    socket = await Socket.connect(
      address,
      port,
      timeout: const Duration(seconds: 10),
    );
    subscription = socket!.listen((data) {
      final response = _ptpResponseParser.read(PtpPacket(data));
      if (response is PtpInitCommandResponse) {
        initCommandCompleter.complete(response);
        print('Connected to camera ${response.cameraName}');
      } else if (response is PtpInitEventResponse) {
        print('Init event response');
      }

      print('onData');
      print(data.dumpAsHex());
    }, onError: (e) {
      print("Connection error");
      print(e);
    }, onDone: () async {
      print('Connection closed');
      socket?.destroy();
      await subscription?.cancel();
    });

    final initCommandRequest = _ptpRequestFactory.createInitCommandRequest(
      name: clientName,
      guid: guid,
    );
    print(initCommandRequest.data.dumpAsHex());

    // sending package
    socket!.add(initCommandRequest.data);
    await socket!.flush();
    print('flush complete');

    final initResponse =
        await initCommandCompleter.future.timeout(const Duration(seconds: 10));

    print('completer completed: now, sending init event request');
    print('Trying to init event socket');
    eventSocket = await Socket.connect(
      address,
      port,
      timeout: const Duration(seconds: 10),
    );

    eventSocket!.listen((event) {
      print('received response on event line');
      event.dumpAsHex();
    });

    final initEventRequest = _ptpRequestFactory.createInitEventRequest(
        connectionNumber: initResponse.connectionNumber);
    print(initEventRequest.data.dumpAsHex());
    eventSocket!.add(initEventRequest.data);
    await eventSocket!.flush();

    print('Waiting a bit for no reason');

    await Future.delayed(Duration(seconds: 10));

    return const CameraHandle(supportedProps: []);
  }

  @override
  Future<Uint8List> getLiveViewImage(CameraHandle handle) {
    // TODO: implement getLiveViewImage
    throw UnimplementedError();
  }

  @override
  Future<ControlProp?> getProp(CameraHandle handle, ControlPropType propType) {
    // TODO: implement getProp
    throw UnimplementedError();
  }

  @override
  Future<CameraUpdateResponse> getUpdate(CameraHandle handle) {
    // TODO: implement getUpdate
    throw UnimplementedError();
  }

  @override
  Future<void> setProp(
      CameraHandle handle, ControlPropType propType, String value) {
    // TODO: implement setProp
    throw UnimplementedError();
  }

  @override
  Future<void> startLiveView(CameraHandle handle) {
    // TODO: implement startLiveView
    throw UnimplementedError();
  }

  @override
  Future<void> stopLiveView(CameraHandle handle) {
    // TODO: implement stopLiveView
    throw UnimplementedError();
  }

  @override
  Future<void> toggleAfLock(CameraHandle handle) {
    // TODO: implement toggleAfLock
    throw UnimplementedError();
  }

  @override
  Future<void> triggerRecord(CameraHandle handle) {
    // TODO: implement triggerRecord
    throw UnimplementedError();
  }
}
