import 'properties/autofocus_position.dart';

class TouchAutofocusState {
  final AutofocusPosition position;

  TouchAutofocusState({
    required this.position,
  });

  @override
  String toString() {
    return "TouchAutofocusState(position: $position)";
  }
}
