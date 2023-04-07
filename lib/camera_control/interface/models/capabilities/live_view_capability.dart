import 'camera_capability.dart';

class LiveViewCapability extends CameraCapability {
  final double aspectRatio;

  const LiveViewCapability({required this.aspectRatio});

  @override
  List<Object?> get props => [aspectRatio];
}
