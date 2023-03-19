import 'dart:async';
import 'dart:collection';

import '../responses/ptp_response.dart';
import 'ptp_action.dart';
import 'ptp_ip_client.dart';

class PtpActionQueue {
  final PtpIpClient _ptpIpClient;
  final _actionQueue = Queue<_PtpActionExecution>();
  _PtpActionExecution? _currentExecution;
  int _transactionId = 0;

  PtpActionQueue(this._ptpIpClient) {
    _ptpIpClient.onCommandResponse.listen((response) async {
      if (_currentExecution == null) return;

      _currentExecution!.complete(response);
    });
  }

  Future<PtpResponse> handle(PtpAction action) async {
    final completer = Completer<PtpResponse>();

    _actionQueue.add(_PtpActionExecution(action, completer));

    await _startNextAction();

    return completer.future;
  }

  int get _nextTransactionId => _transactionId++;

  Future<void> _startNextAction() async {
    if (_currentExecution?.isActive ?? false) return;
    if (_actionQueue.isEmpty) return;

    _currentExecution = _actionQueue.removeFirst();

    final ptpPacket =
        await _currentExecution!.ptpAction.buildPacket(_nextTransactionId);
    await _ptpIpClient.sendCommand(ptpPacket);
  }
}

class _PtpActionExecution {
  final PtpAction ptpAction;
  final Completer<PtpResponse> responseCompleter;

  _PtpActionExecution(this.ptpAction, this.responseCompleter);

  void complete(PtpResponse response) {
    responseCompleter.complete(response);
  }

  bool get isActive => !responseCompleter.isCompleted;
}
