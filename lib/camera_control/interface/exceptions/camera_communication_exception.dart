class CameraCommunicationException implements Exception {
  final String message;

  const CameraCommunicationException(this.message);

  @override
  String toString() {
    return 'CameraCommunicationException: $message';
  }
}
