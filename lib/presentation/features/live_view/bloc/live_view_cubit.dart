import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../camera_connection/bloc/camera_connection_cubit.dart';

part 'live_view_cubit.freezed.dart';

@freezed
class LiveViewState with _$LiveViewState {
  const factory LiveViewState({
    required bool isLiveViewActive,
    Uint8List? imageBytes,
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
  }) = _LiveViewState;
}

class LiveViewCubit extends Cubit<LiveViewState> {
  final CameraConnectionCubit _cameraConnectionCubit;
  StreamSubscription<Uint8List>? _liveViewStreamSubscription;

  LiveViewCubit(
    this._cameraConnectionCubit,
  ) : super(const LiveViewState(isLiveViewActive: false));

  @override
  Future<void> close() async {
    await _liveViewStreamSubscription?.cancel();
    return super.close();
  }

  Future<void> toggleLiveView() async {
    emit(state.copyWith(isLoading: true));

    if (_liveViewStreamSubscription != null) {
      await _liveViewStreamSubscription!.cancel();
      _liveViewStreamSubscription = null;
      emit(state.copyWith(isLoading: false, isLiveViewActive: false));
      return;
    }

    _cameraConnectionCubit.withConnectedCamera(
      (camera) {
        _liveViewStreamSubscription = camera.liveView().listen((imageBytes) {
          emit(state.copyWith(
            isLiveViewActive: true,
            isLoading: false,
            imageBytes: imageBytes,
            hasError: false,
          ));
        }, onError: (e, s) {
          emit(state.copyWith(
            isLoading: false,
            hasError: true,
          ));
        }, onDone: () {
          emit(state.copyWith(isLiveViewActive: false));
        });
      },
      orElse: () {
        emit(
          state.copyWith(
            isLoading: false,
            isLiveViewActive: false,
            hasError: true,
          ),
        );
      },
    );
  }
}
