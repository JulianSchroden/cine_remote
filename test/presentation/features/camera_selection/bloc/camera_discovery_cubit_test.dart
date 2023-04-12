import 'package:bloc_test/bloc_test.dart';
import 'package:cine_remote/presentation/features/camera_selection/bloc/camera_discovery_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_info_plus/network_info_plus.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  const currentIp = '192.168.0.65';

  late CameraDiscoveryCubit sut;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    when(() => mockNetworkInfo.getWifiIP())
        .thenAnswer((_) => Future.value(currentIp));

    sut = CameraDiscoveryCubit(mockNetworkInfo);
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
        when(() => mockNetworkInfo.getWifiIP()).thenThrow(Error());
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
