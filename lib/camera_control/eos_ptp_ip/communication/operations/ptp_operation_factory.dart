import 'get_event_data.dart';
import 'open_session.dart';
import 'set_event_mode.dart';
import 'set_remote_mode.dart';

class PtpOperationFactory {
  const PtpOperationFactory();

  OpenSession createOpenSession({required int sessionId}) =>
      OpenSession(sessionId);

  SetRemoteMode createSetRemoteMode() => SetRemoteMode();

  SetEventMode createSetEventMode() => SetEventMode();

  GetEventData createGetEventData() => GetEventData();
}
