import 'dart:async';

import 'package:logging/logging.dart';

import '../adapter/ptp_packet_builder.dart';
import '../constants/ptp_data_phase.dart';
import '../constants/ptp_package_typ.dart';
import '../extensions/stream_extensions.dart';
import '../responses/ptp_operation_response.dart';
import 'ptp_ip_client.dart';

abstract class PtpAction<T> {
  final PtpIpClient client;
  final int operationCode;
  final int transactionId;
  final Logger logger = Logger('PtpAction');

  PtpAction({
    required this.client,
    required this.operationCode,
    required this.transactionId,
  });

  Future<T> call() async {
    final builder = PtpPacketBuilder();
    builder.addUInt32(PtpPacketTyp.operationRequest);
    builder.addUInt32(PtpDataPhase.request);
    builder.addUInt16(operationCode);
    builder.addUInt32(transactionId);
    await preparePayload(builder);

    await client.sendCommand(builder.build());
    final response = await client.onCommandResponse
        .firstWhereType<PtpOperationResponse>(
            (reponse) => reponse.transactionId == transactionId)
        .timeout(const Duration(seconds: 10));

    return mapResponse(response);
  }

  FutureOr<void> preparePayload(PtpPacketBuilder builder);

  FutureOr<T> mapResponse(PtpOperationResponse response);
}
