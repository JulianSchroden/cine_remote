abstract class PtpPacketTyp {
  PtpPacketTyp._();

  static const initCommandRequest = 0x0001;
  static const initCommandAck = 0x0002;
  static const initEventRequest = 0x0003;
  static const initEventAck = 0x0004;
  static const operationRequest = 0x0006;
  static const operationResponse = 0x0007;
  static const startDataPacket = 0x0009;
  static const dataPacket = 0x000a;
  static const endDataPacket = 0x000c;
}
