import 'dart:typed_data';

import 'models/camera_descriptor.dart';
import 'models/camera_update_event.dart';
import 'models/control_prop.dart';
import 'models/control_prop_type.dart';
import 'models/control_prop_value.dart';

abstract class Camera {
  const Camera();

  Future<void> close();
  Future<void> disconnect();

  Future<CameraDescriptor> getDescriptor();
  Future<ControlProp?> getProp(ControlPropType propType);
  Future<void> setProp(ControlPropType propType, ControlPropValue propValue);

  Future<void> captureImage();
  Future<void> triggerRecord();
  Future<void> toggleAfLock();

  Stream<CameraUpdateEvent> events();

  Stream<Uint8List> liveView({
    Duration pollInterval = const Duration(milliseconds: 200),
  });
}
