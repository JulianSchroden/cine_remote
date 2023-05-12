class CameraCommunicationException implements Exception {
  final String message;

  const CameraCommunicationException(this.message);

  @override
  String toString() {
    return 'CameraCommunicationException: $message';
  }
}

class CameraCommunicationAbortedException extends CameraCommunicationException {
  const CameraCommunicationAbortedException(super.message);

  @override
  String toString() {
    return 'CameraCommunicationAbortedException: $message';
  }
}
