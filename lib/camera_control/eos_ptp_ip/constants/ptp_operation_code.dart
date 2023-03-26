abstract class PtpOperationCode {
  const PtpOperationCode._();

  static const openSession = 0x1002;

  static const setPropValue = 0x9110;
  static const setRemoteMode = 0x9114;
  static const setEventMode = 0x9115;
  static const getEventData = 0x9116;
}
