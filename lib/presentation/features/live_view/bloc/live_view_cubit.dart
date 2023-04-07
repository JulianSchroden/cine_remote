import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../camera_control/interface/exceptions/unsupported_capability_exception.dart';
import '../../../../camera_control/interface/models/capabilities/live_view_capability.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';

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
    @Default(null) Uint8List? imageBytes,
    @Default(16 / 9) double aspectRatio,
  }) = _LiveViewState;

  bool get isLiveViewActive => status == LiveViewStatus.active;
}

class LiveViewCubit extends Cubit<LiveViewState> {
  final CameraConnectionCubit _cameraConnectionCubit;
  StreamSubscription<Uint8List>? _liveViewStreamSubscription;

  LiveViewCubit(
    this._cameraConnectionCubit,
  ) : super(const LiveViewState(status: LiveViewStatus.initial));

  @override
  Future<void> close() async {
    await _liveViewStreamSubscription?.cancel();
    return super.close();
  }

  Future<void> init() async {
    emit(const LiveViewState(status: LiveViewStatus.initInProgress));
    try {
      final descriptor = await _cameraConnectionCubit.camera.getDescriptor();
      final liveViewCapability = descriptor.getCapability<LiveViewCapability>();
      emit(LiveViewState(
        status: LiveViewStatus.paused,
        aspectRatio: liveViewCapability.aspectRatio,
      ));
    } on UnsupportedCapabilityException {
      emit(const LiveViewState(status: LiveViewStatus.unsupported));
    } catch (e) {
      emit(const LiveViewState(status: LiveViewStatus.error));
    }
  }

  Future<void> toggleLiveView() async {
    emit(state.copyWith(status: LiveViewStatus.loading));
    if (_liveViewStreamSubscription != null) {
      await _stopLiveView();
      return;
    }

    await _startLiveView();
  }

  Future<void> _stopLiveView() async {
    await _liveViewStreamSubscription?.cancel();
    _liveViewStreamSubscription = null;
    emit(state.copyWith(status: LiveViewStatus.paused));
  }

  Future<void> _startLiveView() async {
    try {
      final camera = _cameraConnectionCubit.camera;
      emit(state.copyWith(status: LiveViewStatus.loading));

      _liveViewStreamSubscription = camera.liveView().listen(
        (imageBytes) {
          emit(state.copyWith(
            status: LiveViewStatus.active,
            imageBytes: imageBytes,
          ));
        },
        onError: (e, s) {
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
