import 'dart:typed_data';

import 'models/camera_update_response.dart';
import 'models/control_prop.dart';
import 'models/control_prop_type.dart';
import 'models/control_prop_value.dart';

abstract class Camera {
  const Camera();

  Future<void> disconnect();

  Future<List<ControlPropType>> getSupportedProps();
  Future<ControlProp?> getProp(ControlPropType propType);
  Future<void> setProp(ControlPropType propType, ControlPropValue propValue);

  Future<void> triggerRecord();
  Future<void> toggleAfLock();

  Stream<CameraUpdateResponse> events({
    Duration pollInterval = const Duration(milliseconds: 200),
  });

  Stream<Uint8List> liveView({
    Duration pollInterval = const Duration(milliseconds: 200),
  });
}
