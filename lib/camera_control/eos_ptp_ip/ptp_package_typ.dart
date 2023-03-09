abstract class PtpPacketTyp {
  PtpPacketTyp._();

  static const initCommandRequest = 0x0001;
  static const initCommandAck = 0x0002;
  static const initEventRequest = 0x0003;
  static const initEventAck = 0x0004;
}
