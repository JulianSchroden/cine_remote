import '../ptp_property.dart';

enum LiveViewOutput {
  none,
  camera,
  host,
  cameraAndHost,
}

const List<EosEnumValue> liveViewOutputValues = [
  EosEnumValue(0x0, LiveViewOutput.none),
  EosEnumValue(0x1, LiveViewOutput.camera),
  EosEnumValue(0x2, LiveViewOutput.host),
  EosEnumValue(0x3, LiveViewOutput.cameraAndHost),
];

extension LiveViewOutoutToValueExtension on LiveViewOutput {
  int get value => liveViewOutputValues
      .firstWhere((mappedValue) => this == mappedValue.enumEntry)
      .native;
}
