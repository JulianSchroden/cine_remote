import 'dart:async';
import 'dart:typed_data';

import '../models/ptp_packet.dart';
import '../responses/ptp_response.dart';
import 'ptp_response_parser.dart';

class PtpResponseStreamTransformer
    extends StreamTransformerBase<Uint8List, PtpResponse> {
  final PtpResponseParser _responseParser;

  const PtpResponseStreamTransformer([
    this._responseParser = const PtpResponseParser(),
  ]);

  @override
  Stream<PtpResponse> bind(Stream<Uint8List> stream) {
    return stream
        .map((data) => _responseParser.read(PtpPacket(data)))
        .where((response) => response != null)
        .cast<PtpResponse>();
  }
}
