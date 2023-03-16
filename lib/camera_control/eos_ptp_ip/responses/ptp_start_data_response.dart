import 'ptp_response.dart';

class PtpStartDataResponse extends PtpResponse {
  final int transactionId;
  final int totalLength;

  const PtpStartDataResponse(this.transactionId, this.totalLength);

  @override
  List<Object?> get props => [transactionId, totalLength];
}
