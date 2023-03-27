enum CaptureDestination {
  storage1,
  storage2,
  host,
  hostAndCamera,
}

extension CaptureDestinationValueExtension on CaptureDestination {
  int get value {
    switch (this) {
      case CaptureDestination.storage1:
        return 0x1;
      case CaptureDestination.storage2:
        return 0x2;
      case CaptureDestination.host:
        return 0x4;
      case CaptureDestination.hostAndCamera:
        return 0x6;
    }
  }
}
