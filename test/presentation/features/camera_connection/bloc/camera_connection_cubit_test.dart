import 'package:bloc_test/bloc_test.dart';
import 'package:camera_control_dart/camera_control_dart.dart';

import 'package:cine_remote/presentation/features/camera_connection/bloc/camera_connection_cubit.dart';
import 'package:cine_remote/presentation/features/recent_cameras/repository/recent_cameras_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_mocks.dart';

class MockRecentCamerasRepository extends Mock
    implements RecentCamerasRepostitory {}

void main() {
  late MockCamera mockCamera;
  late MockCameraControl mockCameraControl;
  late MockRecentCamerasRepository mockRecentCamerasRepository;
  late MockCameraConnectionHandle mockCameraConnectionHandle;

  setUp(() {
    mockCamera = MockCamera();
    mockCameraControl = MockCameraControl();
    mockRecentCamerasRepository = MockRecentCamerasRepository();
    mockCameraConnectionHandle = MockCameraConnectionHandle();

    registerFallbackValue(FakeCameraConnectionHandle());

    when(() => mockRecentCamerasRepository.addCamera(any()))
        .thenAnswer((_) => Future<void>.value());

    when(() => mockCameraControl.connect(any()))
        .thenAnswer((_) => Future.value(mockCamera));
  });

  CameraConnectionCubit buildCubit() => CameraConnectionCubit(
      cameraControl: mockCameraControl,
      recentCamerasRepostitory: mockRecentCamerasRepository);

  group('connectToDiscoveredCamera', () {
    const String cameraId = 'camera-1';
    const model = CameraModels.demoCamera;
    late MockCameraDiscoveryHandle mockDiscoveryHandle;
    late MockPairingData mockPairingData;

    setUp(() {
      mockDiscoveryHandle = MockCameraDiscoveryHandle();
      mockPairingData = MockPairingData();
      when(() => mockDiscoveryHandle.id).thenReturn(cameraId);
      when(() => mockDiscoveryHandle.model).thenReturn(model);
    });

    blocTest<CameraConnectionCubit, CameraConnectionState>(
      'emits [connecting, requiresPairing] when no pairing data present',
      setUp: () {
        when(() => mockDiscoveryHandle.pairingData).thenReturn(null);
        when(() => mockRecentCamerasRepository.getPairingData(cameraId))
            .thenAnswer((_) => Future<PairingData?>.value(null));
      },
      build: () => buildCubit(),
      act: (bloc) => bloc.connectToDiscoveredCamera(mockDiscoveryHandle),
      expect: () => [
        const CameraConnectionState.connecting(),
        CameraConnectionState.requiresPairing(mockDiscoveryHandle),
      ],
    );

    blocTest<CameraConnectionCubit, CameraConnectionState>(
      'emits [connecting, connected] when discovery handle has pairing data and connection succeeds',
      setUp: () {
        when(() => mockDiscoveryHandle.pairingData).thenReturn(mockPairingData);
        when(() => mockRecentCamerasRepository.getPairingData(cameraId))
            .thenAnswer((_) => Future<PairingData?>.value(null));
      },
      build: () => buildCubit(),
      act: (bloc) => bloc.connectToDiscoveredCamera(mockDiscoveryHandle),
      expect: () => [
        const CameraConnectionState.connecting(),
        CameraConnectionState.connected(mockCamera),
      ],
      verify: (bloc) {
        verify(
          () => mockCameraControl.connect(any(
              that: predicate<CameraConnectionHandle>(
                  (handle) => handle.id == cameraId && handle.model == model))),
        );
      },
    );

    blocTest<CameraConnectionCubit, CameraConnectionState>(
      'emits [connecting, connected] when recentCamerasRepository has pairingData',
      setUp: () {
        when(() => mockDiscoveryHandle.pairingData).thenReturn(null);
        when(() => mockRecentCamerasRepository.getPairingData(cameraId))
            .thenAnswer((_) => Future<PairingData>.value(mockPairingData));
      },
      build: () => buildCubit(),
      act: (bloc) => bloc.connectToDiscoveredCamera(mockDiscoveryHandle),
      expect: () => [
        const CameraConnectionState.connecting(),
        CameraConnectionState.connected(mockCamera),
      ],
      verify: (bloc) {
        verify(
          () => mockCameraControl.connect(any(
              that: predicate<CameraConnectionHandle>(
                  (handle) => handle.id == cameraId && handle.model == model))),
        );
      },
    );
  });

  group('connect', () {
    group('when connecting succeeds', () {
      setUp(() {
        when(() => mockCameraControl.connect(any()))
            .thenAnswer((_) async => mockCamera);
      });

      blocTest<CameraConnectionCubit, CameraConnectionState>(
        'emits [connecting, connected]',
        build: () => buildCubit(),
        act: (bloc) async => await bloc.connect(mockCameraConnectionHandle),
        expect: () => [
          const CameraConnectionState.connecting(),
          CameraConnectionState.connected(mockCamera),
        ],
      );

      blocTest<CameraConnectionCubit, CameraConnectionState>(
        'adds handle to recentCamerasRepository',
        build: () => buildCubit(),
        act: (bloc) => bloc.connect(mockCameraConnectionHandle),
        verify: (_) {
          verify(() => mockRecentCamerasRepository
              .addCamera(mockCameraConnectionHandle));
        },
      );
    });

    group('when connecting fails', () {
      setUp(() {
        when(() => mockCameraControl.connect(mockCameraConnectionHandle))
            .thenThrow(Exception());
      });

      blocTest<CameraConnectionCubit, CameraConnectionState>(
        'emits [connecting, connectingFailed]',
        build: () => buildCubit(),
        act: (bloc) => bloc.connect(mockCameraConnectionHandle),
        expect: () => const [
          CameraConnectionState.connecting(),
          CameraConnectionState.connectingFailed(),
        ],
      );

      blocTest<CameraConnectionCubit, CameraConnectionState>(
        'does not add handle to recentCamerasRepository',
        build: () => buildCubit(),
        act: (bloc) => bloc.connect(mockCameraConnectionHandle),
        verify: (_) {
          verifyNever(() => mockRecentCamerasRepository.addCamera(any()));
        },
      );
    });
  });

  group('disconnect', () {
    blocTest<CameraConnectionCubit, CameraConnectionState>(
      'emits [disconnecting, disconnected] on success',
      seed: () => CameraConnectionState.connected(mockCamera),
      setUp: () {
        when(() => mockCamera.disconnect())
            .thenAnswer((_) => Future<void>.value());
      },
      build: () => buildCubit(),
      act: (bloc) => bloc.disconnect(),
      expect: () => [
        CameraConnectionState.disconnecting(mockCamera),
        const CameraConnectionState.disconnected(),
      ],
    );
  });
}
