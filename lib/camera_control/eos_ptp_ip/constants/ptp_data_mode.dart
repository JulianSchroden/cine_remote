enum PtpDataMode {
  noData,
  withData,
}

extension PtpDataModeValueExtension on PtpDataMode {
  int get value {
    switch (this) {
      case PtpDataMode.noData:
        return 0x01;
      case PtpDataMode.withData:
        return 0x02;
    }
  }
}
