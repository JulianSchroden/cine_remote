import '../../interface/models/control_prop_type.dart';

class MappedValue<NT, MT> {
  final NT native;
  final MT mapped;

  const MappedValue(this.native, this.mapped);
}

abstract class PtpPropertyType {
  PtpPropertyType._();

  static const aperture = MappedValue(
    0xd101,
    ControlPropType.aperture,
  );

  static const shutterSpeed = MappedValue(
    0xd102,
    ControlPropType.shutterAngle,
  );

  static const List<MappedValue<int, ControlPropType>> values = [
    aperture,
    shutterSpeed,
  ];

  static MappedValue<int, ControlPropType>? tryMap(int value) {}
}

MappedValue<int, String> mapValue(ControlPropType propType, int value) {
  List<MappedValue<int, String>> mappedValues = [];
  switch (propType) {
    case ControlPropType.iso:
      // TODO: Handle this case.
      break;
    case ControlPropType.aperture:
      mappedValues = PtpApertureValues;
      // TODO: Handle this case.
      break;
    case ControlPropType.shutterAngle:
      mappedValues = PtpShutterSpeedValues;
      // TODO: Handle this case.
      break;
    case ControlPropType.whiteBalance:
      // TODO: Handle this case.
      break;
  }

  return mappedValues.firstWhere((propValue) => propValue.native == value);
}

const List<MappedValue<int, String>> PtpApertureValues = [
  MappedValue(0x15, '1.8'),
  MappedValue(0x18, '2.0'),
  MappedValue(0x1b, '2.2'),
  MappedValue(0x1d, '2.5'),
  MappedValue(0x20, '2.8'),
  MappedValue(0x23, '3.2'),
  MappedValue(0x25, '3.5'),
  MappedValue(0x28, '4.0'),
  MappedValue(0x2b, '4.5'),
  MappedValue(0x2d, '5.0'),
  MappedValue(0x30, '5.6'),
  MappedValue(0x33, '6.3'),
  MappedValue(0x35, '7.1'),
  MappedValue(0x38, '8.0'),
  MappedValue(0x3b, '9.0'),
  MappedValue(0x3d, '10.0'),
  MappedValue(0x40, '11.0'),
  MappedValue(0x43, '13.0'),
  MappedValue(0x45, '14.0'),
  MappedValue(0x48, '16.0'),
  MappedValue(0x48, '16.0'),
];

const List<MappedValue<int, String>> PtpShutterSpeedValues = [
  MappedValue(0x10, '30'),
  MappedValue(0x13, '25'),
  MappedValue(0x15, '20'),
  MappedValue(0x18, '15'),
  MappedValue(0x1b, '13'),
  MappedValue(0x1d, '10'),
  MappedValue(0x20, '8'),
  MappedValue(0x23, '6'),
  MappedValue(0x25, '5'),
  MappedValue(0x28, '4'),
  MappedValue(0x2b, '3"2'),
  MappedValue(0x2d, '2"5'),
  MappedValue(0x30, '2'),
  MappedValue(0x33, '1"6'),
  MappedValue(0x35, '1"3'),
  MappedValue(0x38, '1'),
  MappedValue(0x3b, '0"8'),
  MappedValue(0x3d, '0"6'),
  MappedValue(0x40, '0"5'),
  MappedValue(0x43, '0"4'),
  MappedValue(0x45, '0"3'),
  MappedValue(0x48, '1/4'),
  MappedValue(0x4b, '1/5'),
  MappedValue(0x4d, '1/6'),
  MappedValue(0x50, '1/8'),
  MappedValue(0x53, '1/10'),
  MappedValue(0x55, '1/13'),
  MappedValue(0x58, '1/15'),
  MappedValue(0x5b, '1/20'),
  MappedValue(0x5d, '1/25'),
  MappedValue(0x60, '1/30'),
  MappedValue(0x63, '1/40'),
  MappedValue(0x65, '1/50'),
  MappedValue(0x68, '1/60'),
  MappedValue(0x6b, '1/80'),
  MappedValue(0x6d, '1/100'),
  MappedValue(0x70, '1/125'),
  MappedValue(0x73, '1/160'),
  MappedValue(0x75, '1/200'),
  MappedValue(0x78, '1/250'),
  MappedValue(0x7b, '1/320'),
  MappedValue(0x7d, '1/400'),
  MappedValue(0x80, '1/500'),
  MappedValue(0x83, '1/640'),
  MappedValue(0x85, '1/800'),
  MappedValue(0x88, '1/1000'),
  MappedValue(0x8b, '1/1250'),
  MappedValue(0x8d, '1/1600'),
  MappedValue(0x90, '1/2000'),
  MappedValue(0x93, '1/2500'),
  MappedValue(0x95, '1/3200'),
  MappedValue(0x98, '1/4000'),
  MappedValue(0x9b, '1/5000'),
  MappedValue(0x9d, '1/6400'),
  MappedValue(0xa0, '1/8000'),
];
