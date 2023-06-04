import 'package:equatable/equatable.dart';

class EosAutofocusPostion extends Equatable {
  final int x;
  final int y;

  const EosAutofocusPostion({required this.x, required this.y});

  @override
  List<Object?> get props => [x, y];

  @override
  String toString() {
    return 'EosAutofocusPostion(x: $x, y: $y)';
  }
}
