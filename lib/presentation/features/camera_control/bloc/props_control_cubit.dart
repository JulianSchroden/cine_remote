import 'dart:async';

import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/extensions/list_extensions.dart';
import '../../../core/adapter/date_time_adapter.dart';
import '../../../core/extensions/control_prop_extension.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';

part 'props_control_cubit.freezed.dart';

@freezed
class PropsControlState with _$PropsControlState {
  const PropsControlState._();

  const factory PropsControlState.init() = _Init;
  const factory PropsControlState.updating(List<ControlProp> props) = _Updating;
  const factory PropsControlState.updateSuccess(List<ControlProp> props) =
      _UpdateSuccess;
  const factory PropsControlState.updateFailed(List<ControlProp> props) =
      _UpdateFailed;

  List<ControlProp> get controlProps => maybeWhen(
      updating: (props) => props,
      updateSuccess: (props) => props,
      updateFailed: (props) => props,
      orElse: () => <ControlProp>[]);

  ControlProp getProp(ControlPropType propType) =>
      controlProps.firstWhere((prop) => prop.type == propType);
}

class PropsControlCubit extends Cubit<PropsControlState> {
  static const pendingDuration = Duration(seconds: 2);
  final CameraConnectionCubit _cameraConnectionCubit;
  final DateTimeAdapter _dateTimeAdapter;
  StreamSubscription<CameraUpdateEvent>? _updateStreamSubscription;

  PropsControlCubit(
    this._cameraConnectionCubit,
    this._dateTimeAdapter,
  ) : super(const PropsControlState.init());

  @override
  Future<void> close() async {
    _updateStreamSubscription?.cancel();
    return super.close();
  }

  Future<void> init() async {
    await _cameraConnectionCubit.withConnectedCamera((camera) async {
      emit(const PropsControlState.updating([]));

      try {
        final descriptor = await camera.getDescriptor();
        final controlPropCapability =
            descriptor.getCapability<ControlPropCapability>();

        final controlProps = <ControlProp>[];
        for (final propType in controlPropCapability.supportedProps) {
          final controlProp = await camera.getProp(propType);
          if (controlProp != null) {
            controlProps.add(controlProp);
          }
        }

        await _setupUpdateListener();

        emit(PropsControlState.updateSuccess(controlProps));
      } catch (e) {
        emit(const PropsControlState.updateFailed([]));
      }
    }, orElse: () {
      emit(const PropsControlState.updateFailed([]));
    });
  }

  Future<void> setProp(ControlPropType propType, ControlPropValue value) async {
    await _cameraConnectionCubit.withConnectedCamera(
      (camera) async {
        final previousProps = state.controlProps;
        try {
          final updatedProps = state.controlProps.copyWith(
            predecate: (prop) => prop.type == propType,
            transform: (prop) => prop.copyWith(
              currentValue: value,
              pendingSince: _dateTimeAdapter.now(),
            ),
          );

          emit(PropsControlState.updating(updatedProps));

          await camera.setProp(propType, value);
        } catch (e) {
          emit(PropsControlState.updateFailed(previousProps));
        }
      },
      orElse: () {
        emit(const PropsControlState.updateFailed([]));
      },
    );
  }

  Future<void> _setupUpdateListener() async {
    await _updateStreamSubscription?.cancel();
    _updateStreamSubscription = _cameraConnectionCubit.updateEvents.listen(
      (event) {
        event.maybeWhen(
          propValueChanged: _handlePropValueChanged,
          propAllowedValuesChanged: _handleAllowedValuesChanged,
          orElse: () {},
        );
      },
    );
  }

  void _handlePropValueChanged(
      ControlPropType propType, ControlPropValue value) {
    final prop = state.getProp(propType);
    final isWithinPendingTime =
        prop.isWithinPendingTime(_dateTimeAdapter.now(), pendingDuration);
    final isWaitingForPendingValue =
        isWithinPendingTime && prop.currentValue != value;
    if (isWaitingForPendingValue) {
      return;
    }

    final updatedProps = state.controlProps.copyWith(
      predecate: (prop) => prop.type == propType,
      transform: (prop) => prop.copyWith(
        currentValue: value,
        pendingSince: null,
      ),
    );

    emit(PropsControlState.updateSuccess(updatedProps));
  }

  void _handleAllowedValuesChanged(
      ControlPropType propType, List<ControlPropValue> allowedValue) {
    final updatedProps = state.controlProps.copyWith(
      predecate: (prop) => prop.type == propType,
      transform: (prop) => prop.copyWith(
        allowedValues: allowedValue,
      ),
    );

    emit(PropsControlState.updateSuccess(updatedProps));
  }
}
