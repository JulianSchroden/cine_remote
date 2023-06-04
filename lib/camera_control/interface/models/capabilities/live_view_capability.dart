import 'camera_capability.dart';

class LiveViewCapability extends CameraCapability {
  final double aspectRatio;
  final bool supportsTouchAutofocus;

  const LiveViewCapability({
    required this.aspectRatio,
    required this.supportsTouchAutofocus,
  });

  @override
  List<Object?> get props => [aspectRatio];
}
