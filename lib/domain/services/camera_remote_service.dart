import '../models/camera_handle.dart';
import '../models/camera_update_response.dart';
import '../models/control_prop.dart';
import '../models/control_prop_type.dart';

abstract class CameraRemoteService<H extends CameraHandle> {
  Future<CameraHandle> connect();

  Future<ControlProp?> getProp(H handle, ControlPropType propType);
  Future<void> setProp(H handle, ControlPropType propType, String value);

  Future<void> triggerRecord(H handle);
  Future<void> toggleAfLock(H handle);

  Future<CameraUpdateResponse> getUpdate(H handle);
}
