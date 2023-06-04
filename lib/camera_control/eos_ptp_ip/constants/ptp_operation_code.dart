abstract class PtpOperationCode {
  const PtpOperationCode._();

  static const getDeviceInfo = 0x1001;
  static const openSession = 0x1002;
  static const closeSession = 0x1003;

  static const setPropValue = 0x9110;
  static const setRemoteMode = 0x9114;
  static const setEventMode = 0x9115;
  static const getEventData = 0x9116;

  static const startImageCapture = 0x9128;
  static const stopImageCapture = 0x9129;
  static const getLiveViewImage = 0x9153;
  static const setTouchAfPosition = 0x915b;
}
