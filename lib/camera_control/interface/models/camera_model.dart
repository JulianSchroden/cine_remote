import 'package:equatable/equatable.dart';

class CameraModel extends Equatable {
  final String identifier;
  final String name;

  const CameraModel({
    required this.identifier,
    required this.name,
  });

  @override
  List<Object?> get props => [identifier, name];

  @override
  String toString() {
    return 'CameraModel(identifier: $identifier, name: $name)';
  }
}
