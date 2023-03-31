import 'dart:async';
import 'dart:typed_data';

import '../common/base_camera.dart';
import '../common/polled_data_stream_controller.dart';
import '../interface/models/camera_update_event.dart';
import '../interface/models/control_prop.dart';
import '../interface/models/control_prop_type.dart';
import '../interface/models/control_prop_value.dart';
import 'actions/action_factory.dart';
import 'adapter/ptp_event_mapper.dart';
import 'cache/ptp_property_cache.dart';
import 'communication/events/prop_value_changed.dart';
import 'communication/events/ptp_event.dart';
import 'communication/ptp_transaction_queue.dart';
import 'constants/properties/live_view_output.dart';
import 'constants/ptp_property.dart';
import 'models/eos_ptp_prop_value.dart';

class EosPtpIpCamera extends BaseCamera {
  final PtpTransactionQueue _transactionQueue;
  final ActionFactory _actionFactory;
  final PtpPropertyCache _propertyCache;
  final PtpEventMapper _eventMapper;

  PolledDataStreamController<PtpEvent>? _eventController;

  EosPtpIpCamera(
    this._transactionQueue,
    this._actionFactory,
    this._propertyCache, [
    this._eventMapper = const PtpEventMapper(),
  ]);

  @override
  Future<void> disconnect() async {
    final deinitSession = _actionFactory.createDeinitSessionAction();
    await deinitSession.run(_transactionQueue);
    await _transactionQueue.close();
  }

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
  Stream<CameraUpdateEvent> events() {
    return eosEvents().transform(
      StreamTransformer.fromHandlers(
        handleData: (eosEvent, sink) {
          final mappedEvent = _eventMapper.mapToCommon(eosEvent);

          if (mappedEvent != null) {
            sink.add(mappedEvent);
          }
        },
      ),
    );
  }

  Stream<PtpEvent> eosEvents() {
    _eventController ??= PolledDataStreamController<PtpEvent>(
      pollInterval: const Duration(milliseconds: 500),
      pollData: (sink) async {
        final events = await _getUpdate();
        await sink.addStream(Stream.fromIterable(events));
      },
      broadcast: true,
    );

    return _eventController!.stream;
  }

  Future<List<PtpEvent>> _getUpdate() async {
    final getEvents = _actionFactory.createGetEventsAction();
    final ptpEvents = await getEvents.run(_transactionQueue);

    _propertyCache.update(ptpEvents);

    return ptpEvents;
  }

  @override
  Future<void> triggerRecord() async {
    print('start of triggerRecord');
    final captureImage = _actionFactory.createCaptureImageAction();

    await captureImage.run(_transactionQueue);
    print('stop of triggerReord');
  }

  @override
  Future<void> toggleAfLock() {
    // TODO: implement toggleAfLock
    throw UnimplementedError();
  }

  @override
  Future<void> startLiveView() async {
    print('startLiveView');
    final startLiveView = _actionFactory
        .createSetLiveViewOutputAction(LiveViewOutput.cameraAndHost);
    await startLiveView.run(_transactionQueue);

    await eosEvents().firstWhere((e) =>
        e is PropValueChanged && e.propCode == PtpPropertyCode.liveViewOutput);

    await Future.delayed(const Duration(seconds: 3));
    // TODO: wait for propertyChangedEvent with value cameraAndHost
  }

  @override
  Future<void> stopLiveView() async {
    final stopLiveView =
        _actionFactory.createSetLiveViewOutputAction(LiveViewOutput.none);
    await stopLiveView.run(_transactionQueue);
  }

  @override
  Future<Uint8List> getLiveViewImage() async {
    final getLiveViewImage = _actionFactory.createGetLiveViewImageAction();
    return await getLiveViewImage.run(_transactionQueue);
  }
}
