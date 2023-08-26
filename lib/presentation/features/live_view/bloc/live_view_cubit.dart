import 'dart:async';
import 'dart:typed_data';

import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../camera_control/bloc/base_camera_control_cubit.dart';

part 'live_view_cubit.freezed.dart';

enum LiveViewStatus {
  initial,
  initInProgress,
  unsupported,
  paused,
  loading,
  active,
  error,
}

@freezed
class LiveViewState with _$LiveViewState {
  const LiveViewState._();

  const factory LiveViewState({
    required LiveViewStatus status,
    Uint8List? imageBytes,
    @Default(16 / 9) double aspectRatio,
    @Default(false) bool supportsTouchAutofocus,
    TouchAutofocusState? autofocusState,
  }) = _LiveViewState;

  bool get isLiveViewActive => status == LiveViewStatus.active;
  bool get isLoading => status == LiveViewStatus.loading;

  bool get isLiveViewSupported => !isLiveViewUnsupported;
  bool get isLiveViewUnsupported => status == LiveViewStatus.unsupported;
}

class LiveViewCubit extends BaseCameraControlCubit<LiveViewState> {
  StreamSubscription<LiveViewData>? _liveViewStreamSubscription;

  LiveViewCubit(super.cameraConnectionCubit,
      [super.initialState =
          const LiveViewState(status: LiveViewStatus.initial)]);

  @override
  Future<void> close() async {
    await _liveViewStreamSubscription?.cancel();
    return super.close();
  }

  Future<void> init() async {
    emit(const LiveViewState(status: LiveViewStatus.initInProgress));
    try {
      final descriptor = await camera.getDescriptor();
      final liveViewCapability = descriptor.getCapability<LiveViewCapability>();
      emit(LiveViewState(
        status: LiveViewStatus.paused,
        aspectRatio: liveViewCapability.aspectRatio,
        supportsTouchAutofocus: liveViewCapability.supportsTouchAutofocus,
      ));
    } on UnsupportedCapabilityException {
      emit(const LiveViewState(status: LiveViewStatus.unsupported));
    } catch (e) {
      emit(const LiveViewState(status: LiveViewStatus.error));
    }
  }

  Future<void> toggleLiveView() async {
    if (state.isLiveViewUnsupported) {
      emit(const LiveViewState(status: LiveViewStatus.error));
      return;
    }

    emit(state.copyWith(status: LiveViewStatus.loading));
    if (_liveViewStreamSubscription != null) {
      await _stopLiveView();
      return;
    }

    await _startLiveView();
  }

  Future<void> setTouchAutofocus(AutofocusPosition autofocusPosition) async {
    try {
      await camera.setAutofocusPosition(autofocusPosition);
    } catch (e) {
      emit(const LiveViewState(status: LiveViewStatus.error));
    }
  }

  Future<void> _stopLiveView() async {
    await _liveViewStreamSubscription?.cancel();
    _liveViewStreamSubscription = null;
    emit(state.copyWith(status: LiveViewStatus.paused));
  }

  Future<void> _startLiveView() async {
    try {
      emit(state.copyWith(status: LiveViewStatus.loading));

      _liveViewStreamSubscription = camera.liveView().listen(
        (liveViewData) {
          emit(state.copyWith(
            status: LiveViewStatus.active,
            imageBytes: liveViewData.imageBytes,
            autofocusState: liveViewData.autofocusState,
          ));
        },
        onError: (e, s) {
          if (e is CameraCommunicationAbortedException) {
            cameraConnectionCubit.handleConnectionAborted(
                'liveView error', e, s);
            return;
          }

          emit(state.copyWith(
            status: LiveViewStatus.error,
          ));
        },
        onDone: () {
          emit(state.copyWith(status: LiveViewStatus.paused));
        },
      );
    } catch (e) {
      emit(
        state.copyWith(status: LiveViewStatus.error),
      );
    }
  }
}
