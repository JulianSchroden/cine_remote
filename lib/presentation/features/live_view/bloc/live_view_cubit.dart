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
  Timer? _pollImageTimer;
  Completer? _getLiveViewImageCompleter;

  LiveViewCubit(
    this._cameraConnectionCubit,
  ) : super(const LiveViewState(isLiveViewActive: false));

  @override
  Future<void> close() async {
    _pollImageTimer?.cancel();
    return super.close();
  }

  Future<void> toggleLiveView() async {
    await _cameraConnectionCubit.withConnectedCamera(
      (camera) async {
        emit(state.copyWith(hasError: false, isLoading: true));

        if (!state.isLiveViewActive) {
          await camera.startLiveView();
          _startPollImageTimer();
          emit(state.copyWith(isLoading: false, isLiveViewActive: true));
        } else {
          _pollImageTimer?.cancel();
          await camera.stopLiveView();
          emit(state.copyWith(isLoading: false, isLiveViewActive: false));
        }
      },
      orElse: () => emit(state.copyWith(isLoading: false, hasError: true)),
    );
  }

  void _startPollImageTimer() {
    _pollImageTimer?.cancel();
    _pollImageTimer =
        Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (!(_getLiveViewImageCompleter?.isCompleted ?? true)) {
        print('!! skipping frame !!');
        return;
      }

      _getLiveViewImageCompleter = Completer<void>();

      _cameraConnectionCubit.withConnectedCamera(
        (camera) async {
          camera.getLiveViewImage().then((imageBytes) {
            _getLiveViewImageCompleter?.complete();
            emit(state.copyWith(imageBytes: imageBytes));
          }).catchError((error) {
            _getLiveViewImageCompleter?.completeError(error);
          });
        },
        orElse: () {
          timer.cancel;
          emit(state.copyWith(hasError: true));
        },
      );
    });
  }
}
