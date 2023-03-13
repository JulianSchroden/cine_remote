import '../constants/ptp_response_code.dart';
import 'ptp_response.dart';

class PtpOperationResponse extends PtpResponse {
  final int responseCode;
  final int transactionId;

  const PtpOperationResponse(this.responseCode, this.transactionId);

  @override
  List<Object?> get props => [responseCode, transactionId];

  bool get isOkay => responseCode == PtpResponseCode.okay;
}
