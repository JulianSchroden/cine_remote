import '../../interface/models/control_prop_type.dart';
import '../actions/get_events_action.dart';
import '../models/eos_ptp_prop_value.dart';
import 'init_session_action.dart';
import 'set_prop_action.dart';

class ActionFactory {
  const ActionFactory();

  InitSessionAction createInitSessionAction() => InitSessionAction();

  GetEventsAction createGetEventsAction() => GetEventsAction();

  SetPropAction createSetPropAction(
    ControlPropType propType,
    EosPtpPropValue propValue,
  ) =>
      SetPropAction(propType, propValue);
}
