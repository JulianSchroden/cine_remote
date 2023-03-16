import 'dart:async';

import 'package:logging/logging.dart';

import '../adapter/ptp_packet_builder.dart';
import '../constants/ptp_data_phase.dart';
import '../constants/ptp_package_typ.dart';
import '../models/ptp_packet.dart';
import '../responses/ptp_response.dart';
import 'ptp_action_queue.dart';

abstract class PtpAction<T> {
  final int operationCode;
  final Logger logger = Logger('PtpAction');

  PtpAction({
    required this.operationCode,
  });

  Future<T> run(PtpActionQueue actionQueue) async {
    final response = await actionQueue.handle(this);

    return mapResponse(response);
  }

  Future<PtpPacket> buildPacket(int transactionId) async {
    final builder = PtpPacketBuilder();
    builder.addUInt32(PtpPacketTyp.operationRequest);
    builder.addUInt32(PtpDataPhase.request);
    builder.addUInt16(operationCode);
    builder.addUInt32(transactionId);

    await preparePayload(builder);

    return builder.build();
  }

  FutureOr<void> preparePayload(PtpPacketBuilder builder) {}

  FutureOr<T> mapResponse(PtpResponse response);
}
