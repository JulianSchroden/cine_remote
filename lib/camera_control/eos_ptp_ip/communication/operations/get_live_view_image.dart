import '../../adapter/ptp_packet_builder.dart';
import '../../constants/ptp_operation_code.dart';
import 'ptp_operation.dart';

class GetLiveViewImage extends PtpRequestOperation {
  const GetLiveViewImage() : super(PtpOperationCode.getLiveViewImage);

  @override
  void preparePayload(PtpPacketBuilder builder) {
    builder.addUInt32(0x00200000);
    builder.addUInt32(0x0);
    builder.addUInt32(0x0);
  }
}
