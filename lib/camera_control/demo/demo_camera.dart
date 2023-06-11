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
import '../interface/models/live_view_data.dart';
import '../interface/models/properties/autofocus_position.dart';
import '../interface/models/properties/camera_mode.dart';
import '../interface/models/properties/exposure_mode.dart';
import 'models/demo_prop_value.dart';

class DemoCamera extends BaseCamera {
  final List<ControlProp> _dummyControlProps = [
    ControlProp(
      type: ControlPropType.iso,
      currentValue: const DemoPropValue('100'),
      allowedValues:
          ['100', '200', '400'].map((value) => DemoPropValue(value)).toList(),
    ),
    ControlProp(
      type: ControlPropType.aperture,
      currentValue: const DemoPropValue('2.8'),
      allowedValues:
          ['2.8', '4.0', '5.6'].map((value) => DemoPropValue(value)).toList(),
    ),
    ControlProp(
      type: ControlPropType.shutterAngle,
      currentValue: const DemoPropValue('180'),
      allowedValues: ['90', '180', '270', '360']
          .map((value) => DemoPropValue(value))
          .toList(),
    ),
    ControlProp(
      type: ControlPropType.whiteBalance,
      currentValue: const DemoPropValue('5600'),
      allowedValues: List.generate(
          50, (index) => DemoPropValue((2000 + index * 100).toString())),
    )
  ];
  bool _reordState = false;
  final _updateStreamController =
      StreamController<CameraUpdateEvent>.broadcast();

  @override
  Future<void> close() async {}

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
        const LiveViewCapability(
          aspectRatio: 16 / 9,
          supportsTouchAutofocus: true,
        ),
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
  Future<LiveViewData> getLiveViewData() async {
    ByteData byteData =
        await rootBundle.load('assets/images/dummy_live_view_image.jpg');

    return LiveViewData(imageBytes: byteData.buffer.asUint8List());
  }

  @override
  Future<void> setAutofocusPosition(
      AutofocusPosition autofocusPosition) async {}
}
