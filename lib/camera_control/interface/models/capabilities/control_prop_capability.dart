import 'camera_capability.dart';
import '../control_prop_type.dart';

class ControlPropCapability extends CameraCapability {
  final List<ControlPropType> supportedProps;

  const ControlPropCapability(this.supportedProps);

  @override
  List<Object?> get props => [supportedProps];
}
