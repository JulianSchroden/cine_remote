import 'package:equatable/equatable.dart';

import '../models/camera_model.dart';
import '../models/pairing_data.dart';

class DiscoveryHandle extends Equatable {
  final String id;
  final CameraModel model;
  final PairingData? pairingData;

  const DiscoveryHandle({
    required this.id,
    required this.model,
    this.pairingData,
  });

  @override
  List<Object?> get props => [
        id,
        model,
        pairingData,
      ];

  @override
  String toString() {
    return 'DiscoveredCamera(model: $model)';
  }
}
