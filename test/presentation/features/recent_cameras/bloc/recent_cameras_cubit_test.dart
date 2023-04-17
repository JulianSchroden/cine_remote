import 'package:bloc_test/bloc_test.dart';
import 'package:cine_remote/camera_control/demo/demo_camera_pairing_data.dart';
import 'package:cine_remote/camera_control/eos_cine_http/eos_cine_http_camera_pairing_data.dart';
import 'package:cine_remote/camera_control/interface/camera_factory.dart';
import 'package:cine_remote/presentation/features/recent_cameras/bloc/recent_cameras_cubit.dart';
import 'package:cine_remote/presentation/features/recent_cameras/repository/recent_camera.dart';
import 'package:cine_remote/presentation/features/recent_cameras/repository/recent_cameras_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRecentCamerasRepostitory extends Mock
    implements RecentCamerasRepostitory {}

void main() {
  late RecentCamerasCubit sut;
  late MockRecentCamerasRepostitory mockRecentCamerasRepostitory;

  setUp(() {
    mockRecentCamerasRepostitory = MockRecentCamerasRepostitory();
    sut = RecentCamerasCubit(mockRecentCamerasRepostitory);
  });

  group('load', () {
    const recentCameras = [
      RecentCamera(
          id: 'demo-1',
          model: CameraModels.demoCamera,
          pairingData: DemoCameraPairingData()),
      RecentCamera(
          id: 'eos-cine-http-1',
          model: CameraModels.canonC100II,
          pairingData: EosCineHttpCameraPairingData())
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
      expect: () => const [
        RecentCamerasState.loading(),
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
}
