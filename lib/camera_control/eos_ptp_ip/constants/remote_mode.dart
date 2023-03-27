enum RemoteMode {
  disabled,
  enabled,
}

extension RemoteModeValueExtension on RemoteMode {
  int get value {
    switch (this) {
      case RemoteMode.disabled:
        return 0x0;
      case RemoteMode.enabled:
        return 0x1;
    }
  }
}
