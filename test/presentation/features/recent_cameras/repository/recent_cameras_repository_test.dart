import 'dart:convert';
import 'dart:typed_data';

import 'package:cine_remote/camera_control/demo/demo_camera_pairing_data.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/eos_ptp_ip_camera_pairing_data.dart';
import 'package:cine_remote/camera_control/interface/camera_factory.dart';
import 'package:cine_remote/camera_control/interface/models/camera_handle.dart';
import 'package:cine_remote/presentation/features/recent_cameras/repository/recent_camera.dart';
import 'package:cine_remote/presentation/features/recent_cameras/repository/recent_cameras_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';

class MockHiveAdapter extends Mock implements HiveAdapter {}

class MockBox<E> extends Mock implements Box<E> {}

void main() {
  late RecentCamerasRepostitory sut;
  late MockHiveAdapter mockHiveAdapter;
  late MockBox mockBox;

  final recentDemoCamera = const CameraHandle(
          id: 'demo-1',
          model: CameraModels.demoCamera,
          pairingData: DemoCameraPairingData())
      .toRecentCamera();
  final recentPtpIpCamera = CameraHandle(
          id: 'eos-ptp-ip-1',
          model: CameraModels.canon70D,
          pairingData: EosPtpIpCameraPairingData(
              guid: Uint8List.fromList([0x01, 0x02, 0x03, 0x04]),
              address: '192.168.178.120',
              clientName: 'phone'))
      .toRecentCamera();

  setUp(() async {
    mockHiveAdapter = MockHiveAdapter();
    mockBox = MockBox();
    when(() => mockHiveAdapter.openBox(any()))
        .thenAnswer((_) => Future.value(mockBox));
    sut = RecentCamerasRepostitory(mockHiveAdapter);
  });

  group('getAllRecentCameras', () {
    test('returns empty list when no recentCameras persisted', () async {
      when(() => mockBox.values).thenReturn([]);

      final result = await sut.getAllRecentCameras();

      expect(result, isEmpty);
    });

    test('returns list persisted recentCameras', () async {
      when(() => mockBox.values).thenReturn([
        jsonEncode(recentDemoCamera.toJson()),
        jsonEncode(recentPtpIpCamera.toJson()),
      ]);

      final result = await sut.getAllRecentCameras();
      expect(
        result,
        containsAll([recentDemoCamera, recentPtpIpCamera]),
      );
    });
  });

  group('addCamera', () {
    setUp(() async {
      when(() => mockBox.put(any(), any())).thenAnswer((invocation) async {});
    });

    test('writes serialized model to box', () async {
      final cameraHandle = CameraHandle(
        id: 'id-1232',
        model: CameraModels.canon70D,
        pairingData: EosPtpIpCameraPairingData(
          guid: Uint8List.fromList([0x01, 0x02, 0x03, 0x04, 0x05]),
          address: '192.168.178.120',
          clientName: 'phone',
        ),
      );

      await sut.addCamera(cameraHandle);

      verify(() => mockBox.put(
          'id-1232', jsonEncode(cameraHandle.toRecentCamera().toJson())));
    });
  });

  group('getPairingData', () {
    test('returns null when recent pairingData empty', () async {
      final result = await sut.getPairingData('any-id');
      expect(result, isNull);
    });

    test('returns pairingData when persisted camera matches id', () async {
      when(() => mockBox.get(recentPtpIpCamera.id)).thenReturn(
        jsonEncode(recentPtpIpCamera.toJson()),
      );

      final result = await sut.getPairingData(recentPtpIpCamera.id);
      expect(result, recentPtpIpCamera.pairingData);
    });
  });
}
