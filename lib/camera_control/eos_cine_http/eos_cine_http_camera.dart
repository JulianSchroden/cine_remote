import 'dart:typed_data';

import '../interface/camera.dart';
import '../interface/models/camera_update_response.dart';
import '../interface/models/control_prop.dart';
import '../interface/models/control_prop_type.dart';
import 'adapter/http_adapter.dart';
import 'communication/action_factory.dart';
import 'models/camera_info.dart';

class EosCineHttpCamera extends Camera {
  final HttpAdapter httpAdapter;
  final ActionFactory actionFactory;
  int _nextUpdateSequence = 0;

  EosCineHttpCamera(
    this.httpAdapter, [
    this.actionFactory = const ActionFactory(),
  ]);

  @override
  Future<List<ControlPropType>> getSupportedProps() async {
    return [
      ControlPropType.aperture,
      ControlPropType.iso,
      ControlPropType.shutterAngle,
      ControlPropType.whiteBalance,
    ];
  }

  @override
  Future<ControlProp?> getProp(
    ControlPropType propType,
  ) {
    final getPropAction =
        actionFactory.createGetPropAction(httpAdapter, propType);
    return getPropAction();
  }

  @override
  Future<void> setProp(
    ControlPropType propType,
    String value,
  ) async {
    final setPropAction =
        actionFactory.createSetPropAction(httpAdapter, propType, value);
    await setPropAction();
  }

  @override
  Future<void> triggerRecord() async {
    final triggerRecordAction =
        actionFactory.createTriggerRecordAction(httpAdapter);
    await triggerRecordAction();
  }

  @override
  Future<void> toggleAfLock() async {
    final toggleAfLockAction =
        actionFactory.createToggleAfLockAction(httpAdapter);
    await toggleAfLockAction();
  }

  @override
  Future<CameraUpdateResponse> getUpdate() async {
    final getUpdateAction =
        actionFactory.createGetUpdateAction(httpAdapter, _nextUpdateSequence);
    final response = await getUpdateAction();

    _nextUpdateSequence = response.updateSequnce;
    return CameraUpdateResponse(cameraEvents: response.cameraEvents);
  }

  @override
  Future<void> startLiveView() async {
    final startLiveViewAction =
        actionFactory.createStartLiveViewAction(httpAdapter);
    await startLiveViewAction();
  }

  @override
  Future<void> stopLiveView() async {
    final stopLiveViewAction =
        actionFactory.createStopLiveViewAction(httpAdapter);
    await stopLiveViewAction();
  }

  @override
  Future<Uint8List> getLiveViewImage() async {
    final getLiveViewImageAction =
        actionFactory.createGetLiveViewImageAction(httpAdapter);
    return getLiveViewImageAction();
  }

  Future<CameraInfo> getInfo() async {
    final getInfoAction = actionFactory.createGetInfoAction(httpAdapter);
    return getInfoAction();
  }
}
