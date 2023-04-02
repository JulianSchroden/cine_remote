import '../../interface/models/control_prop_type.dart';
import '../actions/get_events_action.dart';
import '../adapter/eos_ptp_event_processor.dart';
import '../constants/properties/live_view_output.dart';
import '../models/eos_ptp_prop_value.dart';
import 'capture_image_action.dart';
import 'deinit_session_action.dart';
import 'get_device_info_action.dart';
import 'get_live_view_image_action.dart';
import 'init_session_action.dart';
import 'set_live_view_output_action.dart';
import 'set_prop_action.dart';

class ActionFactory {
  const ActionFactory();

  GetDeviceInfoAction createGetDeviceInfoAction() => GetDeviceInfoAction();

  InitSessionAction createInitSessionAction() => InitSessionAction();

  DeinitSessionAction createDeinitSessionAction() => DeinitSessionAction();

  GetEventsAction createGetEventsAction() => GetEventsAction();

  SetPropAction createSetPropAction(
    ControlPropType propType,
    EosPtpPropValue propValue,
  ) =>
      SetPropAction(propType, propValue);

  CaptureImageAction createCaptureImageAction() => CaptureImageAction();

  SetLiveViewOutputAction createSetLiveViewOutputAction(
    EosPtpEventProcessor eventProcessor,
    LiveViewOutput liveViewOutput,
  ) =>
      SetLiveViewOutputAction(eventProcessor, liveViewOutput);

  GetLiveViewImageAction createGetLiveViewImageAction() =>
      GetLiveViewImageAction();
}
