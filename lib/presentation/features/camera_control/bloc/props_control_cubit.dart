import 'dart:async';

import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:equatable/equatable.dart';

import '../../../../shared/extensions/list_extensions.dart';
import '../../../core/adapter/date_time_adapter.dart';
import '../../../core/extensions/control_prop_extension.dart';
import 'base_camera_control_cubit.dart';

sealed class PropsControlState extends Equatable {
  final List<ControlProp> controlProps;

  const PropsControlState(this.controlProps);

  const factory PropsControlState.init() = PropsControlInitState;
  const factory PropsControlState.updating(List<ControlProp> props) =
      PropsControlUpdatingState;
  const factory PropsControlState.updateSuccess(List<ControlProp> props) =
      PropsControlUpdateSuccessState;
  const factory PropsControlState.updateFailed(List<ControlProp> props) =
      PropsControlUpdateFailedState;

  T maybeWhen<T>({
    T Function()? init,
    T Function(List<ControlProp> props)? updating,
    T Function(List<ControlProp> props)? updateSuccess,
    T Function(List<ControlProp> props)? updateFailed,
    required T Function() orElse,
  }) =>
      switch (this) {
        PropsControlInitState() => init?.call() ?? orElse(),
        PropsControlUpdatingState(:final controlProps) =>
          updating?.call(controlProps) ?? orElse(),
        PropsControlUpdateSuccessState(:final controlProps) =>
          updateSuccess?.call(controlProps) ?? orElse(),
        PropsControlUpdateFailedState(:final controlProps) =>
          updateFailed?.call(controlProps) ?? orElse(),
      };

  @override
  List<Object?> get props => [controlProps];

  ControlProp getProp(ControlPropType propType) =>
      controlProps.firstWhere((prop) => prop.type == propType);
}

class PropsControlInitState extends PropsControlState {
  const PropsControlInitState([super.controlProps = const []]);
}

class PropsControlUpdatingState extends PropsControlState {
  const PropsControlUpdatingState(super.controlProps);
}

class PropsControlUpdateSuccessState extends PropsControlState {
  const PropsControlUpdateSuccessState(super.controlProps);
}

class PropsControlUpdateFailedState extends PropsControlState {
  const PropsControlUpdateFailedState(super.controlProps);
}

class PropsControlCubit extends BaseCameraControlCubit<PropsControlState> {
  static const pendingDuration = Duration(seconds: 2);
  final DateTimeAdapter _dateTimeAdapter;
  StreamSubscription<CameraUpdateEvent>? _updateStreamSubscription;

  PropsControlCubit(
    super.cameraConnectionCubit,
    this._dateTimeAdapter, [
    super.initialState = const PropsControlState.init(),
  ]);

  @override
  Future<void> close() async {
    _updateStreamSubscription?.cancel();
    return super.close();
  }

  Future<void> init() async {
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
  }

  Future<void> setProp(ControlPropType propType, ControlPropValue value) async {
    final previousProps = state.controlProps;
    try {
      final camera = this.camera;
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
  }

  Future<void> _setupUpdateListener() async {
    await _updateStreamSubscription?.cancel();
    _updateStreamSubscription = cameraConnectionCubit.updateEvents.listen(
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
    final prop =
        state.controlProps.firstWhereOrNull((prop) => prop.type == propType);

    if (prop == null) {
      return;
    }

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
