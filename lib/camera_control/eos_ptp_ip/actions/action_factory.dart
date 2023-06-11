import '../../interface/models/control_prop_type.dart';
import '../../interface/models/properties/autofocus_position.dart';
import '../actions/get_events_action.dart';
import '../adapter/eos_ptp_event_processor.dart';
import '../cache/ptp_property_cache.dart';
import '../constants/properties/live_view_output.dart';
import '../models/eos_ptp_int_prop_value.dart';
import '../models/eos_sensor_info.dart';
import 'capture_image_action.dart';
import 'deinit_session_action.dart';
import 'get_device_info_action.dart';
import 'get_live_view_image_action.dart';
import 'init_session_action.dart';
import 'set_live_view_output_action.dart';
import 'set_prop_action.dart';
import 'set_touch_af_position_action.dart';

class ActionFactory {
  const ActionFactory();

  GetDeviceInfoAction createGetDeviceInfoAction() => GetDeviceInfoAction();

  InitSessionAction createInitSessionAction() => InitSessionAction();

  DeinitSessionAction createDeinitSessionAction() => DeinitSessionAction();

  GetEventsAction createGetEventsAction() => GetEventsAction();

  SetPropAction createSetPropAction(
    ControlPropType propType,
    EosPtpIntPropValue propValue,
  ) =>
      SetPropAction(propType, propValue);

  CaptureImageAction createCaptureImageAction() => CaptureImageAction();

  SetLiveViewOutputAction createSetLiveViewOutputAction(
    EosPtpEventProcessor eventProcessor,
    LiveViewOutput liveViewOutput,
  ) =>
      SetLiveViewOutputAction(eventProcessor, liveViewOutput);

  GetLiveViewImageAction createGetLiveViewImageAction(
          PtpPropertyCache propertyCache) =>
      GetLiveViewImageAction(propertyCache);

  SetTouchAfPositionAction createSetTouchAfPositionAction(
    AutofocusPosition focusPosition,
    EosSensorInfo sensorInfo,
    Duration focusDuration,
  ) =>
      SetTouchAfPositionAction(
        focusPosition,
        sensorInfo,
        focusDuration,
      );
}
