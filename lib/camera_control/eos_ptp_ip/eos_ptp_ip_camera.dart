import 'dart:typed_data';

import '../interface/camera.dart';
import '../interface/models/camera_update_response.dart';
import '../interface/models/control_prop.dart';
import '../interface/models/control_prop_type.dart';
import '../interface/models/control_prop_value.dart';
import 'cache/ptp_property_cache.dart';
import 'communication/ptp_action_factory.dart';
import 'communication/ptp_action_queue.dart';

class EosPtpIpCamera extends Camera {
  final PtpActionQueue _actionQueue;
  final PtpActionFactory _actionFactory;
  final PtpPropertyCache _propertyCache;

  const EosPtpIpCamera(
    this._actionQueue,
    this._actionFactory,
    this._propertyCache,
  );

  @override
  Future<List<ControlPropType>> getSupportedProps() async {
    return _propertyCache.supportedProps();
  }

  @override
  Future<ControlProp?> getProp(ControlPropType propType) async {
    return _propertyCache.getProp(propType);
  }

  @override
  Future<void> setProp(ControlPropType propType, ControlPropValue value) {
    // TODO: implement setProp action
    throw UnimplementedError();
  }

  @override
  Future<CameraUpdateResponse> getUpdate() async {
    final getEvents = _actionFactory.createGetEventsAction();
    final events = await getEvents.run(_actionQueue);

    _propertyCache.update(events);

    return CameraUpdateResponse(cameraEvents: []);
  }

  @override
  Future<void> triggerRecord() {
    // TODO: implement triggerRecord
    throw UnimplementedError();
  }

  @override
  Future<void> toggleAfLock() {
    // TODO: implement toggleAfLock
    throw UnimplementedError();
  }

  @override
  Future<void> startLiveView() {
    // TODO: implement startLiveView
    throw UnimplementedError();
  }

  @override
  Future<void> stopLiveView() {
    // TODO: implement stopLiveView
    throw UnimplementedError();
  }

  @override
  Future<Uint8List> getLiveViewImage() {
    // TODO: implement getLiveViewImage
    throw UnimplementedError();
  }
}
