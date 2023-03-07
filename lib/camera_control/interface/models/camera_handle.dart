import 'package:equatable/equatable.dart';

import 'control_prop_type.dart';

class CameraHandle extends Equatable {
  final List<ControlPropType> supportedProps;

  const CameraHandle({required this.supportedProps});

  @override
  List<Object?> get props => [supportedProps];
}
