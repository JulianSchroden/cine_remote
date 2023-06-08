import '../ptp_property.dart';

enum TouchAutofocusStatus {
  tracking,
  focusFound,
  focusNotFound,
}

const List<EosEnumValue<TouchAutofocusStatus>> touchAutofocusValues = [
  EosEnumValue(0x30, TouchAutofocusStatus.tracking),
  EosEnumValue(0x31, TouchAutofocusStatus.focusFound),
  EosEnumValue(0x32, TouchAutofocusStatus.focusFound),
];

extension TouchAutofocusStatusToValueExtension on TouchAutofocusStatus {
  int get value => touchAutofocusValues
      .firstWhere((mappedValue) => this == mappedValue.enumEntry)
      .native;
}

TouchAutofocusStatus mapTouchAutofocusStatus(int value) => touchAutofocusValues
    .firstWhere((mappedValue) => value == mappedValue.native)
    .enumEntry;
