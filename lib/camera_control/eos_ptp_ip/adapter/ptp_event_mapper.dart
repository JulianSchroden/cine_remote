import '../../interface/models/camera_update_event.dart';
import '../communication/events/allowed_values_changed.dart';
import '../communication/events/prop_value_changed.dart';
import '../communication/events/ptp_event.dart';

class PtpEventMapper {
  const PtpEventMapper();

  CameraUpdateEvent? mapToCommon(PtpEvent ptpEvent) {
    switch (ptpEvent) {
      case PropValueChanged(:var propType?, :var propValue):
        return CameraUpdateEvent.propValueChanged(propType, propValue);
      case AllowedValuesChanged(:var propType?, :var allowedValues):
        return CameraUpdateEvent.propAllowedValuesChanged(
            propType, allowedValues);
    }

    return null;
  }
}
