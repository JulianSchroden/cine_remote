import 'dart:typed_data';

import '../../interface/exceptions/camera_communication_exception.dart';
import '../adapter/jpeg_image_extractor.dart';
import '../communication/operations/ptp_operation_factory.dart';
import '../communication/ptp_transaction_queue.dart';
import '../responses/ptp_operation_response.dart';
import 'action.dart';

class GetLiveViewImageAction extends Action<Uint8List> {
  final JpegImageExtractor imageExtractor;

  GetLiveViewImageAction([
    super.operationFactory = const PtpOperationFactory(),
    this.imageExtractor = const JpegImageExtractor(),
  ]);

  @override
  Future<Uint8List> run(PtpTransactionQueue transactionQueue) async {
    final getLiveViewImage = operationFactory.createGetLiveViewImage();
    final response = await transactionQueue.handle(getLiveViewImage);
    verifyOperationResponse(response, 'getLiveViewImage');

    final operationResponse = response as PtpOperationResponse;
    final responseBytes = operationResponse.data;

    final imageBytes = imageExtractor.extractFromBytes(responseBytes);
    if (imageBytes == null) {
      throw const CameraCommunicationException(
        'Response did not include valid image',
      );
    }

    return imageBytes;
  }
}
