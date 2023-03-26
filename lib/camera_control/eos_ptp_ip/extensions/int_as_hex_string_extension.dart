extension IntAsHexStringExtension on int {
  String asHex({int padLeft = 0}) {
    return '0x${toRadixString(16).padLeft(padLeft, '0')}';
  }
}
