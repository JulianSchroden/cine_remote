import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:cine_remote/camera_control/demo/demo_camera_pairing_data.dart';
import 'package:cine_remote/camera_control/eos_cine_http/eos_cine_http_camera_pairing_data.dart';
import 'package:cine_remote/camera_control/interface/camera_factory.dart';
import 'package:cine_remote/presentation/features/recent_cameras/bloc/recent_cameras_cubit.dart';
import 'package:cine_remote/presentation/features/recent_cameras/repository/recent_camera.dart';
import 'package:cine_remote/presentation/features/recent_cameras/repository/recent_cameras_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers.dart';

class MockRecentCamerasRepostitory extends Mock
    implements RecentCamerasRepostitory {}

void main() {
  late RecentCamerasCubit sut;
  late MockRecentCamerasRepostitory mockRecentCamerasRepostitory;

  setUp(() {
    mockRecentCamerasRepostitory = MockRecentCamerasRepostitory();
    when(() => mockRecentCamerasRepostitory.onCameraAdded)
        .thenAnswer((_) => Stream.fromIterable([]));
    sut = RecentCamerasCubit(mockRecentCamerasRepostitory);
  });

  group('load', () {
    final recentCameras = [
      RecentCamera(
        id: 'demo-1',
        model: CameraModels.demoCamera,
        pairingData: const DemoCameraPairingData(),
        lastUsed: DateTime(2023, 04, 17, 17, 45, 23),
      ),
      RecentCamera(
        id: 'eos-cine-http-1',
        model: CameraModels.canonC100II,
        pairingData: const EosCineHttpCameraPairingData(),
        lastUsed: DateTime(2023, 04, 18, 00, 01, 00),
      )
    ];

    blocTest<RecentCamerasCubit, RecentCamerasState>(
      'emits [loading, success] on load success',
      build: () => sut,
      setUp: () {
        when(() => mockRecentCamerasRepostitory.getAllRecentCameras())
            .thenAnswer(
          (_) => Future.value(recentCameras),
        );
      },
      act: (bloc) => bloc.load(),
      expect: () => [
        const RecentCamerasState.loading(),
        RecentCamerasState.success(recentCameras),
      ],
    );

    blocTest<RecentCamerasCubit, RecentCamerasState>(
      'emits [loading, empty] when no recent camera present',
      build: () => sut,
      setUp: () {
        when(() => mockRecentCamerasRepostitory.getAllRecentCameras())
            .thenAnswer(
          (_) => Future.value([]),
        );
      },
      act: (bloc) => bloc.load(),
      expect: () => const [
        RecentCamerasState.loading(),
        RecentCamerasState.empty(),
      ],
    );

    blocTest<RecentCamerasCubit, RecentCamerasState>(
      'emits [loading, error] when loading fails',
      build: () => sut,
      setUp: () {
        when(() => mockRecentCamerasRepostitory.getAllRecentCameras())
            .thenThrow(Exception('Failed to load recent cameras'));
      },
      act: (bloc) => bloc.load(),
      expect: () => const [
        RecentCamerasState.loading(),
        RecentCamerasState.error(),
      ],
    );
  });

  group('onCameraAdded', () {
    multiStepBlocTest<RecentCamerasCubit, RecentCamerasState,
        StreamController<RecentCamera>>(
      'emits [success] on camera added',
      setUp: () {
        final onCameraAddedController = StreamController<RecentCamera>();
        when(() => mockRecentCamerasRepostitory.onCameraAdded)
            .thenAnswer((_) => onCameraAddedController.stream);
        return onCameraAddedController;
      },
      build: () => sut,
      steps: [
        BlocTestStep(
          'emits [loading, emit] when inital list empty',
          setUp: () {
            when(() => mockRecentCamerasRepostitory.getAllRecentCameras())
                .thenAnswer((_) => Future.value([]));
          },
          act: (bloc, _) => bloc.load(),
          expect: () =>
              const [RecentCamerasState.loading(), RecentCamerasState.empty()],
        ),
        BlocTestStep(
          'emits [success] on camera added',
          act: (_, onCameraAddedController) => onCameraAddedController.add(
            RecentCamera(
              id: 'demo-1',
              model: CameraModels.demoCamera,
              pairingData: const DemoCameraPairingData(),
              lastUsed: DateTime(2023, 04, 17, 19, 50, 01),
            ),
          ),
          expect: () => [
            RecentCamerasState.success(
              [
                RecentCamera(
                  id: 'demo-1',
                  model: CameraModels.demoCamera,
                  pairingData: const DemoCameraPairingData(),
                  lastUsed: DateTime(2023, 04, 17, 19, 50, 01),
                ),
              ],
            )
          ],
        ),
        BlocTestStep(
          'emits [success] on next camera added',
          act: (_, onCameraAddedController) => onCameraAddedController.add(
            RecentCamera(
              id: 'eos-cine-1',
              model: CameraModels.canonC100II,
              pairingData: const EosCineHttpCameraPairingData(),
              lastUsed: DateTime(2023, 04, 17, 20, 03, 02),
            ),
          ),
          expect: () => [
            RecentCamerasState.success(
              [
                RecentCamera(
                  id: 'eos-cine-1',
                  model: CameraModels.canonC100II,
                  pairingData: const EosCineHttpCameraPairingData(),
                  lastUsed: DateTime(2023, 04, 17, 20, 03, 02),
                ),
                RecentCamera(
                  id: 'demo-1',
                  model: CameraModels.demoCamera,
                  pairingData: const DemoCameraPairingData(),
                  lastUsed: DateTime(2023, 04, 17, 19, 50, 01),
                ),
              ],
            )
          ],
        ),
        BlocTestStep(
          'emits [success] and removes old entry when same camera is stored again',
          act: (_, onCameraAddedController) => onCameraAddedController.add(
            RecentCamera(
              id: 'demo-1',
              model: CameraModels.demoCamera,
              pairingData: const DemoCameraPairingData(),
              lastUsed: DateTime(2023, 04, 17, 20, 05, 03),
            ),
          ),
          expect: () => [
            RecentCamerasState.success(
              [
                RecentCamera(
                  id: 'demo-1',
                  model: CameraModels.demoCamera,
                  pairingData: const DemoCameraPairingData(),
                  lastUsed: DateTime(2023, 04, 17, 20, 05, 03),
                ),
                RecentCamera(
                  id: 'eos-cine-1',
                  model: CameraModels.canonC100II,
                  pairingData: const EosCineHttpCameraPairingData(),
                  lastUsed: DateTime(2023, 04, 17, 20, 03, 02),
                ),
              ],
            )
          ],
        )
      ],
    );
  });
}
