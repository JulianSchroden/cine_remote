import 'dart:typed_data';

import 'get_event_data.dart';
import 'open_session.dart';
import 'set_event_mode.dart';
import 'set_prop_value.dart';
import 'set_remote_mode.dart';

class PtpOperationFactory {
  const PtpOperationFactory();

  OpenSession createOpenSession({required int sessionId}) =>
      OpenSession(sessionId);

  SetRemoteMode createSetRemoteMode() => const SetRemoteMode();

  SetEventMode createSetEventMode() => const SetEventMode();

  GetEventData createGetEventData() => const GetEventData();

  SetPropValue createSetPropValue(int propCode, Uint8List propValue) =>
      SetPropValue(propCode, propValue);
}