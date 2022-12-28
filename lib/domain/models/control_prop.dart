import 'package:cine_remote/domain/models/control_prop_type.dart';

class ControlProp {
  final ControlPropType type;
  final String currentValue;
  final List<String> allowedValues;

  const ControlProp({
    required this.type,
    required this.currentValue,
    required this.allowedValues,
  });
}
