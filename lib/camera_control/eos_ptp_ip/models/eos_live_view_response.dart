import 'dart:typed_data';

import 'eos_autofocus_state.dart';
import 'eos_sensor_info.dart';

class EosLiveViewResponse {
  final Uint8List? imageBytes;
  final EosTouchAutofocusState? touchAutofocusState;
  final EosSensorInfo? sensorInfo;

  EosLiveViewResponse(
    this.imageBytes,
    this.touchAutofocusState,
    this.sensorInfo,
  );
}
