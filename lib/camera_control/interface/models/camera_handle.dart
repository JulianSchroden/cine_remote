import 'package:equatable/equatable.dart';

class CameraHandle extends Equatable {
  final String name;

  const CameraHandle({required this.name});

  @override
  List<Object?> get props => [name];
}
