import 'dart:async';
import 'dart:collection';

import '../responses/ptp_response.dart';
import 'operations/ptp_operation.dart';
import 'ptp_ip_client.dart';

class PtpTransactionQueue {
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

  Future<PtpResponse> handle(PtpOperation operation) async {
    final completer = Completer<PtpResponse>();

    _transactionQueue.add(_PtpTransaction(operation, completer));

    await _startNextTransaction();

    return completer.future;
  }

  int get _nextTransactionId => _transactionId++;

  Future<void> _startNextTransaction() async {
    if (_currentTransaction?.isActive ?? false) return;
    if (_transactionQueue.isEmpty) return;

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
