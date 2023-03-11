import 'dart:io';
import 'dart:typed_data';

import '../interface/camera.dart';
import '../interface/models/camera_update_response.dart';
import '../interface/models/control_prop.dart';
import '../interface/models/control_prop_type.dart';
import 'communication/ptp_ip_client.dart';

class EosPtpIpCamera extends Camera {
  final PtpIpClient client;

  const EosPtpIpCamera(this.client);

  @override
  Future<Uint8List> getLiveViewImage() {
    // TODO: implement getLiveViewImage
    throw UnimplementedError();
  }

  @override
  Future<ControlProp?> getProp(ControlPropType propType) {
    // TODO: implement getProp
    throw UnimplementedError();
  }

  @override
  Future<CameraUpdateResponse> getUpdate() {
    // TODO: implement getUpdate
    throw UnimplementedError();
  }

  @override
  Future<void> setProp(ControlPropType propType, String value) {
    // TODO: implement setProp
    throw UnimplementedError();
  }

  @override
  Future<void> startLiveView() {
    // TODO: implement startLiveView
    throw UnimplementedError();
  }

  @override
  Future<void> stopLiveView() {
    // TODO: implement stopLiveView
    throw UnimplementedError();
  }

  @override
  Future<void> toggleAfLock() {
    // TODO: implement toggleAfLock
    throw UnimplementedError();
  }

  @override
  Future<void> triggerRecord() {
    // TODO: implement triggerRecord
    throw UnimplementedError();
  }

  @override
  Future<List<ControlPropType>> getSupportedProps() {
    // TODO: implement getSupportedProps
    throw UnimplementedError();
  }
}
