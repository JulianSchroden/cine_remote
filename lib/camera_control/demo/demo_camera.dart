import 'dart:async';

import 'package:flutter/services.dart';

import '../common/base_camera.dart';
import '../interface/models/camera_descriptor.dart';
import '../interface/models/camera_update_event.dart';
import '../interface/models/capabilities/control_prop_capability.dart';
import '../interface/models/capabilities/live_view_capability.dart';
import '../interface/models/capabilities/movie_record_capability.dart';
import '../interface/models/control_prop.dart';
import '../interface/models/control_prop_type.dart';
import '../interface/models/control_prop_value.dart';
import '../interface/models/properties/camera_mode.dart';
import '../interface/models/properties/exposure_mode.dart';

class DemoCamera extends BaseCamera {
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
  final _updateStreamController =
      StreamController<CameraUpdateEvent>.broadcast();

  @override
  Future<void> disconnect() async {}

  @override
  Future<CameraDescriptor> getDescriptor() async {
    return CameraDescriptor(
      mode: const CameraMode.photo(ExposureMode.manual),
      capabilities: [
        ControlPropCapability(
          supportedProps: _dummyControlProps.map((prop) => prop.type).toList(),
        ),
        const LiveViewCapability(aspectRatio: 16 / 9),
        const MovieRecordCapility(),
      ],
    );
  }

  @override
  Future<ControlProp?> getProp(ControlPropType propType) async {
    return _dummyControlProps.firstWhere((prop) => prop.type == propType);
  }

  @override
  Stream<CameraUpdateEvent> events() => _updateStreamController.stream;

  @override
  Future<void> setProp(
      ControlPropType propType, ControlPropValue propValue) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final propIndex =
        _dummyControlProps.indexWhere((prop) => prop.type == propType);
    _dummyControlProps[propIndex] =
        _dummyControlProps[propIndex].copyWith(currentValue: propValue);

    _updateStreamController
        .add(CameraUpdateEvent.propValueChanged(propType, propValue));
  }

  @override
  Future<void> toggleAfLock() async {}

  @override
  Future<void> captureImage() async {}

  @override
  Future<void> triggerRecord() async {
    await Future.delayed(const Duration(milliseconds: 200));
    _reordState = !_reordState;

    _updateStreamController.add(CameraUpdateEvent.recordState(_reordState));
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
