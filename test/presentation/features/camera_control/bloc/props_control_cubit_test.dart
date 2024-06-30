import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:cine_remote/presentation/features/camera_control/bloc/props_control_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers.dart';
import '../../../../test_mocks.dart';

class DummyControlValue extends ControlPropValue {
  @override
  final String value;

  const DummyControlValue(this.value);

  @override
  List<Object?> get props => [value];
}

class MockControlValue extends Mock implements ControlPropValue {}

class FakeControlValue extends Fake implements ControlPropValue {}

void main() {
  late MockCameraConnectionCubit mockCameraConnectionCubit;
  late MockCamera mockCamera;
  late MockDateTimeAdapter mockDateTimeAdapter;

  ControlPropValue propValue(String value) {
    return DummyControlValue(value);
  }

  final apertureControlProp = ControlProp(
    type: ControlPropType.aperture,
    currentValue: propValue('2.8'),
    allowedValues: [
      propValue('2.8'),
      propValue('4.0'),
      propValue('5.6'),
    ],
  );
  final isoControlProp = ControlProp(
    type: ControlPropType.iso,
    currentValue: propValue('100'),
    allowedValues: [
      propValue('100'),
      propValue('200'),
      propValue('400'),
      propValue('800')
    ],
  );

  final nowTime = DateTime(2023, 1, 10, 9, 18, 0);

  setUpAll(() {
    registerFallbackValue(FakeControlValue());
  });

  setUp(() {
    mockCameraConnectionCubit = MockCameraConnectionCubit();
    mockCamera = MockCamera();
    mockDateTimeAdapter = MockDateTimeAdapter();
    when(() => mockDateTimeAdapter.now()).thenReturn(nowTime);
  });

  void setupControlPropCapability(List<ControlPropType> supportedProps) {
    final mockDescriptor = MockCameraDescriptor();
    when(() => mockDescriptor.getCapability<ControlPropCapability>())
        .thenReturn(ControlPropCapability(supportedProps: supportedProps));
    when(() => mockCamera.getDescriptor())
        .thenAnswer((_) => Future.value(mockDescriptor));
  }

  void setupGetProp(
    Map<ControlPropType, ControlProp?> propTypeToProp,
  ) {
    for (final entry in propTypeToProp.entries) {
      when(() => mockCamera.getProp(entry.key))
          .thenAnswer((_) async => entry.value);
    }
  }

  void setupCameraConnected() {
    when(() => mockCameraConnectionCubit.camera).thenReturn(mockCamera);
  }

  PropsControlCubit buildBloc() =>
      PropsControlCubit(mockCameraConnectionCubit, mockDateTimeAdapter);

  group('init', () {
    blocTest<PropsControlCubit, PropsControlState>(
      'emits [updatedFailed] when camera not connected',
      seed: () => const PropsControlState.updateSuccess([]),
      build: buildBloc,
      act: (cubit) => cubit.init(),
      expect: () => [
        const PropsControlState.updating([]),
        const PropsControlState.updateFailed([]),
      ],
    );

    blocTest<PropsControlCubit, PropsControlState>(
      'emits [updating, updateSuccess] when reading initial prop data succeeds',
      seed: () => const PropsControlState.updateSuccess([]),
      setUp: () {
        setupCameraConnected();
        when(() => mockCameraConnectionCubit.updateEvents)
            .thenAnswer((_) => const Stream.empty());

        setupControlPropCapability([
          ControlPropType.aperture,
          ControlPropType.iso,
          ControlPropType.whiteBalance,
        ]);

        setupGetProp({
          ControlPropType.aperture: apertureControlProp,
          ControlPropType.iso: isoControlProp,
          ControlPropType.whiteBalance: null,
        });
      },
      build: buildBloc,
      act: (cubit) => cubit.init(),
      expect: () => [
        const PropsControlState.updating([]),
        PropsControlState.updateSuccess([
          apertureControlProp,
          isoControlProp,
        ]),
      ],
    );

    blocTest<PropsControlCubit, PropsControlState>(
      'emits [updating, updateFailed] when getting prop data throws',
      seed: () => const PropsControlState.updateSuccess([]),
      setUp: () {
        setupCameraConnected();

        when(() => mockCamera.getProp(ControlPropType.aperture))
            .thenThrow(() => Exception('failed to get prop'));
      },
      build: buildBloc,
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
      setUp: () {
        when(() => mockCamera.setProp(ControlPropType.aperture, any()))
            .thenAnswer((_) => Future<void>.value());
      },
      build: buildBloc,
      act: (cubit) => cubit.setProp(ControlPropType.aperture, propValue('4.0')),
    );

    blocTest<PropsControlCubit, PropsControlState>(
      'emits [updatedFailed] when controlProps not initialized',
      seed: () => const PropsControlState.init(),
      setUp: () {
        setupCameraConnected();
      },
      build: buildBloc,
      act: (cubit) => cubit.setProp(ControlPropType.aperture, propValue('4.0')),
      expect: () => [
        const PropsControlState.updateFailed([]),
      ],
    );

    blocTest<PropsControlCubit, PropsControlState>(
      'emits [updatedFailed] when there is no controlProp with provided propType',
      seed: () => PropsControlState.updateSuccess([apertureControlProp]),
      setUp: () {
        setupCameraConnected();
      },
      build: buildBloc,
      act: (cubit) => cubit.setProp(ControlPropType.iso, propValue('100')),
      expect: () => [
        PropsControlState.updateFailed([apertureControlProp]),
      ],
    );

    blocTest<PropsControlCubit, PropsControlState>(
      'emits [updating] with new value and isPending flag when updating prop value succeeds',
      seed: () => PropsControlState.updateSuccess([apertureControlProp]),
      setUp: () {
        setupCameraConnected();
        when(() => mockCamera.setProp(ControlPropType.aperture, any()))
            .thenAnswer((invocation) async {});
      },
      build: buildBloc,
      act: (cubit) => cubit.setProp(ControlPropType.aperture, propValue('4.0')),
      expect: () => [
        PropsControlState.updating([
          apertureControlProp.copyWith(
            currentValue: propValue('4.0'),
            pendingSince: nowTime,
          )
        ]),
      ],
    );

    blocTest<PropsControlCubit, PropsControlState>(
      'emits [updating, updateFailed] when setting prop fails',
      seed: () => PropsControlState.updateSuccess([apertureControlProp]),
      setUp: () {
        setupCameraConnected();
        when(() =>
                mockCamera.setProp(ControlPropType.aperture, propValue('4.0')))
            .thenThrow((_) => Exception('failied to set prop'));
      },
      build: buildBloc,
      act: (cubit) => cubit.setProp(ControlPropType.aperture, propValue('4.0')),
      expect: () => [
        PropsControlState.updating([
          apertureControlProp.copyWith(
            currentValue: propValue('4.0'),
            pendingSince: nowTime,
          )
        ]),
        PropsControlState.updateFailed([apertureControlProp]),
      ],
    );
  });

  group('prop event handling', () {
    StreamController<CameraUpdateEvent> propEventTestSetup() {
      setupCameraConnected();
      setupGetProp({
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
              setUp: () {
                setupControlPropCapability([
                  ControlPropType.aperture,
                  ControlPropType.iso,
                  ControlPropType.whiteBalance,
                ]);
              },
              act: (cubit, updateStreamController) => cubit.init(),
              expect: () => [
                const PropsControlState.updating([]),
                PropsControlState.updateSuccess([
                  apertureControlProp,
                  isoControlProp,
                ])
              ],
            );

    BlocTestStep<PropsControlCubit, PropsControlState,
        StreamController<CameraUpdateEvent>> setIsoPropBlocStep(
      String value,
    ) =>
        BlocTestStep(
          'calling setProp should emit [updating] with pendingSince set to current time',
          setUp: () {
            when(() => mockCamera.setProp(
                  ControlPropType.iso,
                  propValue(value),
                )).thenAnswer((_) async {});
          },
          act: (cubit, updateStreamController) =>
              cubit.setProp(ControlPropType.iso, propValue('800')),
          expect: () => [
            PropsControlState.updating([
              apertureControlProp,
              isoControlProp.copyWith(
                currentValue: propValue(value),
                pendingSince: nowTime,
              )
            ])
          ],
        );

    multiStepBlocTest<PropsControlCubit, PropsControlState,
        StreamController<CameraUpdateEvent>>(
      'should listen for updates and only emit [updateSuccess] for initialized props',
      setUp: propEventTestSetup,
      build: buildBloc,
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
            updateStreamController.add(CameraUpdateEvent.propValueChanged(
              ControlPropType.whiteBalance,
              propValue('5100'),
            ));
          },
          expect: () => [],
        ),
        BlocTestStep(
          'prop event of initialized propType should emit [updateSuccess]',
          act: (cubit, updateStreamController) {
            updateStreamController.add(CameraUpdateEvent.propValueChanged(
              ControlPropType.aperture,
              propValue('8.0'),
            ));
          },
          expect: () => [
            PropsControlState.updateSuccess([
              apertureControlProp.copyWith(currentValue: propValue('8.0')),
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
      build: buildBloc,
      steps: [
        initBlocStep(),
        setIsoPropBlocStep('800'),
        BlocTestStep(
          'should not emit when prop is pending and event contains different value',
          act: (cubit, updateStreamController) {
            updateStreamController.add(CameraUpdateEvent.propValueChanged(
              ControlPropType.iso,
              propValue('400'),
            ));
          },
          expect: () => [],
        ),
        BlocTestStep(
          'should emit [updateSuccess] with pendingSince set to null when event contains pending value',
          act: (cubit, updateStreamController) {
            updateStreamController.add(CameraUpdateEvent.propValueChanged(
              ControlPropType.iso,
              propValue('800'),
            ));
          },
          expect: () => [
            PropsControlState.updateSuccess([
              apertureControlProp,
              isoControlProp.copyWith(
                currentValue: propValue('800'),
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
      build: buildBloc,
      steps: [
        initBlocStep(),
        setIsoPropBlocStep('800'),
        BlocTestStep(
          'should emit [updateSuccess] with value from propEvent when pendingDuration is over',
          setUp: () {
            when(() => mockDateTimeAdapter.now()).thenReturn(nowTime.add(
                PropsControlCubit.pendingDuration +
                    const Duration(milliseconds: 100)));
          },
          act: (cubit, updateStreamController) {
            updateStreamController.add(CameraUpdateEvent.propValueChanged(
              ControlPropType.iso,
              propValue('400'),
            ));
          },
          expect: () => [
            PropsControlState.updateSuccess([
              apertureControlProp,
              isoControlProp.copyWith(
                currentValue: propValue('400'),
                pendingSince: null,
              )
            ])
          ],
        ),
      ],
    );
  });
}
