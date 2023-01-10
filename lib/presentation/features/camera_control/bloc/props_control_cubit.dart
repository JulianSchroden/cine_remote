import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/camera_update_event.dart';
import '../../../../domain/models/control_prop.dart';
import '../../../../domain/models/control_prop_type.dart';
import '../../../../domain/services/camera_remote_service.dart';
import '../../../../domain/services/date_time_adapter.dart';
import '../../../core/extensions/control_prop_extension.dart';
import '../../../core/extensions/list_copy_with.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';

part 'props_control_cubit.freezed.dart';

@freezed
class PropsControlState with _$PropsControlState {
  const factory PropsControlState.init() = _Init;
  const factory PropsControlState.updating(List<ControlProp> props) = _Updating;
  const factory PropsControlState.updateSuccess(List<ControlProp> props) =
      _UpdateSuccess;
  const factory PropsControlState.updateFailed(List<ControlProp> props) =
      _UpdateFailed;
}

class PropsControlCubit extends Cubit<PropsControlState> {
  static const pendingDuration = Duration(seconds: 2);
  final CameraConnectionCubit _cameraConnectionCubit;
  final CameraRemoteService _cameraRemoteService;
  final DateTimeAdapter _dateTimeAdapter;
  StreamSubscription<CameraUpdateEvent>? _updateStreamSubscription;

  PropsControlCubit(
    this._cameraConnectionCubit,
    this._cameraRemoteService,
    this._dateTimeAdapter,
  ) : super(const PropsControlState.init());

  @override
  Future<void> close() async {
    _updateStreamSubscription?.cancel();
    return super.close();
  }

  Future<void> init() async {
    await _cameraConnectionCubit.withConnectedCamera((cameraHandle) async {
      emit(const PropsControlState.updating([]));

      try {
        final controlProps = <ControlProp>[];
        for (final propType in cameraHandle.supportedProps) {
          final controlProp =
              await _cameraRemoteService.getProp(cameraHandle, propType);
          if (controlProp != null) {
            controlProps.add(controlProp);
          }
        }

        _setupUpdateListener();

        emit(PropsControlState.updateSuccess(controlProps));
      } catch (e) {
        emit(const PropsControlState.updateFailed([]));
      }
    }, orElse: () {
      emit(const PropsControlState.updateFailed([]));
    });
  }

  Future<void> setProp(ControlPropType propType, String value) async {
    await _cameraConnectionCubit.withConnectedCamera(
      (cameraHandle) async {
        final previousProps = currentControlProps;
        try {
          final updatedProps = currentControlProps.copyWith(
            predecate: (prop) => prop.type == propType,
            transform: (prop) => prop.copyWith(
              currentValue: value,
              pendingSince: _dateTimeAdapter.now(),
            ),
          );

          emit(PropsControlState.updating(updatedProps));

          await _cameraRemoteService.setProp(cameraHandle, propType, value);
        } catch (e) {
          emit(PropsControlState.updateFailed(previousProps));
        }
      },
      orElse: () {
        emit(const PropsControlState.updateFailed([]));
      },
    );
  }

  List<ControlProp> get currentControlProps => state.maybeWhen(
      updating: (props) => props,
      updateSuccess: (props) => props,
      updateFailed: (props) => props,
      orElse: () => <ControlProp>[]);

  void _setupUpdateListener() {
    _updateStreamSubscription = _cameraConnectionCubit.updateEvents
        .where((event) =>
            event.maybeWhen(prop: (_, __) => true, orElse: () => false))
        .listen((event) {
      event.maybeWhen(
          prop: (propType, value) {
            try {
              final prop = _getProp(propType);
              final isWithinPendingTime = prop.isWithinPendingTime(
                  _dateTimeAdapter.now(), pendingDuration);
              final isWaitingForPendingValue =
                  isWithinPendingTime && prop.currentValue != value;
              if (isWaitingForPendingValue) {
                return;
              }

              final updatedProps = currentControlProps.copyWith(
                predecate: (prop) => prop.type == propType,
                transform: (prop) => prop.copyWith(
                  currentValue: value,
                  pendingSince: null,
                ),
              );

              emit(PropsControlState.updateSuccess(updatedProps));
            } catch (e) {}
          },
          orElse: () {});
    });
  }

  ControlProp _getProp(ControlPropType propType) =>
      currentControlProps.firstWhere((prop) => prop.type == propType);
}
