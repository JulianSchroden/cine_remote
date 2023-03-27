import '../../adapter/ptp_packet_builder.dart';
import '../../constants/capture_phase.dart';
import '../../constants/ptp_operation_code.dart';
import 'ptp_operation.dart';

class StopImageCapture extends PtpRequestOperation {
  final CapturePhase capturePhase;

  const StopImageCapture(this.capturePhase)
      : super(PtpOperationCode.stopImageCapture);

  @override
  void preparePayload(PtpPacketBuilder builder) {
    builder.addUInt32(capturePhase.value);
  }
}
