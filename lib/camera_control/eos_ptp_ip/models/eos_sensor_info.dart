import 'package:equatable/equatable.dart';

class EosSensorInfo extends Equatable {
  final int width;
  final int height;

  const EosSensorInfo({required this.width, required this.height});

  @override
  List<Object?> get props => [width, height];
}
