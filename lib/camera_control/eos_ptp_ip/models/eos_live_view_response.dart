import 'dart:typed_data';

import 'eos_autofocus_state.dart';

class EosLiveViewResponse {
  final Uint8List? imageBytes;
  final EosTouchAutofocusState? touchAutofocusState;

  EosLiveViewResponse(this.imageBytes, this.touchAutofocusState);
}
