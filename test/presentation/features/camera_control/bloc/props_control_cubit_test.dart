import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:cine_remote/camera_control/interface/models/auto_focus_mode.dart';
import 'package:cine_remote/camera_control/interface/models/camera_handle.dart';
import 'package:cine_remote/camera_control/interface/models/camera_update_event.dart';
import 'package:cine_remote/camera_control/interface/models/control_prop.dart';
import 'package:cine_remote/camera_control/interface/models/control_prop_type.dart';
import 'package:cine_remote/presentation/features/camera_control/bloc/props_control_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers.dart';
import '../../../../test_mocks.dart';

void main() {}
/*
void main() {
  late MockCameraConnectionCubit mockCameraConnectionCubit;
  late MockCamera mockCamera;
  late MockDateTimeAdapter mockDateTimeAdapter;

  const cameraHandle = EosCineHttpCameraHandle(
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

  final nowTime = DateTime(2023, 1, 10, 9, 18, 0);

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
    mockCamera = MockCamera();
    mockDateTimeAdapter = MockDateTimeAdapter();
    when(() => mockDateTimeAdapter.now()).thenReturn(nowTime);
  });

  setupGetProp(
    CameraHandle cameraHandle,
    Map<ControlPropType, ControlProp?> propTypeToProp,
  ) {
    for (final entry in propTypeToProp.entries) {
      when(() => mockCamera.getProp(cameraHandle, entry.key))
          .thenAnswer((_) async => entry.value);
    }
  }

  group('init', () {
    blocTest<PropsControlCubit, PropsControlState>(
      'emits [updatedFailed] when camera not connected',
      seed: () => const PropsControlState.updateSuccess([]),
      setUp: () => mockCameraConnectionCubit.setupCameraDisconnected(),
      build: () => PropsControlCubit(
          mockCameraConnectionCubit, mockCamera, mockDateTimeAdapter),
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
      build: () => PropsControlCubit(
          mockCameraConnectionCubit, mockCamera, mockDateTimeAdapter),
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

        when(() => mockCamera.getProp(cameraHandle, ControlPropType.aperture))
            .thenThrow(() => Exception('failed to get prop'));
      },
      build: () => PropsControlCubit(
          mockCameraConnectionCubit, mockCamera, mockDateTimeAdapter),
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
      build: () => PropsControlCubit(
          mockCameraConnectionCubit, mockCamera, mockDateTimeAdapter),
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
      build: () => PropsControlCubit(
          mockCameraConnectionCubit, mockCamera, mockDateTimeAdapter),
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
      build: () => PropsControlCubit(
          mockCameraConnectionCubit, mockCamera, mockDateTimeAdapter),
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
        when(() => mockCamera.setProp(
                cameraHandle, ControlPropType.aperture, '4.0'))
            .thenAnswer((invocation) async {});
      },
      build: () => PropsControlCubit(
          mockCameraConnectionCubit, mockCamera, mockDateTimeAdapter),
      act: (cubit) => cubit.setProp(ControlPropType.aperture, '4.0'),
      expect: () => [
        PropsControlState.updating([
          apertureControlProp.copyWith(
              currentValue: '4.0', pendingSince: nowTime)
        ]),
      ],
    );

    blocTest<PropsControlCubit, PropsControlState>(
      'emits [updating, updateFailed] when setting prop fails',
      seed: () => const PropsControlState.updateSuccess([apertureControlProp]),
      setUp: () {
        mockCameraConnectionCubit.setupCameraConnected(cameraHandle);
        when(() => mockCamera.setProp(
                cameraHandle, ControlPropType.aperture, '4.0'))
            .thenThrow((_) => Exception('failied to set prop'));
      },
      build: () => PropsControlCubit(
          mockCameraConnectionCubit, mockCamera, mockDateTimeAdapter),
      act: (cubit) => cubit.setProp(ControlPropType.aperture, '4.0'),
      expect: () => [
        PropsControlState.updating([
          apertureControlProp.copyWith(
            currentValue: '4.0',
            pendingSince: nowTime,
          )
        ]),
        const PropsControlState.updateFailed([apertureControlProp]),
      ],
    );
  });

  group('prop event handling', () {
    StreamController<CameraUpdateEvent> propEventTestSetup() {
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
    }

    BlocTestStep<PropsControlCubit,
            PropsControlState, StreamController<CameraUpdateEvent>>
        initBlocStep() => BlocTestStep(
              'calling init should emit [updating, updateSuccess]',
              act: (cubit, updateStreamController) => cubit.init(),
              expect: () => const [
                PropsControlState.updating([]),
                PropsControlState.updateSuccess(
                    [apertureControlProp, isoControlProp])
              ],
            );

    BlocTestStep<PropsControlCubit, PropsControlState,
            StreamController<CameraUpdateEvent>>
        setIsoPropBlocStep() => BlocTestStep(
              'calling setProp should emit [updating] with pendingSince set to current time',
              setUp: () {
                when(() => mockCamera.setProp(
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
                    pendingSince: nowTime,
                  )
                ])
              ],
            );

    multiStepBlocTest<PropsControlCubit, PropsControlState,
        StreamController<CameraUpdateEvent>>(
      'should listen for updates and only emit [updateSuccess] for initialized props',
      setUp: propEventTestSetup,
      build: () => PropsControlCubit(
          mockCameraConnectionCubit, mockCamera, mockDateTimeAdapter),
      steps: [
        initBlocStep(),
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
              apertureControlProp.copyWith(currentValue: '8.0'),
              isoControlProp
            ])
          ],
        )
      ],
    );

    multiStepBlocTest<PropsControlCubit, PropsControlState,
        StreamController<CameraUpdateEvent>>(
      'propEvent should only emit pending value when prop is pending',
      setUp: propEventTestSetup,
      build: () => PropsControlCubit(
          mockCameraConnectionCubit, mockCamera, mockDateTimeAdapter),
      steps: [
        initBlocStep(),
        setIsoPropBlocStep(),
        BlocTestStep(
          'should not emit when prop is pending and event contains different value',
          act: (cubit, updateStreamController) {
            updateStreamController
                .add(const CameraUpdateEvent.prop(ControlPropType.iso, '400'));
          },
          expect: () => [],
        ),
        BlocTestStep(
          'should emit [updateSuccess] with pendingSince set to null when event contains pending value',
          act: (cubit, updateStreamController) {
            updateStreamController
                .add(const CameraUpdateEvent.prop(ControlPropType.iso, '800'));
          },
          expect: () => [
            PropsControlState.updateSuccess([
              apertureControlProp,
              isoControlProp.copyWith(
                currentValue: '800',
                pendingSince: null,
              )
            ])
          ],
        )
      ],
    );

    multiStepBlocTest<PropsControlCubit, PropsControlState,
        StreamController<CameraUpdateEvent>>(
      'should reset pending state after pendingDuration to ensure state is not dead locked',
      setUp: propEventTestSetup,
      build: () => PropsControlCubit(
          mockCameraConnectionCubit, mockCamera, mockDateTimeAdapter),
      steps: [
        initBlocStep(),
        setIsoPropBlocStep(),
        BlocTestStep(
          'should emit [updateSuccess] with value from propEvent when pendingDuration is over',
          setUp: () {
            when(() => mockDateTimeAdapter.now()).thenReturn(nowTime.add(
                PropsControlCubit.pendingDuration +
                    const Duration(milliseconds: 100)));
          },
          act: (cubit, updateStreamController) {
            updateStreamController
                .add(const CameraUpdateEvent.prop(ControlPropType.iso, '400'));
          },
          expect: () => [
            PropsControlState.updateSuccess([
              apertureControlProp,
              isoControlProp.copyWith(currentValue: '400')
            ])
          ],
        ),
      ],
    );
  });
}
*/