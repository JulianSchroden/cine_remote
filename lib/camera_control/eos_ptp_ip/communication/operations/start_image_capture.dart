import '../../adapter/ptp_packet_builder.dart';
import '../../constants/capture_phase.dart';
import '../../constants/ptp_operation_code.dart';
import 'ptp_operation.dart';

class StartImageCapture extends PtpRequestOperation {
  final CapturePhase capturePhase;

  const StartImageCapture(this.capturePhase)
      : super(PtpOperationCode.startImageCapture);

  @override
  void preparePayload(PtpPacketBuilder builder) {
    builder.addUInt32(capturePhase.value);
    builder.addUInt32(0x0);
  }
}
