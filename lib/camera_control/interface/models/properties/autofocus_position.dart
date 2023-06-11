import 'package:equatable/equatable.dart';

// Autofocus position represented by [x] and [y] coordinates normalized to range [0, 1].
class AutofocusPosition extends Equatable {
  final double x;
  final double y;

  const AutofocusPosition({required this.x, required this.y});

  @override
  List<Object?> get props => [x, y];

  @override
  String toString() {
    return "AutofocusPosition(x: $x, y: $y)";
  }
}
