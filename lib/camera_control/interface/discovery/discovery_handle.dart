import 'package:equatable/equatable.dart';

import '../models/camera_model.dart';

class DiscoveryHandle extends Equatable {
  final CameraModel model;

  const DiscoveryHandle(this.model);

  @override
  List<Object?> get props => [model];

  @override
  String toString() {
    return 'DiscoveredCamera(model: $model)';
  }
}
