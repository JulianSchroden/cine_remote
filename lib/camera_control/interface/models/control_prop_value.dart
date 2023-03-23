import 'package:equatable/equatable.dart';

class ControlPropValue extends Equatable {
  final String value;

  const ControlPropValue(this.value);

  @override
  String toString() => value;

  @override
  List<Object?> get props => [value];
}
