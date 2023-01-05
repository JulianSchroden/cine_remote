import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/control_prop.dart';
import '../../../../domain/models/control_prop_type.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';

part 'props_control_cubit.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
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

  PropsControlCubit({
    required this.cameraConnectionCubit,
  }) : super(const PropsControlState.init());

  Future<void> init() async {
    final cameraHandle = cameraConnectionCubit.state
        .whenOrNull(connectSuccess: ((cameraHandle) => cameraHandle));
    if (cameraHandle == null) return;

    emit(const PropsControlState.updating([]));
    // getProp()
    final controlProps = cameraHandle.supportedProps
        .map((propType) => getDummyPropByType(propType))
        .toList();

    emit(PropsControlState.updateSuccess(controlProps));
  }

  Future<void> setProp(ControlPropType propType, String value) async {
    final allControlProps = state.whenOrNull(
        updating: (props) => props,
        updateSuccess: (props) => props,
        updateFailed: (props) => props);

    if (allControlProps == null) return;
    emit(PropsControlState.updating(allControlProps));

    final propIndex =
        allControlProps.indexWhere((prop) => prop.type == propType);
    if (propIndex == -1) return;

    allControlProps[propIndex] =
        allControlProps[propIndex].copyWith(currentValue: value);

    // setProp
    emit(PropsControlState.updateSuccess(allControlProps));
  }

  ControlProp getDummyPropByType(ControlPropType type) {
    switch (type) {
      case ControlPropType.iso:
        return const ControlProp(
            type: ControlPropType.iso,
            currentValue: '25600',
            allowedValues: [
              '320',
              '400',
              '500',
              '640',
              '800',
              '[850]',
              '1000',
              '1250',
              '1600',
              '2000',
              '2500',
              '3200',
              '4000',
              '5000',
              '6400',
              '8000',
              '10000',
              '12800',
              '16000',
              '20000',
              '25600',
              '32000',
              '40000',
              '51200',
              '64000',
              '80000',
              '1024z'
            ]);

      case ControlPropType.aperture:
        return const ControlProp(
          type: ControlPropType.aperture,
          currentValue: '2.8',
          allowedValues: [
            '2.8',
            '3.2',
            '3.5',
            '4.0',
            '4.5',
            '5.0',
            '5.6',
            '6.3',
            '6.7',
            '7.1',
            '8.0',
            '9.0',
            '9.5',
            '10',
            '11',
            '13',
            '14',
            '16',
            '18',
            '19',
            '20',
            '22'
          ],
        );

      case ControlPropType.shutterAngle:
        return const ControlProp(
          type: ControlPropType.shutterAngle,
          currentValue: '180.00',
          allowedValues: [
            '360.00',
            '300.00',
            '240.00',
            '180.00',
            '150.00',
            '120.00',
            '90.00',
            '75.00',
            '60.00',
            '45.00',
            '30.00',
            '22.50',
            '15.00',
            '11.25'
          ],
        );

      case ControlPropType.whiteBalance:
        return const ControlProp(
          type: ControlPropType.whiteBalance,
          currentValue: '5700',
          allowedValues: [
            '2000',
            '2100',
            '2200',
            '2300',
            '2400',
            '2500',
            '2600',
            '2700',
            '2800',
            '2900',
            '3000',
            '3100',
            '3200',
            '3300',
            '3400',
            '3500',
            '3600',
            '3700',
            '3800',
            '3900',
            '4000',
            '4100',
            '4200',
            '4300',
            '4400',
            '4500',
            '4600',
            '4700',
            '4800',
            '4900',
            '5000',
            '5100',
            '5200',
            '5300',
            '5400',
            '5500',
            '5600',
            '5700',
            '5800',
            '5900',
            '6000',
            '6100',
            '6200',
            '6300',
            '6400',
            '6500',
            '6600',
            '6700',
            '6800',
            '6900',
            '7000',
            '7100',
            '7200',
            '7300',
            '7400',
            '7500',
            '7600',
            '7700',
            '7800',
            '7900',
            '8000',
            '8100',
            '8200',
            '8300',
            '8400',
            '8500',
            '8600',
            '8700',
            '8800',
            '8900',
            '9000',
            '9100',
            '9200',
            '9300',
            '9400',
            '9500',
            '9600',
            '9700',
            '9800',
            '9900',
            '10000',
            '10100',
            '10200',
            '10300',
            '10400',
            '10500',
            '10600',
            '10700',
            '10800',
            '10900',
            '11000',
            '11100',
            '11200',
            '11300',
            '11400',
            '11500',
            '11600',
            '11700',
            '11800',
            '11900',
            '12000',
            '12100',
            '12200',
            '12300',
            '12400',
            '12500',
            '12600',
            '12700',
            '12800',
            '12900',
            '13000',
            '13100',
            '13200',
            '13300',
            '13400',
            '13500',
            '13600',
            '13700',
            '13800',
            '13900',
            '14000',
            '14100',
            '14200',
            '14300',
            '14400',
            '14500',
            '14600',
            '14700',
            '14800',
            '14900',
            '15000'
          ],
        );
    }
  }
}
