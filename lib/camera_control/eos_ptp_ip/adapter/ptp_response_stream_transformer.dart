import 'dart:async';
import 'dart:typed_data';

import '../models/ptp_packet.dart';
import '../responses/ptp_response.dart';
import 'ptp_response_parser.dart';

class PtpResponseStreamTransformer
    extends StreamTransformerBase<Uint8List, PtpResponse> {
  final PtpResponseParser responseParser;

  PtpResponseStreamTransformer(this.responseParser);

  @override
  Stream<PtpResponse> bind(Stream<Uint8List> stream) {
    return stream
        .map((data) => responseParser.read(PtpPacket(data)))
        .where((response) => response != null)
        .cast<PtpResponse>();
  }
}
