import 'dart:typed_data';

import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:cine_remote/presentation/features/recent_cameras/repository/recent_camera.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final currentTime = DateTime(2023, 04, 17);

  test('converts demo recentCamera toJson and fromJson', () {
    const cameraHandle = CameraConnectionHandle(
        id: 'demo-1',
        model: CameraModels.demoCamera,
        pairingData: DemoCameraPairingData());

    final json = cameraHandle.toRecentCamera(currentTime).toJson();
    final recentCamera = RecentCamera.fromJson(json);

    expect(recentCamera, cameraHandle.toRecentCamera(currentTime));
  });

  test('converts eosCineHttp recentCamera toJson and fromJson', () {
    const cameraHandle = CameraConnectionHandle(
      id: 'eos-cine-http-1',
      model: CameraModels.canonC100II,
      pairingData: EosCineHttpCameraPairingData(address: '192.168.178.80'),
    );

    final json = cameraHandle.toRecentCamera(currentTime).toJson();
    final recentCamera = RecentCamera.fromJson(json);

    expect(recentCamera, cameraHandle.toRecentCamera(currentTime));
  });

  test('converts eosPtpIp recentCamera toJson and fromJson', () {
    final cameraHandle = CameraConnectionHandle(
      id: 'eos-ptp-ip-1',
      model: CameraModels.canon70D,
      pairingData: EosPtpIpCameraPairingData(
          guid: Uint8List.fromList([0x01, 0x02, 0x03, 0x4]),
          address: '192.168.178.129',
          clientName: 'phone'),
    );

    final json = cameraHandle.toRecentCamera(currentTime).toJson();
    final recentCamera = RecentCamera.fromJson(json);

    expect(recentCamera, cameraHandle.toRecentCamera(currentTime));
  });
}
