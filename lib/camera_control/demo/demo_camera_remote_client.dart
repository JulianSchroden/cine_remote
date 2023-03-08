import 'dart:async';

import 'package:flutter/services.dart';

import '../eos_cine_http/models/eos_cine_http_camera_handle.dart';
import '../interface/models/camera_handle.dart';
import '../interface/models/camera_update_event.dart';
import '../interface/models/camera_update_response.dart';
import '../interface/models/control_prop.dart';
import '../interface/models/control_prop_type.dart';
import '../interface/camera_remote_client.dart';

class FakeCameraRemoteService extends CameraRemoteClient {
  final List<ControlProp> _dummyControlProps = [
    const ControlProp(
      type: ControlPropType.iso,
      currentValue: '100',
      allowedValues: ['100', '200', '400'],
    ),
    const ControlProp(
      type: ControlPropType.aperture,
      currentValue: '2.8',
      allowedValues: ['2.8', '4.0', '5.6'],
    ),
    const ControlProp(
      type: ControlPropType.shutterAngle,
      currentValue: '180',
      allowedValues: ['90', '180', '270', '360'],
    ),
    ControlProp(
      type: ControlPropType.whiteBalance,
      currentValue: '5600',
      allowedValues:
          List.generate(50, (index) => (2000 + index * 100).toString()),
    )
  ];
  bool _reordState = false;
  final List<CameraUpdateEvent> _pendingUpdateEvents = [];

  @override
  Future<CameraHandle> connect() async {
    await Future.delayed(const Duration(seconds: 1));

    return EosCineHttpCameraHandle(
      cookies: const [],
      supportedProps: _dummyControlProps.map((prop) => prop.type).toList(),
    );
  }

  @override
  Future<ControlProp?> getProp(
      CameraHandle handle, ControlPropType propType) async {
    return _dummyControlProps.firstWhere((prop) => prop.type == propType);
  }

  @override
  Future<CameraUpdateResponse> getUpdate(CameraHandle handle) async {
    final response = CameraUpdateResponse(
      cameraHandle: handle,
      cameraEvents: [..._pendingUpdateEvents],
    );
    _pendingUpdateEvents.clear();

    return response;
  }

  @override
  Future<void> setProp(
      CameraHandle handle, ControlPropType propType, String value) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final propIndex =
        _dummyControlProps.indexWhere((prop) => prop.type == propType);
    _dummyControlProps[propIndex] =
        _dummyControlProps[propIndex].copyWith(currentValue: value);
    _pendingUpdateEvents.add(CameraUpdateEvent.prop(propType, value));
  }

  @override
  Future<void> toggleAfLock(CameraHandle handle) async {}

  @override
  Future<void> triggerRecord(CameraHandle handle) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _reordState = !_reordState;
    _pendingUpdateEvents.add(CameraUpdateEvent.recordState(_reordState));
  }

  @override
  Future<void> startLiveView(CameraHandle handle) async {}

  @override
  Future<void> stopLiveView(CameraHandle handle) async {}

  @override
  Future<Uint8List> getLiveViewImage(CameraHandle handle) async {
    ByteData byteData =
        await rootBundle.load('assets/images/dummy_live_view_image.jpg');

    return byteData.buffer.asUint8List();
  }
}