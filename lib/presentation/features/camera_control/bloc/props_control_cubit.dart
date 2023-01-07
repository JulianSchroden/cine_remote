import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/control_prop.dart';
import '../../../../domain/models/control_prop_type.dart';
import '../../../../domain/services/camera_remote_service.dart';
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
  CameraConnectionCubit cameraConnectionCubit;
  CameraRemoteService cameraRemoteService;

  PropsControlCubit(
    this.cameraConnectionCubit,
    this.cameraRemoteService,
  ) : super(const PropsControlState.init());

  Future<void> init() async {
    await cameraConnectionCubit.withConnectedCamera((cameraHandle) async {
      emit(const PropsControlState.updating([]));

      try {
        final controlProps = <ControlProp>[];
        for (final propType in cameraHandle.supportedProps) {
          final controlProp =
              await cameraRemoteService.getProp(cameraHandle, propType);
          if (controlProp != null) {
            controlProps.add(controlProp);
          }
        }
        emit(PropsControlState.updateSuccess(controlProps));
      } catch (e) {
        emit(const PropsControlState.updateFailed([]));
      }
    }, orElse: () {
      emit(const PropsControlState.updateFailed([]));
    });
  }

  Future<void> setProp(ControlPropType propType, String value) async {
    await cameraConnectionCubit.withConnectedCamera(
      (cameraHandle) async {
        final previousControlProps = state.maybeWhen(
            updating: (props) => props,
            updateSuccess: (props) => props,
            updateFailed: (props) => props,
            orElse: () => <ControlProp>[]);

        final updatedControlProps =
            List<ControlProp>.from(previousControlProps);

        final propIndex =
            updatedControlProps.indexWhere((prop) => prop.type == propType);
        if (propIndex == -1) {
          emit(PropsControlState.updateFailed(previousControlProps));
          return;
        }

        emit(PropsControlState.updating(previousControlProps));

        try {
          updatedControlProps[propIndex] =
              updatedControlProps[propIndex].copyWith(currentValue: value);

          await cameraRemoteService.setProp(cameraHandle, propType, value);

          emit(PropsControlState.updateSuccess(updatedControlProps));
        } catch (e) {
          emit(PropsControlState.updateFailed(previousControlProps));
        }
      },
      orElse: () {
        emit(const PropsControlState.updateFailed([]));
      },
    );
  }
}
