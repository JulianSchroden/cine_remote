import '../communication/events/prop_value_changed.dart';
import '../constants/ptp_property.dart';
import '../models/eos_sensor_info.dart';
import '../models/eos_sensor_info_prop_value.dart';
import 'ptp_property_cache.dart';

extension PtpPropertyCacheSensorInfoExtension on PtpPropertyCache {
  void updateSensorInfo(EosSensorInfo sensorInfo) {
    update([
      PropValueChanged(
        PtpPropertyCode.liveViewSensorResolution,
        null,
        EosSensorInfoPropValue(sensorInfo),
      )
    ]);
  }

  EosSensorInfo? getSensorInfo() {
    final cachedValue =
        getValueByPropCode(PtpPropertyCode.liveViewSensorResolution);
    if (cachedValue case EosSensorInfoPropValue(:final sensorInfo)) {
      return sensorInfo;
    }

    return null;
  }
}
