import 'package:equatable/equatable.dart';

import 'camera_model.dart';

class CameraHandle extends Equatable {
  final CameraModel model;

  const CameraHandle({required this.model});

  @override
  List<Object?> get props => [model];
}
