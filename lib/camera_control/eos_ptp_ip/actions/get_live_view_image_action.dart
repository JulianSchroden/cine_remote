import '../../interface/exceptions/camera_communication_exception.dart';
import '../../interface/models/live_view_data.dart';
import '../../interface/models/properties/autofocus_position.dart';
import '../../interface/models/touch_autofocus_state.dart';
import '../adapter/eos_live_view_data_parser.dart';
import '../communication/ptp_transaction_queue.dart';
import '../models/eos_autofocus_state.dart';
import '../models/eos_live_view_response.dart';
import '../models/eos_sensor_info.dart';
import '../responses/ptp_operation_response.dart';
import 'action.dart';

class GetLiveViewImageAction extends Action<LiveViewData> {
  final EosSensorInfo sensorInfo;

  GetLiveViewImageAction(this.sensorInfo);

  @override
  Future<LiveViewData> run(PtpTransactionQueue transactionQueue) async {
    final getLiveViewImage = operationFactory.createGetLiveViewImage();
    final response = await transactionQueue.handle(getLiveViewImage);
    verifyOperationResponse(response, 'getLiveViewImage');

    final operationResponse = response as PtpOperationResponse;
    final responseBytes = operationResponse.data;

    final liveViewDataParser = EosLiveViewDataParser();
    final EosLiveViewResponse(:imageBytes, :touchAutofocusState) =
        liveViewDataParser.parseData(responseBytes);

    if (imageBytes == null) {
      throw const CameraCommunicationException(
        'Response did not include valid image',
      );
    }

    return LiveViewData(
      imageBytes: imageBytes,
      autofocusState: touchAutofocusState?.toCommon(sensorInfo),
    );
  }
}

extension EosTouchAutofocusStateToCommon on EosTouchAutofocusState {
  TouchAutofocusState toCommon(EosSensorInfo sensorInfo) {
    final centerX = x + (width / 2);
    final centerY = y + (height / 2);

    return TouchAutofocusState(
      position: AutofocusPosition(
        x: centerX / sensorInfo.width,
        y: centerY / sensorInfo.height,
      ),
    );
  }
}
