import 'dart:typed_data';

import 'touch_autofocus_state.dart';

class LiveViewData {
  final Uint8List imageBytes;
  final TouchAutofocusState? autofocusState;

  LiveViewData({
    required this.imageBytes,
    this.autofocusState,
  });
}
