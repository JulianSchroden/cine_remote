import '../../interface/models/camera_update_event.dart';
import '../communication/events/prop_value_changed.dart';
import '../communication/events/ptp_event.dart';

class PtpEventMapper {
  const PtpEventMapper();

  List<CameraUpdateEvent> mapToCommon(List<PtpEvent> ptpEvents) {
    final cameraUpdateEvents = <CameraUpdateEvent>[];

    for (final event in ptpEvents) {
      if (event is PropValueChanged && event.propType != null) {
        cameraUpdateEvents
            .add(CameraUpdateEvent.prop(event.propType!, event.propValue));
      }
    }

    return cameraUpdateEvents;
  }
}
