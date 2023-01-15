import 'package:cine_remote/dependencies.dart';
import 'package:cine_remote/domain/models/camera_handle.dart';
import 'package:cine_remote/domain/services/camera_remote_service.dart';
import 'package:cine_remote/domain/services/date_time_adapter.dart';
import 'package:cine_remote/presentation/features/camera_connection/bloc/camera_connection_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockDependencyHelper extends Mock implements DependencyHelper {}

class MockDateTimeAdapter extends Mock implements DateTimeAdapter {}

class MockCameraRemoteService extends Mock implements CameraRemoteService {}

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
