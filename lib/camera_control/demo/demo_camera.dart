import 'dart:async';

import 'package:flutter/services.dart';

import '../interface/camera.dart';
import '../interface/models/camera_update_event.dart';
import '../interface/models/camera_update_response.dart';
import '../interface/models/control_prop.dart';
import '../interface/models/control_prop_type.dart';
import '../interface/models/control_prop_value.dart';

class DemoCamera extends Camera {
  final List<ControlProp> _dummyControlProps = [
    ControlProp(
      type: ControlPropType.iso,
      currentValue: const ControlPropValue('100'),
      allowedValues: ['100', '200', '400']
          .map((value) => ControlPropValue(value))
          .toList(),
    ),
    ControlProp(
      type: ControlPropType.aperture,
      currentValue: const ControlPropValue('2.8'),
      allowedValues: ['2.8', '4.0', '5.6']
          .map((value) => ControlPropValue(value))
          .toList(),
    ),
    ControlProp(
      type: ControlPropType.shutterAngle,
      currentValue: const ControlPropValue('180'),
      allowedValues: ['90', '180', '270', '360']
          .map((value) => ControlPropValue(value))
          .toList(),
    ),
    ControlProp(
      type: ControlPropType.whiteBalance,
      currentValue: const ControlPropValue('5600'),
      allowedValues: List.generate(
          50, (index) => ControlPropValue((2000 + index * 100).toString())),
    )
  ];
  bool _reordState = false;
  final List<CameraUpdateEvent> _pendingUpdateEvents = [];

  @override
  Future<List<ControlPropType>> getSupportedProps() async {
    return _dummyControlProps.map((prop) => prop.type).toList();
  }

  @override
  Future<ControlProp?> getProp(ControlPropType propType) async {
    return _dummyControlProps.firstWhere((prop) => prop.type == propType);
  }

  @override
  Future<CameraUpdateResponse> getUpdate() async {
    final response = CameraUpdateResponse(
      cameraEvents: [..._pendingUpdateEvents],
    );
    _pendingUpdateEvents.clear();

    return response;
  }

  @override
  Future<void> setProp(ControlPropType propType, ControlPropValue value) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final propIndex =
        _dummyControlProps.indexWhere((prop) => prop.type == propType);
    _dummyControlProps[propIndex] =
        _dummyControlProps[propIndex].copyWith(currentValue: value);
    _pendingUpdateEvents.add(CameraUpdateEvent.prop(propType, value));
  }

  @override
  Future<void> toggleAfLock() async {}

  @override
  Future<void> triggerRecord() async {
    await Future.delayed(const Duration(milliseconds: 200));
    _reordState = !_reordState;
    _pendingUpdateEvents.add(CameraUpdateEvent.recordState(_reordState));
  }

  @override
  Future<void> startLiveView() async {}

  @override
  Future<void> stopLiveView() async {}

  @override
  Future<Uint8List> getLiveViewImage() async {
    ByteData byteData =
        await rootBundle.load('assets/images/dummy_live_view_image.jpg');

    return byteData.buffer.asUint8List();
  }
}
