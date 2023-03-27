import 'dart:typed_data';

import 'ptp_response.dart';

class PtpEndDataResponse extends PtpResponse {
  final int transactionId;
  final Uint8List data;

  const PtpEndDataResponse(this.transactionId, this.data);

  @override
  List<Object?> get props => [transactionId, data];
}
