import 'dart:typed_data';

import '../interface/camera.dart';
import '../interface/models/camera_update_response.dart';
import '../interface/models/control_prop.dart';
import '../interface/models/control_prop_type.dart';
import 'communication/ptp_action_factory.dart';
import 'communication/ptp_action_queue.dart';

class EosPtpIpCamera extends Camera {
  final PtpActionQueue _actionQueue;
  final PtpActionFactory _ptpActionFactory;

  const EosPtpIpCamera(this._actionQueue, this._ptpActionFactory);

  @override
  Future<List<ControlPropType>> getSupportedProps() async {
    return [];
  }

  @override
  Future<Uint8List> getLiveViewImage() {
    // TODO: implement getLiveViewImage
    throw UnimplementedError();
  }

  @override
  Future<ControlProp?> getProp(ControlPropType propType) {
    // TODO: implement getProp
    throw UnimplementedError();
  }

  @override
  Future<CameraUpdateResponse> getUpdate() async {
    final getEventData = _ptpActionFactory.createGetEventDataAction();
    final eventData = await getEventData.run(_actionQueue);

    return const CameraUpdateResponse(cameraEvents: []);
  }

  @override
  Future<void> setProp(ControlPropType propType, String value) {
    // TODO: implement setProp
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
  Future<void> toggleAfLock() {
    // TODO: implement toggleAfLock
    throw UnimplementedError();
  }

  @override
  Future<void> triggerRecord() {
    // TODO: implement triggerRecord
    throw UnimplementedError();
  }
}
