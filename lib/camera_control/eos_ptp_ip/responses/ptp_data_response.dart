import 'dart:typed_data';

import 'ptp_response.dart';

class PtpDataResponse extends PtpResponse {
  final int transactionId;
  final Uint8List data;

  const PtpDataResponse(this.transactionId, this.data);

  @override
  List<Object?> get props => [transactionId, data];
}
