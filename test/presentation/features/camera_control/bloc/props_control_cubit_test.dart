import 'package:bloc_test/bloc_test.dart';
import 'package:cine_remote/data/models/wifi_camera_handle.dart';
import 'package:cine_remote/domain/models/control_prop.dart';
import 'package:cine_remote/domain/models/control_prop_type.dart';
import 'package:cine_remote/presentation/features/camera_control/bloc/props_control_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_mocks.dart';

void main() {
  late MockCameraConnectionCubit mockCameraConnectionCubit;
  late MockCameraRemoteService mockCameraRemoteService;
  const cameraHandle = WifiCameraHandle(
    cookies: [],
    supportedProps: [
      ControlPropType.aperture,
      ControlPropType.iso,
      ControlPropType.whiteBalance,
    ],
  );
  const apertureControlProp = ControlProp(
    type: ControlPropType.aperture,
    currentValue: '2.8',
    allowedValues: ['2.8', '4.0', '5.6'],
  );
  const isoControlProp = ControlProp(
    type: ControlPropType.aperture,
    currentValue: '100',
    allowedValues: ['200', '400', '800'],
  );

  setUpAll(() {
    registerFallbackValue(
      const ControlProp(
          type: ControlPropType.shutterAngle,
          currentValue: '',
          allowedValues: []),
    );
  });

  setUp(() {
    mockCameraConnectionCubit = MockCameraConnectionCubit();
    mockCameraRemoteService = MockCameraRemoteService();
  });

  group('init', () {
    blocTest<PropsControlCubit, PropsControlState>(
      'emits [updatedFailed] when camera not connected',
      seed: () => const PropsControlState.updateSuccess([]),
      setUp: () => mockCameraConnectionCubit.setupCameraDisconnected(),
      build: () =>
          PropsControlCubit(mockCameraConnectionCubit, mockCameraRemoteService),
      act: (cubit) => cubit.init(),
      expect: () => [
        const PropsControlState.updateFailed([]),
      ],
    );

    blocTest<PropsControlCubit, PropsControlState>(
      'emits [updating, updateSuccess] when reading initial prop data succeeds',
      seed: () => const PropsControlState.updateSuccess([]),
      setUp: () {
        mockCameraConnectionCubit.setupCameraConnected(cameraHandle);
        when(() => mockCameraConnectionCubit.updateEvents)
            .thenAnswer((_) => const Stream.empty());

        when(() => mockCameraRemoteService.getProp(
                cameraHandle, ControlPropType.aperture))
            .thenAnswer((_) async => apertureControlProp);
        when(() => mockCameraRemoteService.getProp(
                cameraHandle, ControlPropType.iso))
            .thenAnswer((_) async => isoControlProp);
        when(() => mockCameraRemoteService.getProp(
                cameraHandle, ControlPropType.whiteBalance))
            .thenAnswer((_) async => null);
      },
      build: () =>
          PropsControlCubit(mockCameraConnectionCubit, mockCameraRemoteService),
      act: (cubit) => cubit.init(),
      expect: () => [
        const PropsControlState.updating([]),
        const PropsControlState.updateSuccess(
            [apertureControlProp, isoControlProp]),
      ],
    );

    blocTest<PropsControlCubit, PropsControlState>(
      'emits [updating, updateFailed] when getting prop data throws',
      seed: () => const PropsControlState.updateSuccess([]),
      setUp: () {
        mockCameraConnectionCubit.setupCameraConnected(cameraHandle);

        when(() => mockCameraRemoteService.getProp(
                cameraHandle, ControlPropType.aperture))
            .thenThrow(() => Exception('failed to get prop'));
      },
      build: () =>
          PropsControlCubit(mockCameraConnectionCubit, mockCameraRemoteService),
      act: (cubit) => cubit.init(),
      expect: () => [
        const PropsControlState.updating([]),
        const PropsControlState.updateFailed([]),
      ],
    );
  });

  group('setProp', () {
    blocTest<PropsControlCubit, PropsControlState>(
      'emits [updatedFailed] when camera not connected',
      seed: () => const PropsControlState.updateSuccess([]),
      setUp: () => mockCameraConnectionCubit.setupCameraDisconnected(),
      build: () =>
          PropsControlCubit(mockCameraConnectionCubit, mockCameraRemoteService),
      act: (cubit) => cubit.setProp(ControlPropType.aperture, '4.0'),
      expect: () => [
        const PropsControlState.updateFailed([]),
      ],
    );

    blocTest<PropsControlCubit, PropsControlState>(
      'emits [updatedFailed] when controlProps not initialized',
      seed: () => const PropsControlState.init(),
      setUp: () {
        mockCameraConnectionCubit.setupCameraConnected(cameraHandle);
      },
      build: () =>
          PropsControlCubit(mockCameraConnectionCubit, mockCameraRemoteService),
      act: (cubit) => cubit.setProp(ControlPropType.aperture, '4.0'),
      expect: () => [
        const PropsControlState.updateFailed([]),
      ],
    );

    blocTest<PropsControlCubit, PropsControlState>(
      'emits [updatedFailed] when there is no controlProp with provided propType',
      seed: () => const PropsControlState.updateSuccess([apertureControlProp]),
      setUp: () {
        mockCameraConnectionCubit.setupCameraConnected(cameraHandle);
      },
      build: () =>
          PropsControlCubit(mockCameraConnectionCubit, mockCameraRemoteService),
      act: (cubit) => cubit.setProp(ControlPropType.iso, '100'),
      expect: () => [
        const PropsControlState.updateFailed([apertureControlProp]),
      ],
    );

    blocTest<PropsControlCubit, PropsControlState>(
      'emits [updating, updateSuccess] when updating prop value succeeds',
      seed: () => const PropsControlState.updateSuccess([apertureControlProp]),
      setUp: () {
        mockCameraConnectionCubit.setupCameraConnected(cameraHandle);
        when(() => mockCameraRemoteService.setProp(
                cameraHandle, ControlPropType.aperture, '4.0'))
            .thenAnswer((invocation) async {});
      },
      build: () =>
          PropsControlCubit(mockCameraConnectionCubit, mockCameraRemoteService),
      act: (cubit) => cubit.setProp(ControlPropType.aperture, '4.0'),
      expect: () => [
        const PropsControlState.updating([apertureControlProp]),
        PropsControlState.updateSuccess(
            [apertureControlProp.copyWith(currentValue: '4.0')]),
      ],
    );

    blocTest<PropsControlCubit, PropsControlState>(
      'emits [updating, updateFailed] when setting prop fails',
      seed: () => const PropsControlState.updateSuccess([apertureControlProp]),
      setUp: () {
        mockCameraConnectionCubit.setupCameraConnected(cameraHandle);
        when(() => mockCameraRemoteService.setProp(
                cameraHandle, ControlPropType.aperture, '4.0'))
            .thenThrow((_) => Exception('failied to set prop'));
      },
      build: () =>
          PropsControlCubit(mockCameraConnectionCubit, mockCameraRemoteService),
      act: (cubit) => cubit.setProp(ControlPropType.aperture, '4.0'),
      expect: () => const [
        PropsControlState.updating([apertureControlProp]),
        PropsControlState.updateFailed([apertureControlProp]),
      ],
    );
  });
}
