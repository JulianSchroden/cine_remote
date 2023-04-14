import '../control_prop_type.dart';
import 'camera_capability.dart';

class ControlPropCapability extends CameraCapability {
  final List<ControlPropType> supportedProps;

  const ControlPropCapability({required this.supportedProps});

  @override
  List<Object?> get props => [supportedProps];
}
