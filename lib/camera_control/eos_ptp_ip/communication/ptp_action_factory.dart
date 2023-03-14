import 'actions/open_session_action.dart';

class PtpActionFactory {
  const PtpActionFactory();

  OpenSesionAction createOpenSesionAction({required int sessionId}) =>
      OpenSesionAction(sessionId: sessionId);
}
