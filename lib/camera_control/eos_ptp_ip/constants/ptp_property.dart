import '../../../shared/extensions/list_extensions.dart';
import '../../interface/models/control_prop_type.dart';
import '../extensions/int_as_hex_string_extension.dart';
import '../models/eos_ptp_int_prop_value.dart';
import 'properties/live_view_output.dart';

abstract class EosValue {
  int get native;
  String get common;

  const EosValue();
}

class EosNumberValue extends EosValue {
  @override
  final int native;

  @override
  final String common;

  const EosNumberValue(this.native, this.common);
}

class EosEnumValue<E extends Enum> extends EosValue {
  final E enumEntry;

  @override
  final int native;

  @override
  String get common => enumEntry.name;

  const EosEnumValue(this.native, this.enumEntry);
}

abstract class PtpPropertyCode {
  const PtpPropertyCode._();

  static const int aperture = 0xd101;
  static const int shutterSpeed = 0xd102;
  static const int iso = 0xd103;
  static const int whiteBalance = 0xd10a;

  static const int captureDestination = 0xd11c;
  static const int liveViewOutput = 0xd1b0;

  static const int liveViewSensorResolution = 0x91530e;
}

const Map<int, ControlPropType> eosPropCodeToPropTypeMap = {
  PtpPropertyCode.aperture: ControlPropType.aperture,
  PtpPropertyCode.shutterSpeed: ControlPropType.shutterSpeed,
  PtpPropertyCode.iso: ControlPropType.iso,
  PtpPropertyCode.whiteBalance: ControlPropType.whiteBalance,
};

ControlPropType? mapPropCodeToType(int propertyCode) {
  return eosPropCodeToPropTypeMap.entries
      .firstWhereOrNull((entry) => entry.key == propertyCode)
      ?.value;
}

int? mapPropTypeToCode(ControlPropType propType) {
  return eosPropCodeToPropTypeMap.entries
      .firstWhereOrNull((entry) => entry.value == propType)
      ?.key;
}

EosPtpIntPropValue mapPtpValue(int propCode, int value) {
  if (propCode == PtpPropertyCode.whiteBalance) {
    return EosPtpIntPropValue('$value', value);
  }

  final knownPropValues = knownPropValuesMap[propCode];
  final fallbackValue = value.asHex(padLeft: 2);
  final mappedValue = knownPropValues
          ?.firstWhereOrNull((propValue) => propValue.native == value)
          ?.common ??
      fallbackValue;

  return EosPtpIntPropValue(mappedValue, value);
}

const Map<int, List<EosValue>> knownPropValuesMap = {
  PtpPropertyCode.aperture: ptpApertureValues,
  PtpPropertyCode.shutterSpeed: ptpShutterSpeedValues,
  PtpPropertyCode.iso: ptpIsoValues,
  PtpPropertyCode.liveViewOutput: liveViewOutputValues,
};

const List<EosValue> ptpApertureValues = [
  EosNumberValue(0x15, '1.8'),
  EosNumberValue(0x18, '2.0'),
  EosNumberValue(0x1b, '2.2'),
  EosNumberValue(0x1d, '2.5'),
  EosNumberValue(0x20, '2.8'),
  EosNumberValue(0x23, '3.2'),
  EosNumberValue(0x25, '3.5'),
  EosNumberValue(0x28, '4.0'),
  EosNumberValue(0x2b, '4.5'),
  EosNumberValue(0x2d, '5.0'),
  EosNumberValue(0x30, '5.6'),
  EosNumberValue(0x33, '6.3'),
  EosNumberValue(0x35, '7.1'),
  EosNumberValue(0x38, '8.0'),
  EosNumberValue(0x3b, '9.0'),
  EosNumberValue(0x3d, '10.0'),
  EosNumberValue(0x40, '11.0'),
  EosNumberValue(0x43, '13.0'),
  EosNumberValue(0x45, '14.0'),
  EosNumberValue(0x48, '16.0'),
  EosNumberValue(0x48, '16.0'),
];

