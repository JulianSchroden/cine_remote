import 'dart:convert';
import 'dart:typed_data';

import 'package:cine_remote/camera_control/demo/demo_camera_pairing_data.dart';
import 'package:cine_remote/camera_control/eos_cine_http/eos_cine_http_camera_pairing_data.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/eos_ptp_ip_camera_pairing_data.dart';
import 'package:cine_remote/camera_control/interface/camera_factory.dart';
import 'package:cine_remote/camera_control/interface/models/camera_handle.dart';
import 'package:cine_remote/presentation/core/adapter/date_time_adapter.dart';
import 'package:cine_remote/presentation/features/recent_cameras/repository/recent_camera.dart';
import 'package:cine_remote/presentation/features/recent_cameras/repository/recent_cameras_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';

class MockHiveAdapter extends Mock implements HiveAdapter {}

class MockDateTimeAdapter extends Mock implements DateTimeAdapter {}

class MockBox<E> extends Mock implements Box<E> {}

void main() {
  late RecentCamerasRepostitory sut;
  late MockHiveAdapter mockHiveAdapter;
  late MockDateTimeAdapter mockDateTimeAdapter;
  late MockBox mockBox;

  final currentTime = DateTime(2023, 04, 17, 17, 47, 12);

  final recentDemoCamera = const CameraHandle(
          id: 'demo-1',
          model: CameraModels.demoCamera,
          pairingData: DemoCameraPairingData())
      .toRecentCamera(DateTime(2023, 04, 17, 17, 38, 10));
  final recentPtpIpCamera = CameraHandle(
          id: 'eos-ptp-ip-1',
          model: CameraModels.canon70D,
          pairingData: EosPtpIpCameraPairingData(
              guid: Uint8List.fromList([0x01, 0x02, 0x03, 0x04]),
              address: '192.168.178.120',
              clientName: 'phone'))
      .toRecentCamera(DateTime(2023, 04, 18, 12, 03, 22));
  final recentEosCineHttpCamera = const CameraHandle(
          id: 'eos-cine-http-1',
          model: CameraModels.canonC100II,
          pairingData: EosCineHttpCameraPairingData())
      .toRecentCamera(DateTime(2023, 04, 20, 13, 37, 35));

  setUp(() async {
    mockHiveAdapter = MockHiveAdapter();
    mockBox = MockBox();
    when(() => mockHiveAdapter.openBox(any()))
        .thenAnswer((_) => Future.value(mockBox));

    mockDateTimeAdapter = MockDateTimeAdapter();
    when(() => mockDateTimeAdapter.now()).thenReturn(currentTime);

    sut = RecentCamerasRepostitory(mockHiveAdapter, mockDateTimeAdapter);
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

    test('sorts recentCameras by lastUsed time', () async {
      when(() => mockBox.values).thenReturn([
        jsonEncode(recentDemoCamera.toJson()),
        jsonEncode(recentEosCineHttpCamera.toJson()),
        jsonEncode(recentPtpIpCamera.toJson()),
      ]);

      final result = await sut.getAllRecentCameras();
      expect(result, [
        recentEosCineHttpCamera,
        recentPtpIpCamera,
        recentDemoCamera,
      ]);
    });
  });

  group('addCamera', () {
    final cameraHandle = CameraHandle(
      id: 'id-1232',
      model: CameraModels.canon70D,
      pairingData: EosPtpIpCameraPairingData(
        guid: Uint8List.fromList([0x01, 0x02, 0x03, 0x04, 0x05]),
        address: '192.168.178.120',
        clientName: 'phone',
      ),
    );

    setUp(() async {
      when(() => mockBox.put(any(), any())).thenAnswer((invocation) async {});
    });

    test('writes serialized model to box', () async {
      await sut.addCamera(cameraHandle);

      verify(() => mockBox.put('id-1232',
          jsonEncode(cameraHandle.toRecentCamera(currentTime).toJson())));
    });

    test('emits stored instance to onCameraAdded', () async {
      List<RecentCamera> addedCameras = [];
      final streamSubscruption = sut.onCameraAdded.listen(addedCameras.add);

      await sut.addCamera(cameraHandle);
      await Future.delayed(Duration.zero);

      expect(addedCameras, [cameraHandle.toRecentCamera(currentTime)]);
      await streamSubscruption.cancel();
    });
  });

  group('removeCamera', () {
    setUp(() {
      when(() => mockBox.delete(any())).thenAnswer((_) => Future.value());
    });

    test('deletes recentCamera from box', () async {
      const id = 'demo-1';
      await sut.removeCamera(id);

      verify(() => mockBox.delete(id));
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
