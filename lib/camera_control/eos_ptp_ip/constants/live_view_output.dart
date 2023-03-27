enum LiveViewOutput {
  none,
  camera,
  host,
  cameraAndHost,
}

extension LiveViewOutputValueExtension on LiveViewOutput {
  int get value {
    switch (this) {
      case LiveViewOutput.none:
        return 0x0;
      case LiveViewOutput.camera:
        return 0x1;
      case LiveViewOutput.host:
        return 0x2;
      case LiveViewOutput.cameraAndHost:
        return 0x3;
    }
  }
}
