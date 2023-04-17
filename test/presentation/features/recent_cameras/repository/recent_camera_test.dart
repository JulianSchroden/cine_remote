import 'dart:typed_data';

import 'package:cine_remote/camera_control/demo/demo_camera_pairing_data.dart';
import 'package:cine_remote/camera_control/eos_cine_http/eos_cine_http_camera_pairing_data.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/eos_ptp_ip_camera_pairing_data.dart';
import 'package:cine_remote/camera_control/interface/camera_factory.dart';
import 'package:cine_remote/camera_control/interface/models/camera_handle.dart';
import 'package:cine_remote/presentation/features/recent_cameras/repository/recent_camera.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('converts demo recentCamera toJson and fromJson', () {
    const cameraHandle = CameraHandle(
        id: 'demo-1',
        model: CameraModels.demoCamera,
        pairingData: DemoCameraPairingData());

    final json = cameraHandle.toRecentCamera().toJson();
    final recentCamera = RecentCamera.fromJson(json);

    expect(recentCamera, cameraHandle.toRecentCamera());
  });

  test('converts eosCineHttp recentCamera toJson and fromJson', () {
    const cameraHandle = CameraHandle(
      id: 'eos-cine-http-1',
      model: CameraModels.canonC100II,
      pairingData: EosCineHttpCameraPairingData(address: '192.168.178.80'),
    );

    final json = cameraHandle.toRecentCamera().toJson();
    final recentCamera = RecentCamera.fromJson(json);

    expect(recentCamera, cameraHandle.toRecentCamera());
  });

  test('converts eosPtpIp recentCamera toJson and fromJson', () {
    final cameraHandle = CameraHandle(
      id: 'eos-ptp-ip-1',
      model: CameraModels.canon70D,
      pairingData: EosPtpIpCameraPairingData(
          guid: Uint8List.fromList([0x01, 0x02, 0x03, 0x4]),
          address: '192.168.178.129',
          clientName: 'phone'),
    );

    final json = cameraHandle.toRecentCamera().toJson();
    final recentCamera = RecentCamera.fromJson(json);

    expect(recentCamera, cameraHandle.toRecentCamera());
  });
}
