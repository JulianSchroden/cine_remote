import 'dart:typed_data';

import '../../constants/capture_phase.dart';
import '../../constants/event_mode.dart';
import '../../constants/remote_mode.dart';
import 'close_session.dart';
import 'get_event_data.dart';
import 'get_live_view_image.dart';
import 'open_session.dart';
import 'set_event_mode.dart';
import 'set_prop_value.dart';
import 'set_remote_mode.dart';
import 'start_image_capture.dart';
import 'stop_image_capture.dart';

class PtpOperationFactory {
  const PtpOperationFactory();

  OpenSession createOpenSession({required int sessionId}) =>
      OpenSession(sessionId);

  CloseSession createCloseSession() => CloseSession();

  SetRemoteMode createSetRemoteMode(RemoteMode remoteMode) =>
      SetRemoteMode(remoteMode);

  SetEventMode createSetEventMode(EventMode eventMode) =>
      SetEventMode(eventMode);

  GetEventData createGetEventData() => const GetEventData();

  SetPropValue createSetPropValue(int propCode, Uint8List propValue) =>
      SetPropValue(propCode, propValue);

  StartImageCapture createStartImageCapture(CapturePhase capturePhase) =>
      StartImageCapture(capturePhase);

  StopImageCapture createStopImageCapture(CapturePhase capturePhase) =>
      StopImageCapture(capturePhase);

  GetLiveViewImage createGetLiveViewImage() => const GetLiveViewImage();
}
