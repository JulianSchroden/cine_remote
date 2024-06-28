import 'package:bloc_test/bloc_test.dart';
import 'package:cine_remote/presentation/features/camera_pairing/bloc/camera_pairing_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_mocks.dart';

void main() {
  late MockCameraControl mockCameraControl;
  late MockRecentCamerasRepository mockRecentCamerasRepository;
  late MockCameraDiscoveryHandle mockDiscoveryHandle;
  late MockCameraConnectionHandle mockConnectionHandle;

  setUp(() {
    mockCameraControl = MockCameraControl();
    mockRecentCamerasRepository = MockRecentCamerasRepository();
    mockDiscoveryHandle = MockCameraDiscoveryHandle();
    mockConnectionHandle = MockCameraConnectionHandle();

    when(() => mockRecentCamerasRepository.addCamera(mockConnectionHandle))
        .thenAnswer((_) => Future<void>.value());
  });

  CameraPairingCubit buildCubit() =>
      CameraPairingCubit(mockCameraControl, mockRecentCamerasRepository);

  group('init', () {
    blocTest<CameraPairingCubit, CameraPairingState>(
      'emits [active]',
      build: () => buildCubit(),
      act: (bloc) => bloc.init(mockDiscoveryHandle),
      expect: () => [
        CameraPairingState.active(mockDiscoveryHandle),
      ],
    );
  });

  group('pair', () {
    blocTest<CameraPairingCubit, CameraPairingState>(
      'emits nothing when not in active state',
      seed: () => const CameraPairingState.init(),
      build: () => buildCubit(),
      act: (bloc) => bloc.pair(mockConnectionHandle),
      expect: () => const [],
    );

    group('when paring succeeds', () {
      setUp(
        () {
          when(() => mockCameraControl.pair(mockConnectionHandle))
              .thenAnswer((_) => Future<void>.value());
        },
      );

      blocTest<CameraPairingCubit, CameraPairingState>(
        'emits [inProgress, success]',
        seed: () => CameraPairingState.active(mockDiscoveryHandle),
        build: () => buildCubit(),
        act: (bloc) => bloc.pair(mockConnectionHandle),
        expect: () => [
          CameraPairingState.inProgress(mockDiscoveryHandle),
          CameraPairingState.success(mockConnectionHandle),
        ],
      );

      blocTest<CameraPairingCubit, CameraPairingState>(
        'adds camera to RecentCamerasRepository',
        seed: () => CameraPairingState.active(mockDiscoveryHandle),
        build: () => buildCubit(),
        act: (bloc) => bloc.pair(mockConnectionHandle),
        verify: (bloc) {
          verify(() =>
              mockRecentCamerasRepository.addCamera(mockConnectionHandle));
        },
      );
    });

    group('when paring fails', () {
      setUp(() {
        when(() => mockCameraControl.pair(mockConnectionHandle))
            .thenAnswer((_) => Future<void>.error(Exception()));
      });

      blocTest<CameraPairingCubit, CameraPairingState>(
        'emits [inProgress, error] ',
        seed: () => CameraPairingState.active(mockDiscoveryHandle),
        build: () => buildCubit(),
        act: (bloc) => bloc.pair(mockConnectionHandle),
        expect: () => [
          CameraPairingState.inProgress(mockDiscoveryHandle),
          const CameraPairingState.error(),
        ],
      );

      blocTest<CameraPairingCubit, CameraPairingState>(
        'does not add camera to RecentCamerasRepository',
        seed: () => CameraPairingState.active(mockDiscoveryHandle),
        build: () => buildCubit(),
        act: (bloc) => bloc.pair(mockConnectionHandle),
        verify: (bloc) {
          verifyNever(() =>
              mockRecentCamerasRepository.addCamera(mockConnectionHandle));
        },
      );
    });
  });

  group('reset', () {
    blocTest<CameraPairingCubit, CameraPairingState>(
      'emits [init]',
      seed: () => CameraPairingState.active(mockDiscoveryHandle),
      build: () => buildCubit(),
      act: (bloc) => bloc.reset(),
      expect: () => const [
        CameraPairingState.init(),
      ],
    );
  });
}
