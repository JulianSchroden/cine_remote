import 'dart:async';

import '../../interface/exceptions/camera_communication_exception.dart';
import '../communication/operations/ptp_operation_factory.dart';
import '../communication/ptp_transaction_queue.dart';
import '../extensions/int_as_hex_string_extension.dart';
import '../logging/eos_ptp_ip_logger.dart';
import '../responses/ptp_operation_response.dart';
import '../responses/ptp_response.dart';

abstract class Action<T> {
  final PtpOperationFactory operationFactory;
  final EosPtpIpLogger logger = EosPtpIpLogger();

  Action([this.operationFactory = const PtpOperationFactory()]);

  Future<T> run(PtpTransactionQueue transactionQueue);

  PtpOperationResponse verifyOperationResponse(
      PtpResponse response, String operationName) {
    if (response is! PtpOperationResponse) {
      throw CameraCommunicationException(
          'Operation $operationName failed. Received invalid response.');
    }

    if (response.isNotOkay) {
      throw CameraCommunicationException(
          'Operation $operationName failed with responseCode ${response.responseCode.asHex()}.');
    }

    return response;
  }
}
