import 'package:cine_remote/camera_control/common/adapter/date_time_adapter.dart';
import 'package:cine_remote/camera_control/interface/camera.dart';
import 'package:cine_remote/camera_control/interface/exceptions/camera_connection_exception.dart';
import 'package:cine_remote/camera_control/interface/models/camera_descriptor.dart';
import 'package:cine_remote/camera_control/interface/models/capabilities/camera_capability.dart';
import 'package:cine_remote/camera_control/interface/models/properties/camera_mode.dart';
import 'package:cine_remote/camera_control/interface/models/properties/exposure_mode.dart';
import 'package:cine_remote/presentation/features/camera_connection/bloc/camera_connection_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockDateTimeAdapter extends Mock implements DateTimeAdapter {}

class MockCamera extends Mock implements Camera {}

class MockCameraDescriptor extends Mock implements CameraDescriptor {}

class MockCameraConnectionCubit extends Mock implements CameraConnectionCubit {}

extension SetupCameraConnectedExtension on MockCameraConnectionCubit {
  void setupCameraConnected(Camera cameraValue) {
    when(() => withConnectedCamera(any(), orElse: any(named: 'orElse')))
        .thenAnswer(
      (invocation) async {
        invocation.positionalArguments[0].call(cameraValue);
      },
    );

    when(() => camera).thenReturn(cameraValue);
  }

  void setupCameraDisconnected() {
    when(() => withConnectedCamera(any(), orElse: any(named: 'orElse')))
        .thenAnswer(
      (invocation) async {
        invocation.namedArguments[const Symbol('orElse')].call();
      },
    );

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
