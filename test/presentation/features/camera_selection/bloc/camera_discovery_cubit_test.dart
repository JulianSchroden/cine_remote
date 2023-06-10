import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:cine_remote/camera_control/eos_cine_http/models/eos_cine_http_discovery_handle.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/discovery/eos_ptp_ip_discovery_handle.dart';
import 'package:cine_remote/camera_control/interface/camera_factory.dart';
import 'package:cine_remote/camera_control/interface/discovery/camera_discovery_event.dart';
import 'package:cine_remote/camera_control/interface/discovery/camera_discovery_service.dart';
import 'package:cine_remote/camera_control/interface/discovery/wifi_info.dart';
import 'package:cine_remote/presentation/features/camera_selection/bloc/camera_discovery_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers.dart';

class MockCameraDiscoveryService extends Mock
    implements CameraDiscoveryService {}

void main() {
  const currentIp = '192.168.0.65';
  const gatewayIp = '192.168.0.1';

  late CameraDiscoveryCubit sut;
  late MockCameraDiscoveryService mockCameraDiscoveryService;
  late StreamController<CameraDiscoveryEvent> cameraDiscoveryStreamController;

  setUp(() {
    mockCameraDiscoveryService = MockCameraDiscoveryService();
    when(() => mockCameraDiscoveryService.wifiInfo())
        .thenAnswer((_) => Future.value(const WifiInfo(currentIp, gatewayIp)));

    cameraDiscoveryStreamController = StreamController<CameraDiscoveryEvent>();
    when(() => mockCameraDiscoveryService.discover())
        .thenAnswer((_) => cameraDiscoveryStreamController.stream);

    sut = CameraDiscoveryCubit(mockCameraDiscoveryService);
  });

  group('init', () {
    blocTest<CameraDiscoveryCubit, CameraDiscoveryState>(
      'emits [initInProgress, active] on init success',
      build: () => sut,
      act: (bloc) => bloc.init(),
      expect: () => const [
        CameraDiscoveryState.initInProgress(),
        CameraDiscoveryState.active(currentIp, [])
      ],
    );

    blocTest<CameraDiscoveryCubit, CameraDiscoveryState>(
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

  group('discover Stream', () {
    multiStepBlocTest<CameraDiscoveryCubit, CameraDiscoveryState,
        StreamController<CameraDiscoveryEvent>>(
      'emits [active] when camera found',
      setUp: () => cameraDiscoveryStreamController,
      build: () => sut,
      steps: [
        BlocTestStep(
          'init cubit',
          act: (bloc, _) => bloc.init(),
          expect: () => const [
            CameraDiscoveryState.initInProgress(),
            CameraDiscoveryState.active(currentIp, [])
          ],
          verify: (bloc, controller) {
            expect(controller.hasListener, isTrue);
          },
        ),
        BlocTestStep(
          'emits [active] when camera found',
          setUp: () => cameraDiscoveryStreamController,
          act: (_, controller) => controller.add(
            const CameraDiscoveryEvent.alive(
              handle: EosCineHttpDiscoveryHandle(
                id: 'c100-ii-1',
                model: CameraModels.canonC100II,
              ),
            ),
          ),
          expect: () => [
            const CameraDiscoveryState.active(
              currentIp,
              [
                EosCineHttpDiscoveryHandle(
                  id: 'c100-ii-1',
                  model: CameraModels.canonC100II,
                ),
              ],
            )
          ],
        )
      ],
    );

    multiStepBlocTest<CameraDiscoveryCubit, CameraDiscoveryState,
        StreamController<CameraDiscoveryEvent>>(
      'emits [active] when new camera is discovered',
      setUp: () => cameraDiscoveryStreamController,
      build: () => sut,
      steps: [
        BlocTestStep(
          'init cubit',
          act: (bloc, _) => bloc.init(),
          expect: () => const [
            CameraDiscoveryState.initInProgress(),
            CameraDiscoveryState.active(currentIp, [])
          ],
          verify: (bloc, controller) {
            expect(controller.hasListener, isTrue);
          },
        ),
        BlocTestStep(
          'emits [active] when camera found',
          act: (_, controller) => controller.add(
            const CameraDiscoveryEvent.alive(
              handle: EosCineHttpDiscoveryHandle(
                id: 'c100-ii-1',
                model: CameraModels.canonC100II,
              ),
            ),
          ),
          expect: () => [
            const CameraDiscoveryState.active(
              currentIp,
              [
                EosCineHttpDiscoveryHandle(
                  id: 'c100-ii-1',
                  model: CameraModels.canonC100II,
                ),
              ],
            )
          ],
        ),
        BlocTestStep(
          'emits [active] with new camera added to discoveredCameras list',
          act: (_, controller) => controller.add(
            const CameraDiscoveryEvent.alive(
              handle: EosPtpIpDiscoveryHandle(
                address: '192.168.178.120',
                id: 'canon-70D-123232323',
                model: CameraModels.canon70D,
              ),
            ),
          ),
          expect: () => [
            const CameraDiscoveryState.active(
              currentIp,
              [
                EosPtpIpDiscoveryHandle(
                  address: '192.168.178.120',
                  id: 'canon-70D-123232323',
                  model: CameraModels.canon70D,
                ),
                EosCineHttpDiscoveryHandle(
                  id: 'c100-ii-1',
                  model: CameraModels.canonC100II,
                ),
              ],
            )
          ],
        ),
        BlocTestStep(
          'ignores already discovered camera',
          act: (_, controller) => controller.add(
            const CameraDiscoveryEvent.alive(
              handle: EosCineHttpDiscoveryHandle(
                id: 'c100-ii-1',
                model: CameraModels.canonC100II,
              ),
            ),
          ),
          expect: () => [],
        ),
        BlocTestStep(
          'ignores already discovered camera but emits [active] with updated localIp',
          setUp: () {
            when(() => mockCameraDiscoveryService.wifiInfo()).thenAnswer((_) =>
                Future.value(const WifiInfo('192.168.0.81', '192.168.0.80')));
          },
          act: (_, controller) => controller.add(
            const CameraDiscoveryEvent.alive(
              handle: EosCineHttpDiscoveryHandle(
                id: 'c100-ii-1',
                model: CameraModels.canonC100II,
              ),
            ),
          ),
          expect: () => [
            const CameraDiscoveryState.active(
              '192.168.0.81',
              [
                EosPtpIpDiscoveryHandle(
                  address: '192.168.178.120',
                  id: 'canon-70D-123232323',
                  model: CameraModels.canon70D,
                ),
                EosCineHttpDiscoveryHandle(
                  id: 'c100-ii-1',
                  model: CameraModels.canonC100II,
                ),
              ],
            )
          ],
        )
      ],
    );

    multiStepBlocTest<CameraDiscoveryCubit, CameraDiscoveryState,
        StreamController<CameraDiscoveryEvent>>(
      'emits [active] and removes camera on byeBye event',
      setUp: () => cameraDiscoveryStreamController,
      build: () => sut,
      steps: [
        BlocTestStep(
          'init cubit',
          act: (bloc, _) => bloc.init(),
          expect: () => const [
            CameraDiscoveryState.initInProgress(),
            CameraDiscoveryState.active(currentIp, [])
          ],
          verify: (bloc, controller) {
            expect(controller.hasListener, isTrue);
          },
        ),
        BlocTestStep(
          'emits [active] when camera found',
          act: (_, controller) => controller.add(
            const CameraDiscoveryEvent.alive(
              handle: EosCineHttpDiscoveryHandle(
                id: 'c100-ii-1',
                model: CameraModels.canonC100II,
              ),
            ),
          ),
          expect: () => [
            const CameraDiscoveryState.active(
              currentIp,
              [
                EosCineHttpDiscoveryHandle(
                  id: 'c100-ii-1',
                  model: CameraModels.canonC100II,
                ),
              ],
            )
          ],
        ),
        BlocTestStep(
          'emits [active] with new camera added to discoveredCameras list',
          act: (_, controller) => controller.add(
            const CameraDiscoveryEvent.alive(
              handle: EosPtpIpDiscoveryHandle(
                address: '192.168.178.120',
                id: 'canon-70D-123232323',
                model: CameraModels.canon70D,
              ),
            ),
          ),
          expect: () => [
            const CameraDiscoveryState.active(
              currentIp,
              [
                EosPtpIpDiscoveryHandle(
                  address: '192.168.178.120',
                  id: 'canon-70D-123232323',
                  model: CameraModels.canon70D,
                ),
                EosCineHttpDiscoveryHandle(
                  id: 'c100-ii-1',
                  model: CameraModels.canonC100II,
                ),
              ],
            )
          ],
        ),
        BlocTestStep(
          'emits [active] without removed camera',
          act: (_, controller) => controller.add(
            const CameraDiscoveryEvent.byeBye(
              id: 'c100-ii-1',
            ),
          ),
          expect: () => [
            const CameraDiscoveryState.active(
              currentIp,
              [
                EosPtpIpDiscoveryHandle(
                  address: '192.168.178.120',
                  id: 'canon-70D-123232323',
                  model: CameraModels.canon70D,
                ),
              ],
            )
          ],
        ),
      ],
    );
  });
}
