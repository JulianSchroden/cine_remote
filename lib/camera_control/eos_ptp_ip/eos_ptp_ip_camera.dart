import 'dart:typed_data';

import '../interface/camera.dart';
import '../interface/models/camera_update_response.dart';
import '../interface/models/control_prop.dart';
import '../interface/models/control_prop_type.dart';
import '../interface/models/control_prop_value.dart';
import 'actions/action_factory.dart';
import 'adapter/ptp_event_mapper.dart';
import 'cache/ptp_property_cache.dart';
import 'communication/ptp_transaction_queue.dart';
import 'models/eos_ptp_prop_value.dart';

class EosPtpIpCamera extends Camera {
  final PtpTransactionQueue _transactionQueue;
  final ActionFactory _actionFactory;
  final PtpPropertyCache _propertyCache;
  final PtpEventMapper _eventMapper;

  const EosPtpIpCamera(
    this._transactionQueue,
    this._actionFactory,
    this._propertyCache, [
    this._eventMapper = const PtpEventMapper(),
  ]);

  @override
  Future<List<ControlPropType>> getSupportedProps() async {
    return _propertyCache.supportedProps();
  }

  @override
  Future<ControlProp?> getProp(ControlPropType propType) async {
    return _propertyCache.getProp(propType);
  }

  @override
  Future<void> setProp(
    ControlPropType propType,
    ControlPropValue propValue,
  ) async {
    final setPropAction = _actionFactory.createSetPropAction(
      propType,
      propValue as EosPtpPropValue,
    );
    await setPropAction.run(_transactionQueue);
  }

  @override
  Future<CameraUpdateResponse> getUpdate() async {
    final getEvents = _actionFactory.createGetEventsAction();
    final ptpEvents = await getEvents.run(_transactionQueue);

    _propertyCache.update(ptpEvents);

    final mappedEvents = _eventMapper.mapToCommon(ptpEvents);
    return CameraUpdateResponse(cameraEvents: mappedEvents);
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
