import 'dart:async';

import '../../common/polled_data_stream_controller.dart';
import '../../interface/exceptions/camera_communication_exception.dart';
import '../../interface/models/camera_update_event.dart';
import '../actions/action_factory.dart';
import '../cache/ptp_property_cache.dart';
import '../communication/events/prop_value_changed.dart';
import '../communication/events/ptp_event.dart';
import '../communication/ptp_transaction_queue.dart';
import '../extensions/int_as_hex_string_extension.dart';
import 'ptp_event_mapper.dart';

class EosPtpEventProcessor {
  final PtpTransactionQueue _transactionQueue;
  final ActionFactory _actionFactory;
  final PtpEventMapper _eventMapper;

  final PtpPropertyCache _propertyCache;
  PolledDataStreamController<PtpEvent>? _eventController;

  EosPtpEventProcessor(
    this._transactionQueue,
    this._actionFactory,
    this._propertyCache, [
    this._eventMapper = const PtpEventMapper(),
  ]);

  PtpPropertyCache get propertyCache => _propertyCache;

  Stream<PtpEvent> get eosEvents {
    _eventController ??= PolledDataStreamController<PtpEvent>(
      pollInterval: const Duration(milliseconds: 500),
      pollData: (sink) async {
        final events = await _getUpdate();
        _propertyCache.update(events);
        await sink.addStream(Stream.fromIterable(events));
      },
      broadcast: true,
    );

    return _eventController!.stream;
  }

  Stream<CameraUpdateEvent> get events =>
      eosEvents.transform(StreamTransformer.fromHandlers(
        handleData: (eosEvent, sink) {
          final mappedEvent = _eventMapper.mapToCommon(eosEvent);

          if (mappedEvent != null) {
            sink.add(mappedEvent);
          }
        },
      ));

  Future<PropValueChanged> waitForPropValueChanged(
    int propCode,
    int propValue, {
    Duration timeLimit = const Duration(seconds: 3),
  }) async {
    try {
      final propEvent = await eosEvents
          .firstWhere((event) =>
              event is PropValueChanged &&
              event.propCode == propCode &&
              event.propValue.nativeValue == propValue)
          .timeout(timeLimit);
      return propEvent as PropValueChanged;
    } catch (e) {
      throw CameraCommunicationException(
        'Did not receive change event for property ${propCode.asHex(padLeft: 4)} to value ${propValue.asHex(padLeft: 4)} in time',
      );
    }
  }

  Future<List<PtpEvent>> _getUpdate() {
    final getEvents = _actionFactory.createGetEventsAction();
    return getEvents.run(_transactionQueue);
  }
}
