import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:cine_remote/logging/logger.dart';
import 'package:cine_remote/presentation/core/adapter/date_time_adapter.dart';
import 'package:cine_remote/presentation/features/camera_connection/bloc/camera_connection_cubit.dart';
import 'package:cine_remote/presentation/features/recent_cameras/repository/recent_cameras_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockDateTimeAdapter extends Mock implements DateTimeAdapter {}

class MockLogger extends Mock implements Logger {}

class MockCameraControl extends Mock implements CameraControl {}

class MockCameraConnectionHandle extends Mock
    implements CameraConnectionHandle {}

class FakeCameraConnectionHandle extends Fake
    implements CameraConnectionHandle {}

class MockCameraDiscoveryHandle extends Mock implements DiscoveryHandle {}

class MockPairingData extends Mock implements PairingData {}

class MockCamera extends Mock implements Camera {}

class MockCameraDescriptor extends Mock implements CameraDescriptor {}

class MockRecentCamerasRepository extends Mock
    implements RecentCamerasRepostitory {}

class MockCameraConnectionCubit extends Mock implements CameraConnectionCubit {}

extension SetupCameraConnectedExtension on MockCameraConnectionCubit {
  void setupCameraConnected(Camera cameraValue) {
    when(() => camera).thenReturn(cameraValue);
  }

  void setupCameraDisconnected() {
    when(() => camera)
        .thenThrow(const CameraConnectionException('camera not connected'));
  }
}

extension SetupDescriptorOnMockCamera on MockCamera {
  void setupDescriptor({
    CameraMode mode = const PhotoMode(ExposureMode.manual),
    List<CameraCapability> capabilities = const [],
  }) {
    when(() => getDescriptor()).thenAnswer((_) => Future.value(CameraDescriptor(
          mode: mode,
          capabilities: capabilities,
        )));
  }
}
