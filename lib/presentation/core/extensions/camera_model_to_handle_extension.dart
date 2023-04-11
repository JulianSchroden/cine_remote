import 'dart:typed_data';

import '../../../camera_control/demo/demo_camera_handle.dart';
import '../../../camera_control/eos_cine_http/eos_cine_http_camera_handle.dart';
import '../../../camera_control/eos_ptp_ip/eos_ptp_ip_camera_handle.dart';
import '../../../camera_control/interface/camera_factory.dart';
import '../../../camera_control/interface/models/camera_handle.dart';
import '../../../camera_control/interface/models/camera_model.dart';

extension CameraModelToHandleExtension on CameraModel {
  CameraHandle toHandle() {
    switch (identifier) {
      case CameraId.canonC100II:
        return EosCineHttpCameraHandle(model: this);
      case CameraId.canon70D:
        return EosPtpIpCameraHandle(
          model: this,
          guid: Uint8List.fromList(List.generate(16, (index) => 0x00)),
          address: '192.168.178.43',
          clientName: 'Cine Remote',
        );
      case CameraId.demoCamera:
        return const DemoCameraHandle();
    }

    throw UnimplementedError();
  }
}
