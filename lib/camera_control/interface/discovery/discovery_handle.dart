import 'package:equatable/equatable.dart';

import '../models/camera_model.dart';

class DiscoveryHandle extends Equatable {
  final String id;
  final CameraModel model;

  const DiscoveryHandle({
    required this.id,
    required this.model,
  });

  @override
  List<Object?> get props => [model];

  @override
  String toString() {
    return 'DiscoveredCamera(model: $model)';
  }
}
