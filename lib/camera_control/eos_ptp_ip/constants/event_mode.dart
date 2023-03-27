enum EventMode {
  disabled,
  enabled,
}

extension EventModeValueExtension on EventMode {
  int get value {
    switch (this) {
      case EventMode.disabled:
        return 0x0;
      case EventMode.enabled:
        return 0x1;
    }
  }
}
