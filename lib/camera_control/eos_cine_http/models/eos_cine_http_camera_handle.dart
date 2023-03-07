import 'dart:io';

import '../../interface/models/camera_handle.dart';
import '../../interface/models/control_prop_type.dart';

class EosCineHttpCameraHandle extends CameraHandle {
  final List<Cookie> cookies;
  final int updateCounter;

  const EosCineHttpCameraHandle({
    required this.cookies,
    this.updateCounter = 0,
    required super.supportedProps,
  });

  @override
  List<Object?> get props => [cookies, updateCounter, ...super.props];

  EosCineHttpCameraHandle copyWith({
    List<Cookie>? cookies,
    int? updateCounter,
    List<ControlPropType>? supportedProps,
  }) {
    return EosCineHttpCameraHandle(
      cookies: cookies ?? this.cookies,
      updateCounter: updateCounter ?? this.updateCounter,
      supportedProps: supportedProps ?? this.supportedProps,
    );
  }
}
