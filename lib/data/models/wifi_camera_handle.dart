import 'dart:io';

import '../../domain/models/camera_handle.dart';
import '../../domain/models/control_prop_type.dart';

class WifiCameraHandle extends CameraHandle {
  final List<Cookie> cookies;
  final int updateCounter;

  const WifiCameraHandle({
    required this.cookies,
    this.updateCounter = 0,
    required super.supportedProps,
  });

  @override
  List<Object?> get props => [cookies, updateCounter, ...super.props];

  WifiCameraHandle copyWith({
    List<Cookie>? cookies,
    int? updateCounter,
    List<ControlPropType>? supportedProps,
  }) {
    return WifiCameraHandle(
      cookies: cookies ?? this.cookies,
      updateCounter: updateCounter ?? this.updateCounter,
      supportedProps: supportedProps ?? this.supportedProps,
    );
  }
}
