import 'eos_sensor_info.dart';
import '../../interface/models/control_prop_value.dart';

class EosSensorInfoPropValue extends ControlPropValue {
  final EosSensorInfo sensorInfo;

  const EosSensorInfoPropValue(this.sensorInfo);

  @override
  List<Object?> get props => [sensorInfo];

  @override
  String get value => sensorInfo.toString();
}
