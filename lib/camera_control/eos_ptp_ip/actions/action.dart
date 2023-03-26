import 'dart:async';

import 'package:logging/logging.dart';

import '../communication/operations/ptp_operation_factory.dart';
import '../communication/ptp_transaction_queue.dart';

abstract class Action<T> {
  final PtpOperationFactory operationFactory;
  final Logger logger = Logger('PtpAction');

  Action([this.operationFactory = const PtpOperationFactory()]);

  Future<T> run(PtpTransactionQueue transactionQueue);
}
