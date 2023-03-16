import 'actions/get_event_data_action.dart';
import 'actions/open_session_action.dart';
import 'actions/set_event_mode_action.dart';
import 'actions/set_remote_mode_action.dart';

class PtpActionFactory {
  const PtpActionFactory();

  OpenSesionAction createOpenSesionAction({required int sessionId}) =>
      OpenSesionAction(sessionId: sessionId);

  SetRemoteModeAction createSetRemoteModeAction() => SetRemoteModeAction();

  SetEventModeAction createSetEventModeAction() => SetEventModeAction();

  GetEventDataAction createGetEventDataAction() => GetEventDataAction();
}
