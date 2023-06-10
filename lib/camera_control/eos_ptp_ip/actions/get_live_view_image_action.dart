import '../../interface/exceptions/camera_communication_exception.dart';
import '../../interface/models/live_view_data.dart';
import '../../interface/models/properties/autofocus_position.dart';
import '../../interface/models/touch_autofocus_state.dart';
import '../adapter/eos_live_view_data_parser.dart';
import '../communication/ptp_transaction_queue.dart';
import '../models/eos_autofocus_state.dart';
import '../models/eos_live_view_response.dart';
import '../models/eos_sensor_info.dart';
import 'action.dart';

class GetLiveViewImageAction extends Action<LiveViewData> {
  GetLiveViewImageAction();

  @override
  Future<LiveViewData> run(PtpTransactionQueue transactionQueue) async {
    final getLiveViewImage = operationFactory.createGetLiveViewImage();
    final response = await transactionQueue.handle(getLiveViewImage);
    final operationResponse =
        verifyOperationResponse(response, 'getLiveViewImage');

    final responseBytes = operationResponse.data;

    final liveViewDataParser = EosLiveViewDataParser();
    final EosLiveViewResponse(:imageBytes, :touchAutofocusState, :sensorInfo) =
        liveViewDataParser.parseData(responseBytes);

    if (imageBytes == null) {
      throw const CameraCommunicationException(
        'Response did not include valid image',
      );
    }

    final autofocusState = mapAutofocusState(touchAutofocusState, sensorInfo);

    return LiveViewData(
      imageBytes: imageBytes,
      autofocusState: autofocusState,
    );
  }

  TouchAutofocusState? mapAutofocusState(
    EosTouchAutofocusState? autofocusState,
    EosSensorInfo? sensorInfo,
  ) {
    if (autofocusState == null || sensorInfo == null) {
      return null;
    }

    final centerX = autofocusState.x + (sensorInfo.width / 2);
    final centerY = autofocusState.y + (sensorInfo.height / 2);

    return TouchAutofocusState(
      position: AutofocusPosition(
        x: centerX / sensorInfo.width,
        y: centerY / sensorInfo.height,
      ),
    );
  }
}
