import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:cine_remote/presentation/features/live_view/bloc/live_view_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers.dart';
import '../../../../test_mocks.dart';

void main() {
  late MockCameraConnectionCubit mockCameraConnectionCubit;
  late MockCamera mockCamera;

  setUp(() {
    mockCamera = MockCamera();

    mockCameraConnectionCubit = MockCameraConnectionCubit();
    mockCameraConnectionCubit.setupCameraConnected(mockCamera);
  });

  group('init', () {
    blocTest<LiveViewCubit, LiveViewState>(
      'emits status [initInProgress, paused] when liveView supported',
      setUp: () {
        mockCamera.setupDescriptor(capabilities: const [
          LiveViewCapability(
            aspectRatio: 3 / 2,
            supportsTouchAutofocus: false,
          )
        ]);
      },
      build: () => LiveViewCubit(mockCameraConnectionCubit),
      act: (bloc) => bloc.init(),
      expect: () => const [
        LiveViewState(status: LiveViewStatus.initInProgress),
        LiveViewState(status: LiveViewStatus.paused, aspectRatio: 3 / 2),
      ],
      verify: (bloc) {
        verify(() => mockCamera.getDescriptor());
      },
    );

    blocTest<LiveViewCubit, LiveViewState>(
      'emits status [initInProgress, unsupported] when liveView not supported',
      setUp: () {
        mockCamera.setupDescriptor(capabilities: []);
      },
      build: () => LiveViewCubit(mockCameraConnectionCubit),
      act: (bloc) => bloc.init(),
      expect: () => const [
        LiveViewState(status: LiveViewStatus.initInProgress),
        LiveViewState(status: LiveViewStatus.unsupported),
      ],
    );

    blocTest<LiveViewCubit, LiveViewState>(
      'emits status [initInProgress, error] when camera not connected',
      setUp: () {
        mockCameraConnectionCubit.setupCameraDisconnected();
      },
      build: () => LiveViewCubit(mockCameraConnectionCubit),
      act: (bloc) => bloc.init(),
      expect: () => const [
        LiveViewState(status: LiveViewStatus.initInProgress),
        LiveViewState(status: LiveViewStatus.error),
      ],
    );
  });

  group('toggleLiveView', () {
    blocTest<LiveViewCubit, LiveViewState>(
      'emits status [error] when liveView unsupported',
      seed: () => const LiveViewState(status: LiveViewStatus.unsupported),
      build: () => LiveViewCubit(mockCameraConnectionCubit),
      act: (bloc) => bloc.toggleLiveView(),
      expect: () => [
        const LiveViewState(status: LiveViewStatus.error),
      ],
    );

    group('start:', () {
      blocTest(
        'emits status [loading, error] when camera not connected',
        setUp: () {
          mockCameraConnectionCubit.setupCameraDisconnected();
        },
        build: () => LiveViewCubit(mockCameraConnectionCubit),
        act: (bloc) => bloc.toggleLiveView(),
        expect: () => [
          const LiveViewState(status: LiveViewStatus.loading),
          const LiveViewState(status: LiveViewStatus.error),
        ],
      );

      blocTest<LiveViewCubit, LiveViewState>(
        'subscribes to stream',
        seed: () => const LiveViewState(
            status: LiveViewStatus.paused, aspectRatio: 16 / 9),
        setUp: () {
          when(() => mockCamera.liveView()).thenAnswer(
            (_) => Stream.fromIterable([
              LiveViewData(
                imageBytes: Uint8List(0),
              )
            ]),
          );
        },
        build: () => LiveViewCubit(mockCameraConnectionCubit),
        act: (bloc) => bloc.toggleLiveView(),
        verify: (bloc) {
          verify(() => mockCamera.liveView()).called(1);
        },
      );

      group('liveViewStream', () {
        multiStepBlocTest<LiveViewCubit, LiveViewState,
            StreamController<LiveViewData>>(
          'emits status [active] and updates imageBytes on event',
          seed: () => const LiveViewState(
              status: LiveViewStatus.paused, aspectRatio: 3 / 2),
          setUp: () {
            final streamController = StreamController<LiveViewData>();
            when(() => mockCamera.liveView())
                .thenAnswer((_) => streamController.stream);
            return streamController;
          },
          build: () => LiveViewCubit(mockCameraConnectionCubit),
          steps: [
            BlocTestStep(
              'connect to stream',
              act: (bloc, streamController) => bloc.toggleLiveView(),
              expect: () => [
                const LiveViewState(
                    status: LiveViewStatus.loading, aspectRatio: 3 / 2),
              ],
            ),
            BlocTestStep(
              'emits status [active] on event',
              act: (bloc, streamController) => streamController.add(
                LiveViewData(
                  imageBytes: Uint8List.fromList([0x0, 0x1]),
                ),
              ),
              expect: () => [
                LiveViewState(
                    status: LiveViewStatus.active,
                    aspectRatio: 3 / 2,
                    imageBytes: Uint8List.fromList([0x0, 0x1]))
              ],
            ),
          ],
        );
      });

      multiStepBlocTest<LiveViewCubit, LiveViewState,
          StreamController<LiveViewData>>(
        'emits status [error] on stream error',
        seed: () => const LiveViewState(
            status: LiveViewStatus.paused, aspectRatio: 3 / 2),
        setUp: () {
          final streamController = StreamController<LiveViewData>();
          when(() => mockCamera.liveView())
              .thenAnswer((_) => streamController.stream);
          return streamController;
        },
        build: () => LiveViewCubit(mockCameraConnectionCubit),
        steps: [
          BlocTestStep(
            'connect to stream',
            act: (bloc, streamController) => bloc.toggleLiveView(),
            expect: () => [
              const LiveViewState(
                  status: LiveViewStatus.loading, aspectRatio: 3 / 2),
            ],
          ),
          BlocTestStep(
            'emits status [error] on stream error',
            act: (bloc, streamController) => streamController.addError(Error()),
            expect: () => [
              const LiveViewState(
                status: LiveViewStatus.error,
                aspectRatio: 3 / 2,
              )
            ],
          ),
        ],
      );

      multiStepBlocTest<LiveViewCubit, LiveViewState,
          StreamController<LiveViewData>>(
        'emits status [paused] on stream done',
        seed: () => const LiveViewState(
            status: LiveViewStatus.paused, aspectRatio: 3 / 2),
        setUp: () {
          final streamController = StreamController<LiveViewData>();
          when(() => mockCamera.liveView())
              .thenAnswer((_) => streamController.stream);
          return streamController;
        },
        build: () => LiveViewCubit(mockCameraConnectionCubit),
        steps: [
          BlocTestStep(
            'connect to stream',
            act: (bloc, streamController) => bloc.toggleLiveView(),
            expect: () => [
              const LiveViewState(
                  status: LiveViewStatus.loading, aspectRatio: 3 / 2),
            ],
          ),
          BlocTestStep(
            'emits status [paused] when stream is done',
            act: (bloc, streamController) => streamController.close(),
            expect: () => [
              const LiveViewState(
                status: LiveViewStatus.paused,
                aspectRatio: 3 / 2,
              )
            ],
          ),
        ],
      );
    });

    group('stop', () {
      multiStepBlocTest<LiveViewCubit, LiveViewState,
          StreamController<LiveViewData>>(
        'terminates liveView Stream',
        seed: () => const LiveViewState(
            status: LiveViewStatus.paused, aspectRatio: 3 / 2),
        setUp: () {
          final streamController = StreamController<LiveViewData>();
          when(() => mockCamera.liveView())
              .thenAnswer((_) => streamController.stream);
          return streamController;
        },
        build: () => LiveViewCubit(mockCameraConnectionCubit),
        steps: [
          BlocTestStep(
            'connect to stream',
            act: (bloc, streamController) => bloc.toggleLiveView(),
            expect: () => [
              const LiveViewState(
                status: LiveViewStatus.loading,
                aspectRatio: 3 / 2,
              ),
            ],
            verify: (bloc, streamController) {
              expect(streamController.hasListener, true);
            },
          ),
          BlocTestStep(
            'emits status [active] on event',
            act: (bloc, streamController) => streamController.add(
              LiveViewData(
                imageBytes: Uint8List.fromList([0x0, 0x1]),
              ),
            ),
            expect: () => [
              LiveViewState(
                  status: LiveViewStatus.active,
                  aspectRatio: 3 / 2,
                  imageBytes: Uint8List.fromList([0x0, 0x1]))
            ],
          ),
          BlocTestStep(
            'disconnect from stream',
            act: (bloc, streamController) => bloc.toggleLiveView(),
            expect: () => [
              LiveViewState(
                status: LiveViewStatus.loading,
                aspectRatio: 3 / 2,
                imageBytes: Uint8List.fromList([0x0, 0x1]),
              ),
              LiveViewState(
                status: LiveViewStatus.paused,
                aspectRatio: 3 / 2,
                imageBytes: Uint8List.fromList([0x0, 0x1]),
              )
            ],
            verify: (bloc, streamController) {
              expect(streamController.hasListener, false);
            },
          )
        ],
      );
    });
  });
}