const List<EosValue> ptpShutterSpeedValues = [
  EosNumberValue(0x10, '30'),
  EosNumberValue(0x13, '25'),
  EosNumberValue(0x15, '20'),
  EosNumberValue(0x18, '15'),
  EosNumberValue(0x1b, '13'),
  EosNumberValue(0x1d, '10'),
  EosNumberValue(0x20, '8'),
  EosNumberValue(0x23, '6'),
  EosNumberValue(0x25, '5'),
  EosNumberValue(0x28, '4'),
  EosNumberValue(0x2b, '3"2'),
  EosNumberValue(0x2d, '2"5'),
  EosNumberValue(0x30, '2'),
  EosNumberValue(0x33, '1"6'),
  EosNumberValue(0x35, '1"3'),
  EosNumberValue(0x38, '1'),
  EosNumberValue(0x3b, '0"8'),
  EosNumberValue(0x3d, '0"6'),
  EosNumberValue(0x40, '0"5'),
  EosNumberValue(0x43, '0"4'),
  EosNumberValue(0x45, '0"3'),
  EosNumberValue(0x48, '1/4'),
  EosNumberValue(0x4b, '1/5'),
  EosNumberValue(0x4d, '1/6'),
  EosNumberValue(0x50, '1/8'),
  EosNumberValue(0x53, '1/10'),
  EosNumberValue(0x55, '1/13'),
  EosNumberValue(0x58, '1/15'),
  EosNumberValue(0x5b, '1/20'),
  EosNumberValue(0x5d, '1/25'),
  EosNumberValue(0x60, '1/30'),
  EosNumberValue(0x63, '1/40'),
  EosNumberValue(0x65, '1/50'),
  EosNumberValue(0x68, '1/60'),
  EosNumberValue(0x6b, '1/80'),
  EosNumberValue(0x6d, '1/100'),
  EosNumberValue(0x70, '1/125'),
  EosNumberValue(0x73, '1/160'),
  EosNumberValue(0x75, '1/200'),
  EosNumberValue(0x78, '1/250'),
  EosNumberValue(0x7b, '1/320'),
  EosNumberValue(0x7d, '1/400'),
  EosNumberValue(0x80, '1/500'),
  EosNumberValue(0x83, '1/640'),
  EosNumberValue(0x85, '1/800'),
  EosNumberValue(0x88, '1/1000'),
  EosNumberValue(0x8b, '1/1250'),
  EosNumberValue(0x8d, '1/1600'),
  EosNumberValue(0x90, '1/2000'),
  EosNumberValue(0x93, '1/2500'),
  EosNumberValue(0x95, '1/3200'),
  EosNumberValue(0x98, '1/4000'),
  EosNumberValue(0x9b, '1/5000'),
  EosNumberValue(0x9d, '1/6400'),
  EosNumberValue(0xa0, '1/8000'),
];

const List<EosValue> ptpIsoValues = [
  EosNumberValue(0x00, 'Auto'),
  EosNumberValue(0x48, '100'),
  EosNumberValue(0x4b, '125'),
  EosNumberValue(0x4d, '160'),
  EosNumberValue(0x50, '200'),
  EosNumberValue(0x53, '250'),
  EosNumberValue(0x55, '320'),
  EosNumberValue(0x58, '400'),
  EosNumberValue(0x5b, '500'),
  EosNumberValue(0x5d, '640'),
  EosNumberValue(0x60, '800'),
  EosNumberValue(0x63, '1000'),
  EosNumberValue(0x65, '1250'),
  EosNumberValue(0x68, '1600'),
  EosNumberValue(0x6b, '2000'),
  EosNumberValue(0x6d, '2500'),
  EosNumberValue(0x70, '3200'),
  EosNumberValue(0x73, '4000'),
  EosNumberValue(0x75, '5000'),
  EosNumberValue(0x78, '6400'),
  EosNumberValue(0x7b, '8000'),
  EosNumberValue(0x7d, '10000'),
  EosNumberValue(0x80, '12800'),
];
