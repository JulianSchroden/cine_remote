import 'package:equatable/equatable.dart';

abstract class ControlPropValue extends Equatable {
  const ControlPropValue();

  String get value;

  @override
  String toString() => value;
}
