import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';

import '../adapter/ptp_response_parser.dart';
import '../models/ptp_packet.dart';
import '../responses/ptp_response.dart';
import 'ptp_action.dart';
import 'ptp_ip_client.dart';

class PtpActionQueue {
  final PtpIpClient _ptpIpClient;
  final PtpResponseParser _ptpResponseParser;

  final _actionQueue = Queue<_PtpActionExecution>();
  _PtpActionExecution? _currentExecution;
  int _transactionId = 0;

  PtpActionQueue(this._ptpIpClient, this._ptpResponseParser) {
    _ptpIpClient.onCommandData.listen((data) async {
      if (_currentExecution == null) return;

      await _handleData(_currentExecution!, data);
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

  Future<void> _handleData(
    _PtpActionExecution currentExecution,
    Uint8List data,
  ) async {
    final response = _ptpResponseParser.read(PtpPacket(data));
    if (response == null) return;

    currentExecution.responseCompleter.complete(response);

    await _startNextAction();
  }
}

class _PtpActionExecution {
  final PtpAction ptpAction;
  final Completer<PtpResponse> responseCompleter;
  bool isInDataPacketMode = false;

  _PtpActionExecution(this.ptpAction, this.responseCompleter);

  bool get isActive => !responseCompleter.isCompleted;
}
