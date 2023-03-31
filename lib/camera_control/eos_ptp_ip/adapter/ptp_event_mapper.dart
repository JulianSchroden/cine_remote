import '../../interface/models/camera_update_event.dart';
import '../communication/events/prop_value_changed.dart';
import '../communication/events/ptp_event.dart';

class PtpEventMapper {
  const PtpEventMapper();

  CameraUpdateEvent? mapToCommon(PtpEvent ptpEvents) {
    if (ptpEvents is PropValueChanged && ptpEvents.propType != null) {
      return CameraUpdateEvent.prop(ptpEvents.propType!, ptpEvents.propValue);
    }

    return null;
  }
}
