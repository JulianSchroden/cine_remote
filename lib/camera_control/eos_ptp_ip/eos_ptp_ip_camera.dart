import 'dart:io';
import 'dart:typed_data';

import '../interface/camera.dart';
import '../interface/models/camera_handle.dart';
import '../interface/models/camera_update_response.dart';
import '../interface/models/control_prop.dart';
import '../interface/models/control_prop_type.dart';
import 'communication/ptp_ip_client.dart';

class EosPtpIpCamera extends Camera {
  PtpIpClient? _client;

  @override
  Future<CameraHandle> connect() async {
    final guid = Uint8List.fromList(List.generate(16, (index) => 0x00));

    _client = await PtpIpClient.connect(
        address: InternetAddress.tryParse('192.168.178.43')!,
        port: 15740,
        clientName: 'Cine Remote',
        guid: guid);

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
