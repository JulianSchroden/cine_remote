import '../interface/models/camera_handle.dart';

class EosCineHttpCameraHandle extends CameraHandle {
  final String address;

  const EosCineHttpCameraHandle({
    required super.model,
    this.address = '192.168.0.80',
  });

  @override
  List<Object?> get props => [...super.props, address];
}
