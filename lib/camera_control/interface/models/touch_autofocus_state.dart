import 'properties/autofocus_position.dart';

class TouchAutofocusState {
  final AutofocusPosition position;
  final double width;
  final double height;

  TouchAutofocusState({
    required this.position,
    required this.width,
    required this.height,
  });

  @override
  String toString() {
    return "TouchAutofocusState(position: $position, width: $width, height: $height)";
  }
}
