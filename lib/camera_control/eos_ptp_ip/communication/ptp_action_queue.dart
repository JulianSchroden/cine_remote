import 'dart:async';
import 'dart:collection';
import 'dart:typed_data';

import 'package:logging/logging.dart';

import '../adapter/ptp_response_parser.dart';
import '../extensions/dump_bytes_extensions.dart';
import '../models/ptp_packet.dart';
import '../responses/ptp_operation_response.dart';
import '../responses/ptp_response.dart';
import '../responses/ptp_start_data_response.dart';
import 'ptp_action.dart';
import 'ptp_ip_client.dart';

class PtpActionQueue {
  final PtpIpClient _ptpIpClient;
  final PtpResponseParser _ptpResponseParser;

  final _actionQueue = Queue<_PtpActionExecution>();
  _PtpActionExecution? _currentExecution;
  int _transactionId = 0;
  final logger = Logger('PtpActionQueue');

  PtpActionQueue(this._ptpIpClient, this._ptpResponseParser) {
    _ptpIpClient.onCommandData.listen((data) async {
      logger.info('onData: length ${data.length}');
      logger.info(data.dumpAsHex());

      logger.info('currentExection isNull: ${_currentExecution == null}');
      if (_currentExecution == null) return;

      await _handleData(_currentExecution!, data);
    });
  }

  Future<PtpResponse> handle(PtpAction action) async {
    final completer = Completer<PtpResponse>();

    logger.info("Adding action to queue");
    _actionQueue.add(_PtpActionExecution(action, completer));

    await _startNextAction();

    return completer.future;
  }

  int get _nextTransactionId => _transactionId++;

  Future<void> _startNextAction() async {
    if (_currentExecution?.isActive ?? false) return;
    if (_actionQueue.isEmpty) return;

    logger.info('Start next Action');

    _currentExecution = _actionQueue.removeFirst();

    final ptpPacket =
        await _currentExecution!.ptpAction.buildPacket(_nextTransactionId);
    await _ptpIpClient.sendCommand(ptpPacket);
  }

  Future<void> _handleData(
    _PtpActionExecution currentExecution,
    Uint8List data,
  ) async {
    // TODO: data might receive buffered. We cannot rely on this method to be called for each package.

    logger.info(
        "handleData: isActive: ${currentExecution.isActive}, isInDataPhase ${currentExecution.isInDataPhase}");

    if (currentExecution.isInDataPhase) {
      logger.info("handleData: addingData with length ${data.length}");
      currentExecution.addData(data);
      return;
    }

    final response = _ptpResponseParser.read(PtpPacket(data));
    if (response == null) {
      logger.warning('Received unkown response');
      logger.warning(data.dumpAsHex());
      return;
    }

    if (response is PtpStartDataResponse) {
      logger.info("Start data phase with ${response.totalLength} bytes");
      currentExecution.startDataPhase(response.totalLength);
      return;
    }

    logger.info("Completing current execution");
    currentExecution.complete(response);
  }
}

class _PtpActionExecution {
  final PtpAction ptpAction;
  final Completer<PtpResponse> responseCompleter;
  _DataAccumulator? _dataAccumulator;

  _PtpActionExecution(this.ptpAction, this.responseCompleter);

  void startDataPhase(int totalLength) {
    _dataAccumulator = _DataAccumulator(totalLength);
  }

  void addData(Uint8List bytes) {
    _dataAccumulator?.add(bytes);
  }

  void complete(PtpResponse response) {
    if (response is PtpOperationResponse) {
      final responseWithData =
          response.copyWith(data: _dataAccumulator?.takeBytes());
      responseCompleter.complete(responseWithData);
      return;
    }

    responseCompleter.complete(response);
  }

  bool get isActive => !responseCompleter.isCompleted;

  bool get isInDataPhase {
    if (!isActive) return false;

    return _dataAccumulator?.dataPending ?? false;
  }
}

class _DataAccumulator {
  final int totalLength;
  final bytesBuilder = BytesBuilder();

  _DataAccumulator(this.totalLength);

  void add(Uint8List bytes) {
    bytesBuilder.add(bytes);
  }

  bool get dataPending => bytesBuilder.length != totalLength;

  Uint8List takeBytes() => bytesBuilder.takeBytes();
}
