import '../../adapter/ptp_packet_builder.dart';
import '../../constants/ptp_data_mode.dart';
import '../../constants/ptp_package_type.dart';
import '../../extensions/int_as_hex_string_extension.dart';
import '../../models/ptp_packet.dart';

abstract class PtpOperation {
  const PtpOperation();
}

abstract class PtpRequestOperation extends PtpOperation {
  final int operationCode;
  final PtpDataMode dataMode;

  const PtpRequestOperation(
    this.operationCode, [
    this.dataMode = PtpDataMode.noData,
  ]);

  PtpPacket buildRequest(int transactionId) {
    final builder = PtpPacketBuilder();
    builder.addUInt32(PtpPacketType.operationRequest);
    builder.addUInt32(dataMode.value);
    builder.addUInt16(operationCode);
    builder.addUInt32(transactionId);

    preparePayload(builder);

    return builder.build();
  }

  void preparePayload(PtpPacketBuilder builder) {}

  @override
  String toString() {
    return 'PtpRequestOperation: {operationCode: ${operationCode.asHex()}}';
  }
}

abstract class PtpDataOperation extends PtpRequestOperation {
  const PtpDataOperation(int operationCode)
      : super(operationCode, PtpDataMode.withData);

  PtpPacket buildDataStart(int transactionId, int totalBytes) {
    final builder = PtpPacketBuilder();
    builder.addUInt32(PtpPacketType.startDataPacket);
    builder.addUInt32(transactionId);
    builder.addUInt64(BigInt.from(totalBytes));
    return builder.build();
  }

  PtpPacket buildData();

  PtpPacket buildDataEnd(int transactionId, PtpPacket dataPacket) {
    final builder = PtpPacketBuilder();
    builder.addUInt32(PtpPacketType.endDataPacket);
    builder.addUInt32(transactionId);
    builder.add(dataPacket.data);

    return builder.build();
  }

  @override
  String toString() {
    return 'PtpDataOperation: {operationCode: ${operationCode.asHex()}}';
  }
}
