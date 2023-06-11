import 'dart:async';

import '../../common/polled_data_stream_controller.dart';
import '../../interface/exceptions/camera_communication_exception.dart';
import '../../interface/models/camera_update_event.dart';
import '../cache/ptp_property_cache.dart';
import '../communication/events/prop_value_changed.dart';
import '../communication/events/ptp_event.dart';
import '../extensions/int_as_hex_string_extension.dart';
import '../models/eos_ptp_int_prop_value.dart';
import 'get_eos_events_delegate.dart';
import 'ptp_event_mapper.dart';

class EosPtpEventProcessor {
  final GetEosEventsDelegate _getEosEventsDelegate;
  final PtpEventMapper _eventMapper;
  final PtpPropertyCache _propertyCache;

  PolledDataStreamController<PtpEvent>? _eventController;

  EosPtpEventProcessor(
    this._getEosEventsDelegate,
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
      final propEvent = await eosEvents.firstWhere((event) {
        if (event
            case PropValueChanged(
              propCode: final code,
              propType: _,
              propValue: EosPtpIntPropValue(:final nativeValue)
            )) {
          return propCode == code && propValue == nativeValue;
        }

        return false;
      }).timeout(timeLimit);
      return propEvent as PropValueChanged;
    } catch (e) {
      throw CameraCommunicationException(
        'Did not receive change event for property ${propCode.asHex(padLeft: 4)} to value ${propValue.asHex(padLeft: 4)} in time',
      );
    }
  }

  Future<List<PtpEvent>> _getUpdate() => _getEosEventsDelegate.getEvents();
}
