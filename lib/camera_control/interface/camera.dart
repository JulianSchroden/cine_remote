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

  Future<CameraUpdateResponse> getUpdate();

  // TODO: refactor liveView feature to stream of images
  // TODO: refactor getUpdate to stream of updates
  Future<void> startLiveView();
  Future<void> stopLiveView();
  Future<Uint8List> getLiveViewImage();
}
