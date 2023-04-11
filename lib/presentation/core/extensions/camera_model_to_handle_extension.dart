import 'dart:typed_data';

import '../../../camera_control/demo/demo_camera_handle.dart';
import '../../../camera_control/eos_cine_http/eos_cine_http_camera_handle.dart';
import '../../../camera_control/eos_ptp_ip/eos_ptp_ip_camera_handle.dart';
import '../../../camera_control/interface/models/camera_handle.dart';
import '../../../camera_control/interface/models/camera_model.dart';
import '../../../config.dart';

extension CameraModelToHandleExtension on CameraModel {
  CameraHandle toHandle() {
    switch (identifier) {
      case CameraId.canonC100II:
        return const EosCineHttpCameraHandle(name: 'C100 II');
      case CameraId.canon70D:
        return EosPtpIpCameraHandle(
          name: 'Canon 70D',
          guid: Uint8List.fromList(List.generate(16, (index) => 0x00)),
          address: '192.168.178.43',
          clientName: 'Cine Remote',
        );
      case CameraId.fakeCamera:
        return const DemoCameraHandle();
    }

    throw UnimplementedError();
  }
}
