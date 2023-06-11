part of 'ptp_property_cache_test.dart';

const apertureValueChangedEvent = PropValueChanged(
  ControlPropType.aperture,
  PtpPropertyCode.aperture,
  EosPtpIntPropValue(
    '10',
    0x3d,
  ),
);

const apertureAllowedValues = [
  EosPtpIntPropValue('9.0', 0x3b),
  EosPtpIntPropValue('10.0', 0x3d),
  EosPtpIntPropValue('11.0', 0x40),
];

const apertureAllowedValuesChangedEvent = AllowedValuesChanged(
  ControlPropType.aperture,
  apertureAllowedValues,
);

const isoValueChangedEvent = PropValueChanged(
  ControlPropType.iso,
  PtpPropertyCode.iso,
  EosPtpIntPropValue(
    '100',
    0x48,
  ),
);

const isoAllowedValues = [
  EosPtpIntPropValue('100', 0x48),
  EosPtpIntPropValue('125', 0x4b),
  EosPtpIntPropValue('160', 0x4d),
  EosPtpIntPropValue('200', 0x50),
];

const isoAllowedValuesChangedEvent = AllowedValuesChanged(
  ControlPropType.iso,
  isoAllowedValues,
);
