import 'package:cine_remote/camera_control/common/date_time_adapter.dart';
import 'package:cine_remote/camera_control/interface/camera.dart';
import 'package:cine_remote/camera_control/interface/models/camera_handle.dart';
import 'package:cine_remote/dependencies.dart';
import 'package:cine_remote/presentation/features/camera_connection/bloc/camera_connection_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockDependencyHelper extends Mock implements DependencyHelper {}

class MockDateTimeAdapter extends Mock implements DateTimeAdapter {}

class MockCamera extends Mock implements Camera {}

class MockCameraConnectionCubit extends Mock implements CameraConnectionCubit {}

extension SetupCameraConnectedExtension on MockCameraConnectionCubit {
  void setupCameraConnected(CameraHandle cameraHandle) {
    when(() => withConnectedCamera(any(), orElse: any(named: 'orElse')))
        .thenAnswer(
      (invocation) async {
        invocation.positionalArguments[0].call(cameraHandle);
      },
    );
  }

  void setupCameraDisconnected() {
    when(() => withConnectedCamera(any(), orElse: any(named: 'orElse')))
        .thenAnswer(
      (invocation) async {
        invocation.namedArguments[const Symbol('orElse')].call();
      },
    );
  }
}
