import '../constants/properties/touch_autofocus_status.dart';

class EosTouchAutofocusState {
  final TouchAutofocusStatus touchAutofocusStatus;
  final int x;
  final int y;
  final int width;
  final int height;

  EosTouchAutofocusState(
    this.touchAutofocusStatus,
    this.x,
    this.y,
    this.width,
    this.height,
  );

  @override
  String toString() {
    return "EosTouchAutofocusState(status: $touchAutofocusStatus, x: $x, y: $y, width: $width, height: $height)";
  }
}
