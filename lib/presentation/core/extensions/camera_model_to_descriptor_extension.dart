import 'dart:io';
import 'dart:typed_data';

import '../../../camera_control/demo/demo_camera_descriptor.dart';
import '../../../camera_control/eos_cine_http/eos_cine_http_camera_descriptor.dart';
import '../../../camera_control/eos_ptp_ip/eos_ptp_ip_camera_descriptor.dart';
import '../../../camera_control/interface/models/camera_descriptor.dart';
import '../../../camera_control/interface/models/camera_model.dart';
import '../../../config.dart';

extension CameraModelToDescriptorExtension on CameraModel {
  CameraDescriptor toDescriptor() {
    switch (identifier) {
      case CameraId.canonC100II:
        return EosCineHttpCameraDescriptor();
      case CameraId.canon70D:
        return EosPtpIpCameraDescriptor(
          guid: Uint8List.fromList(List.generate(16, (index) => 0x00)),
          address: InternetAddress.tryParse('192.168.178.43')!,
          clientName: 'Cine Remote',
        );
      case CameraId.fakeCamera:
        return DemoCameraDescriptor();
    }

    throw UnimplementedError();
  }
}
