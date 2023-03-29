extension IntAsHexStringExtension on int {
  String asHex({bool withPrefix = true, int padLeft = 0}) {
    final prefix = withPrefix ? '0x' : '';

    return '$prefix${toRadixString(16).padLeft(padLeft, '0')}';
  }
}
