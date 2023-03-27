import 'dart:async';
import 'dart:collection';

import 'package:logger/logger.dart';

import '../responses/ptp_response.dart';
import 'operations/ptp_operation.dart';
import 'ptp_ip_client.dart';

class PtpTransactionQueue {
  final logger = Logger();

  final PtpIpClient _ptpIpClient;
  final _transactionQueue = Queue<_PtpTransaction>();
  _PtpTransaction? _currentTransaction;
  int _transactionId = 0;

  PtpTransactionQueue(this._ptpIpClient) {
    _ptpIpClient.onCommandResponse.listen((response) async {
      if (_currentTransaction == null) return;

      _currentTransaction!.complete(response);
    });
  }

  Future<void> close() async {
    await _ptpIpClient.disconnect();
  }

  Future<PtpResponse> handle(PtpOperation operation) async {
    final completer = Completer<PtpResponse>();

    _transactionQueue.add(_PtpTransaction(operation, completer));

    await _startNextTransaction();

    return completer.future;
  }

  Future<PtpResponse?> handleIfNotQueued(
    PtpOperation operation,
    bool Function(PtpOperation operation) isEquivalentOperation,
  ) async {
    final hasEquivalentOperationInQueue = _transactionQueue
        .any((transaction) => isEquivalentOperation(transaction.ptpOperation));

    if (hasEquivalentOperationInQueue) {
      logger.i(
          'Skipping operation since equivalent operation is already queued: $operation');
      await _startNextTransaction();
      return Future.value(null);
    }

    return handle(operation);
  }

  int get _nextTransactionId => _transactionId++;

  Future<void> _startNextTransaction() async {
    final hasPendingTransaction = _currentTransaction?.isActive ?? false;
    if (hasPendingTransaction) {
      logger.i(
          'Cannot start next transaction: Current transaction still pending');
      return;
    }
    if (_transactionQueue.isEmpty) {
      logger.i('Cannot start next transaction: TransactionQueue is empty');
      return;
    }

    _currentTransaction = _transactionQueue.removeFirst();

    final operation = _currentTransaction!.ptpOperation;
    final transactionId = _nextTransactionId;
    if (operation is PtpRequestOperation) {
      final requestPacket = operation.buildRequest(transactionId);
      await _ptpIpClient.sendCommand(requestPacket);

      if (operation is PtpDataOperation) {
        final dataPacket = operation.buildData();

        final dataStartPacket =
            operation.buildDataStart(transactionId, dataPacket.length);
        await _ptpIpClient.sendCommand(dataStartPacket);

        final dataEndPacket = operation.buildDataEnd(transactionId, dataPacket);
        await _ptpIpClient.sendCommand(dataEndPacket);
      }
    }
  }
}

class _PtpTransaction {
  final PtpOperation ptpOperation;
  final Completer<PtpResponse> responseCompleter;

  _PtpTransaction(this.ptpOperation, this.responseCompleter);

  void complete(PtpResponse response) {
    responseCompleter.complete(response);
  }

  bool get isActive => !responseCompleter.isCompleted;
}
