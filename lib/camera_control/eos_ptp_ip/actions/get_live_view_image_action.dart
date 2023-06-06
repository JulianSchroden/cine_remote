import 'dart:typed_data';

import '../adapter/live_view_data_parser.dart';

import '../../interface/exceptions/camera_communication_exception.dart';
import '../communication/operations/ptp_operation_factory.dart';
import '../communication/ptp_transaction_queue.dart';
import '../responses/ptp_operation_response.dart';
import 'action.dart';

class GetLiveViewImageAction extends Action<Uint8List> {
  final LiveViewDataParser _liveViewDataParser;

  GetLiveViewImageAction([
    super.operationFactory = const PtpOperationFactory(),
    LiveViewDataParser? liveViewDataParser,
  ]) : _liveViewDataParser = liveViewDataParser ?? LiveViewDataParser();

  @override
  Future<Uint8List> run(PtpTransactionQueue transactionQueue) async {
    final getLiveViewImage = operationFactory.createGetLiveViewImage();
    final response = await transactionQueue.handle(getLiveViewImage);
    verifyOperationResponse(response, 'getLiveViewImage');

    final operationResponse = response as PtpOperationResponse;
    final responseBytes = operationResponse.data;

    // TODO:
    final imageBytes = _liveViewDataParser.extractImage(responseBytes);
    if (imageBytes == null) {
      throw const CameraCommunicationException(
        'Response did not include valid image',
      );
    }

    return imageBytes;
  }
}
