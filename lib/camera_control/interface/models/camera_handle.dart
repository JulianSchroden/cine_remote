import 'package:equatable/equatable.dart';

import 'camera_model.dart';
import 'pairing_data.dart';

class CameraHandle extends Equatable {
  final String id;
  final CameraModel model;
  final PairingData pairingData;

  const CameraHandle({
    required this.id,
    required this.model,
    required this.pairingData,
  });

  @override
  List<Object?> get props => [model];
}
