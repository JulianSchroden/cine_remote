import 'package:flutter/foundation.dart';

import 'models/camera_update_response.dart';
import 'models/control_prop.dart';
import 'models/control_prop_type.dart';

abstract class Camera {
  const Camera();

  Future<List<ControlPropType>> getSupportedProps();
  Future<ControlProp?> getProp(ControlPropType propType);
  Future<void> setProp(ControlPropType propType, String value);

  Future<void> triggerRecord();
  Future<void> toggleAfLock();

  Future<CameraUpdateResponse> getUpdate();

  // TODO: refactor liveView feature to stream of images
  // TODO: refactor getUpdate to stream of updates
  Future<void> startLiveView();
  Future<void> stopLiveView();
  Future<Uint8List> getLiveViewImage();
}
