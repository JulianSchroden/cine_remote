import 'dart:async';

import '../../domain/models/camera_handle.dart';
import '../../domain/models/camera_update_event.dart';
import '../../domain/models/camera_update_response.dart';
import '../../domain/models/control_prop.dart';
import '../../domain/models/control_prop_type.dart';
import '../../domain/services/camera_remote_service.dart';
import '../models/wifi_camera_handle.dart';

class FakeCameraRemoteService extends CameraRemoteService {
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

    return WifiCameraHandle(
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
}
