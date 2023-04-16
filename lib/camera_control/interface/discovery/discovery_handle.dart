import 'package:equatable/equatable.dart';

import '../models/camera_model.dart';
import '../models/pairing_data.dart';

class DiscoveryHandle<Pd extends PairingData> extends Equatable {
  final String id;
  final CameraModel model;
  final Pd? pairingData;

  const DiscoveryHandle({
    required this.id,
    required this.model,
    this.pairingData,
  });

  @override
  List<Object?> get props => [model];

  @override
  String toString() {
    return 'DiscoveredCamera(model: $model)';
  }
}
