import 'dart:typed_data';

import '../constants/ptp_response_code.dart';
import 'ptp_response.dart';

class PtpOperationResponse extends PtpResponse {
  final int responseCode;
  final int transactionId;
  final Uint8List data;

  const PtpOperationResponse(this.responseCode, this.transactionId, this.data);

  @override
  List<Object?> get props => [responseCode, transactionId];

  bool get isOkay => responseCode == PtpResponseCode.okay;
  bool get isNotOkay => !isOkay;

  PtpOperationResponse copyWith({
    int? responseCode,
    int? transactionId,
    Uint8List? data,
  }) {
    return PtpOperationResponse(
      responseCode ?? this.responseCode,
      transactionId ?? this.transactionId,
      data ?? this.data,
    );
  }
}
