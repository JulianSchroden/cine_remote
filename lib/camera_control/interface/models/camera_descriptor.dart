import 'package:equatable/equatable.dart';

import '../exceptions/unsupported_capability_exception.dart';
import 'capabilities/camera_capability.dart';
import 'properties/camera_mode.dart';

class CameraDescriptor extends Equatable {
  final CameraMode mode;
  final List<CameraCapability> capabilities;

  const CameraDescriptor({required this.mode, required this.capabilities});

  @override
  List<Object?> get props => [mode, capabilities];

  C getCapability<C extends CameraCapability>() {
    try {
      final capability = capabilities.firstWhere((element) => element is C);
      return capability as C;
    } catch (e) {
      throw UnsupportedCapabilityException();
    }
  }

  bool hasCapability<C extends CameraCapability>() {
    try {
      getCapability();
      return true;
    } catch (e) {
      return false;
    }
  }
}
