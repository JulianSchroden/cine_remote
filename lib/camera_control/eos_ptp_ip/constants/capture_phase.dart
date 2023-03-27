enum CapturePhase {
  focus,
  release,
}

extension CapturePhaseValueExtension on CapturePhase {
  int get value {
    switch (this) {
      case CapturePhase.focus:
        return 0x01;
      case CapturePhase.release:
        return 0x02;
    }
  }
}
