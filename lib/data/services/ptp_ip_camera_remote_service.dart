import 'dart:io';
import 'dart:typed_data';

import '../../domain/models/camera_handle.dart';
import '../../domain/models/camera_update_response.dart';
import '../../domain/models/control_prop.dart';
import '../../domain/models/control_prop_type.dart';
import '../../domain/services/camera_remote_service.dart';

class PtpIpCameraRemoteService extends CameraRemoteService {
  void dumpHexData(Uint8List data) {
    final hexDump =
        data.map((d) => d.toRadixString(16).padLeft(2, '0')).toList();
    print(hexDump);
  }

  @override
  Future<CameraHandle> connect() async {
    const clientName = "Cine Remote";
    final nameCodeUnits = [...clientName.codeUnits, 0];
    final nameData = ByteData(nameCodeUnits.length * 2);
    for (var i = 0; i < nameCodeUnits.length; i++) {
      nameData.setInt16(i * 2, nameCodeUnits[i], Endian.little);
    }

    final nameBytes = Uint8List.view(nameData.buffer);
    print('mock impl');

    print('Attempting to connect');
    final address = InternetAddress.tryParse('192.168.178.43');
    print(address);
    final socket = await Socket.connect(address, 15740);
    final subscription = socket.listen((event) {
      print('onData');
      dumpHexData(event);
    }, onError: (e) {
      print("Connection error");
      print(e);
    }, onDone: () {
      print('Connected closed');
    });

    final messageLength = 4 + 4 + 16 + nameBytes.length + 4;
    print('messageLength: ${messageLength}');
    Uint8List data = Uint8List(messageLength);

    final buffer = ByteData.view(data.buffer);
    // set length
    buffer.setInt32(0, messageLength, Endian.little); // 4 bytes length
    // Init command
    buffer.setInt32(4, 1, Endian.little); // 4 bytes command: 1 = init

    // client guid
    final guid = List.generate(16, (index) => 0x00);
    data.setAll(8, guid.reversed);

    // name
    data.setAll(24, nameBytes);

    // version
    buffer.setInt32(8 + 16 + nameBytes.length, 1, Endian.little);

    dumpHexData(data);

    socket.add(data);
    await socket.flush();
    print('flush complete');

    await Future.delayed(const Duration(seconds: 10));
    subscription.cancel();
    socket.destroy();

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
