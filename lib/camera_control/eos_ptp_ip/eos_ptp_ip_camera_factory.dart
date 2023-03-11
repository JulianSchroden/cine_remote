import 'dart:io';
import 'dart:typed_data';

import '../interface/camera.dart';
import '../interface/camera_factory.dart';
import 'communication/ptp_ip_client.dart';
import 'eos_ptp_ip_camera.dart';
import 'eos_ptp_ip_camera_descriptor.dart';

class EosPtpIpCameraFactory extends CameraFactory<EosPtpIpCameraDescriptor> {
  @override
  Future<Camera> connect(EosPtpIpCameraDescriptor descriptor) async {
    final guid = Uint8List.fromList(List.generate(16, (index) => 0x00));

    final client = await PtpIpClient.connect(
      address: InternetAddress.tryParse('192.168.178.43')!,
      port: 15740,
      clientName: 'Cine Remote',
      guid: guid,
    );

    return EosPtpIpCamera(client);
  }
}
