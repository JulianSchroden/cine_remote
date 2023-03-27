import 'dart:async';

import 'package:logging/logging.dart';

import '../../interface/exceptions/camera_communication_exception.dart';
import '../communication/operations/ptp_operation_factory.dart';
import '../communication/ptp_transaction_queue.dart';
import '../responses/ptp_operation_response.dart';
import '../responses/ptp_response.dart';

abstract class Action<T> {
  final PtpOperationFactory operationFactory;
  final Logger logger = Logger('PtpAction');

  Action([this.operationFactory = const PtpOperationFactory()]);

  Future<T> run(PtpTransactionQueue transactionQueue);

  void verifyOperationResponse(PtpResponse response, String operationName) {
    if (response is! PtpOperationResponse) {
      throw CameraCommunicationException(
          'Operation $operationName failed. Received invalid response.');
    }

    if (response.isNotOkay) {
      throw CameraCommunicationException(
          'Operation $operationName failed with responseCode ${response.responseCode}.');
    }
  }
}
