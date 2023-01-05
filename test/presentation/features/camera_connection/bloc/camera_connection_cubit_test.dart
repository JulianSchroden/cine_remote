import 'package:bloc_test/bloc_test.dart';
import 'package:cine_remote/data/models/wifi_camera_handle.dart';
import 'package:cine_remote/domain/models/camera_handle.dart';
import 'package:cine_remote/domain/services/camera_remote_service.dart';
import 'package:cine_remote/presentation/features/camera_connection/bloc/camera_connection_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCameraRemoteService extends Mock implements CameraRemoteService {}

void main() {
  late MockCameraRemoteService mockCameraRemoteService;
  final cameraHandle = WifiCameraHandle(cookies: [], supportedProps: []);

  setUpAll(() {
    registerFallbackValue(CameraHandle(supportedProps: []));
  });

  setUp(() {
    mockCameraRemoteService = MockCameraRemoteService();
  });

  blocTest<CameraConnectionCubit, CameraConnectionState>(
    'emits [initConnection, connectSuccess] when connecting to camera succeeds',
    build: () =>
        CameraConnectionCubit(cameraRemoteService: mockCameraRemoteService),
    setUp: () {
      when(() => mockCameraRemoteService.connect())
          .thenAnswer((_) async => cameraHandle);
    },
    act: (cubit) => cubit.connect(),
    expect: () => [
      const CameraConnectionState.initConnection(),
      CameraConnectionState.connectSuccess(cameraHandle)
    ],
  );

  blocTest<CameraConnectionCubit, CameraConnectionState>(
    'emits [initConnection, connectFailed] when connecting to camera fails',
    build: () =>
        CameraConnectionCubit(cameraRemoteService: mockCameraRemoteService),
    setUp: () {
      when(() => mockCameraRemoteService.connect())
          .thenThrow(Exception('Cannot connect to camera'));
    },
    act: (cubit) => cubit.connect(),
    expect: () => const [
      CameraConnectionState.initConnection(),
      CameraConnectionState.connectFailed()
    ],
  );
}
