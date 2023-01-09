import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:cine_remote/data/models/wifi_camera_handle.dart';
import 'package:cine_remote/domain/models/auto_focus_mode.dart';
import 'package:cine_remote/domain/models/camera_handle.dart';
import 'package:cine_remote/domain/models/camera_update_event.dart';
import 'package:cine_remote/domain/models/control_prop.dart';
import 'package:cine_remote/domain/models/control_prop_type.dart';
import 'package:cine_remote/presentation/features/camera_control/bloc/props_control_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers.dart';
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
    type: ControlPropType.iso,
    currentValue: '100',
    allowedValues: ['100', '200', '400', '800'],
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

  setupGetProp(
    CameraHandle cameraHandle,
    Map<ControlPropType, ControlProp?> propTypeToProp,
  ) {
    for (final entry in propTypeToProp.entries) {
      when(() => mockCameraRemoteService.getProp(cameraHandle, entry.key))
          .thenAnswer((_) async => entry.value);
    }
  }

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

        setupGetProp(cameraHandle, {
          ControlPropType.aperture: apertureControlProp,
          ControlPropType.iso: isoControlProp,
          ControlPropType.whiteBalance: null,
        });
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
      'emits [updating] with new value and isPending flag when updating prop value succeeds',
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
        PropsControlState.updating([
          apertureControlProp.copyWith(currentValue: '4.0', isPending: true)
        ]),
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
      expect: () => [
        PropsControlState.updating([
          apertureControlProp.copyWith(currentValue: '4.0', isPending: true)
        ]),
        const PropsControlState.updateFailed([apertureControlProp]),
      ],
    );
  });

  group('prop event handling', () {
    multiStepBlocTest<PropsControlCubit, PropsControlState,
        StreamController<CameraUpdateEvent>>(
      'should listen for updates and only emit [updateSuccess] for initialied props',
      setUp: () {
        mockCameraConnectionCubit.setupCameraConnected(cameraHandle);
        setupGetProp(cameraHandle, {
          ControlPropType.aperture: apertureControlProp,
          ControlPropType.iso: isoControlProp,
          ControlPropType.whiteBalance: null,
        });

        final cameraUpdateStreamController =
            StreamController<CameraUpdateEvent>();
        when(() => mockCameraConnectionCubit.updateEvents)
            .thenAnswer((_) => cameraUpdateStreamController.stream);
        return cameraUpdateStreamController;
      },
      build: () =>
          PropsControlCubit(mockCameraConnectionCubit, mockCameraRemoteService),
      steps: [
        BlocTestStep(
          'calling init should emit [updating, updateSuccess]',
          act: (cubit, updateStreamController) => cubit.init(),
          expect: () => const [
            PropsControlState.updating([]),
            PropsControlState.updateSuccess(
                [apertureControlProp, isoControlProp])
          ],
        ),
        BlocTestStep(
          'events which arent prop events should be ignored',
          act: (cubit, updateStreamController) {
            updateStreamController
                .add(const CameraUpdateEvent.focusMode(AutoFocusMode.off));
          },
          expect: () => [],
        ),
        BlocTestStep(
          'prop event of uninitialized propType should be ignored',
          act: (cubit, updateStreamController) {
            updateStreamController.add(const CameraUpdateEvent.prop(
                ControlPropType.whiteBalance, '5100'));
          },
          expect: () => [],
        ),
        BlocTestStep(
          'prop event of initialized propType should emit [updateSuccess]',
          act: (cubit, updateStreamController) {
            updateStreamController.add(
                const CameraUpdateEvent.prop(ControlPropType.aperture, '8.0'));
          },
          expect: () => [
            PropsControlState.updateSuccess([
              apertureControlProp.copyWith(
                currentValue: '8.0',
                isPending: false,
              ),
              isoControlProp
            ])
          ],
        )
      ],
    );

    multiStepBlocTest<PropsControlCubit, PropsControlState,
        StreamController<CameraUpdateEvent>>(
      'setProp and propEvent should set isPending flag correctly',
      setUp: () {
        mockCameraConnectionCubit.setupCameraConnected(cameraHandle);
        setupGetProp(cameraHandle, {
          ControlPropType.aperture: apertureControlProp,
          ControlPropType.iso: isoControlProp,
          ControlPropType.whiteBalance: null,
        });

        final cameraUpdateStreamController =
            StreamController<CameraUpdateEvent>();
        when(() => mockCameraConnectionCubit.updateEvents)
            .thenAnswer((_) => cameraUpdateStreamController.stream);
        return cameraUpdateStreamController;
      },
      build: () =>
          PropsControlCubit(mockCameraConnectionCubit, mockCameraRemoteService),
      steps: [
        BlocTestStep(
          'calling init should emit [updating, updateSuccess]',
          act: (cubit, updateStreamController) => cubit.init(),
          expect: () => const [
            PropsControlState.updating([]),
            PropsControlState.updateSuccess(
                [apertureControlProp, isoControlProp])
          ],
        ),
        BlocTestStep(
          'calling setProp should emit [updating] with isPending true',
          setUp: () {
            when(() => mockCameraRemoteService.setProp(
                  cameraHandle,
                  ControlPropType.iso,
                  '800',
                )).thenAnswer((_) async {});
          },
          act: (cubit, updateStreamController) =>
              cubit.setProp(ControlPropType.iso, '800'),
          expect: () => [
            PropsControlState.updating([
              apertureControlProp,
              isoControlProp.copyWith(
                currentValue: '800',
                isPending: true,
              )
            ])
          ],
        ),
        BlocTestStep(
          'should not emit when prop isPending and event contains different value',
          act: (cubit, updateStreamController) {
            updateStreamController
                .add(const CameraUpdateEvent.prop(ControlPropType.iso, '400'));
          },
          expect: () => [],
        ),
        BlocTestStep(
          'should emit [updateSuccess] with isPending false when event contains pending value',
          act: (cubit, updateStreamController) {
            updateStreamController
                .add(const CameraUpdateEvent.prop(ControlPropType.iso, '800'));
          },
          expect: () => [
            PropsControlState.updateSuccess([
              apertureControlProp,
              isoControlProp.copyWith(
                currentValue: '800',
                isPending: false,
              )
            ])
          ],
        )
      ],
    );
  });
}
