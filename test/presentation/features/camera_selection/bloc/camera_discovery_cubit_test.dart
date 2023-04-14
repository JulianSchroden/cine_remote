import 'package:bloc_test/bloc_test.dart';
import 'package:cine_remote/camera_control/interface/discovery/camera_discovery_service.dart';
import 'package:cine_remote/camera_control/interface/discovery/wifi_info.dart';
import 'package:cine_remote/presentation/features/camera_selection/bloc/camera_discovery_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCameraDiscoveryService extends Mock
    implements CameraDiscoveryService {}

void main() {
  const currentIp = '192.168.0.65';
  const gatewayIp = '192.168.0.1';

  late CameraDiscoveryCubit sut;
  late MockCameraDiscoveryService mockCameraDiscoveryService;

  setUp(() {
    mockCameraDiscoveryService = MockCameraDiscoveryService();
    when(() => mockCameraDiscoveryService.wifiInfo())
        .thenAnswer((_) => Future.value(const WifiInfo(currentIp, gatewayIp)));

    sut = CameraDiscoveryCubit(mockCameraDiscoveryService);
  });

  group('init', () {
    blocTest(
      'emits [initInProgress, paused] on init success',
      build: () => sut,
      act: (bloc) => bloc.init(),
      expect: () => const [
        CameraDiscoveryState.initInProgress(),
        CameraDiscoveryState.paused(currentIp)
      ],
    );

    blocTest(
      'emits [initInProgress, error] when init fails',
      setUp: () {
        when(() => mockCameraDiscoveryService.wifiInfo()).thenThrow(Error());
      },
      build: () => sut,
      act: (bloc) => bloc.init(),
      expect: () => const [
        CameraDiscoveryState.initInProgress(),
        CameraDiscoveryState.error()
      ],
    );
  });
}
