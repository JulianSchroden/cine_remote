import 'package:equatable/equatable.dart';

import 'camera_control_protocol.dart';

class CameraModel extends Equatable {
  final String identifier;
  final String name;
  final CameraControlProtocol protocol;

  const CameraModel({
    required this.identifier,
    required this.name,
    required this.protocol,
  });

  @override
  List<Object?> get props => [identifier, name, protocol];

  @override
  String toString() {
    return 'CameraModel(identifier: $identifier, name: $name)';
  }
}
