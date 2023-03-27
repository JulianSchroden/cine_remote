import 'dart:async';

import 'package:logging/logging.dart';

import '../communication/operations/ptp_operation_factory.dart';
import '../communication/ptp_transaction_queue.dart';
import '../responses/ptp_operation_response.dart';
import '../responses/ptp_response.dart';
import 'init_session_action.dart';

abstract class Action<T> {
  final PtpOperationFactory operationFactory;
  final Logger logger = Logger('PtpAction');

  Action([this.operationFactory = const PtpOperationFactory()]);

  Future<T> run(PtpTransactionQueue transactionQueue);

  void verifyOperationResponse(PtpResponse response, String operatioName) {
    if (response is! PtpOperationResponse) {
      throw InitFailedException(
          'Operation $operatioName failed. Received invalid response.');
    }

    if (response.isNotOkay) {
      throw InitFailedException(
          'Operation $operatioName failed with responseCode ${response.responseCode}.');
    }
  }
}
