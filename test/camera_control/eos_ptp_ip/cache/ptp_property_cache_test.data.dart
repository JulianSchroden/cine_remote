part of 'ptp_property_cache_test.dart';

const apertureValueChangedEvent = PropValueChanged(
  ControlPropType.aperture,
  PtpPropertyCode.aperture,
  EosPtpPropValue(
    '10',
    0x3d,
  ),
);

const apertureAllowedValues = [
  EosPtpPropValue('9.0', 0x3b),
  EosPtpPropValue('10.0', 0x3d),
  EosPtpPropValue('11.0', 0x40),
];

const apertureAllowedValuesChangedEvent = AllowedValuesChanged(
  ControlPropType.aperture,
  apertureAllowedValues,
);

const isoValueChangedEvent = PropValueChanged(
  ControlPropType.iso,
  PtpPropertyCode.iso,
  EosPtpPropValue(
    '100',
    0x48,
  ),
);

const isoAllowedValues = [
  EosPtpPropValue('100', 0x48),
  EosPtpPropValue('125', 0x4b),
  EosPtpPropValue('160', 0x4d),
  EosPtpPropValue('200', 0x50),
];

const isoAllowedValuesChangedEvent = AllowedValuesChanged(
  ControlPropType.iso,
  isoAllowedValues,
);
