import '../communication/ptp_transaction_queue.dart';
import '../constants/properties/live_view_output.dart';
import '../constants/ptp_property.dart';
import '../extensions/to_byte_extensions.dart';
import 'action.dart';

class SetLiveViewOutputAction extends Action<void> {
  final LiveViewOutput liveViewOutput;

  SetLiveViewOutputAction(this.liveViewOutput);

  @override
  Future<void> run(PtpTransactionQueue transactionQueue) async {
    final setLiveViewOutput = operationFactory.createSetPropValue(
      PtpPropertyCode.liveViewOutput,
      liveViewOutput.value.asUint32Bytes(),
    );
    final response = await transactionQueue.handle(setLiveViewOutput);
    verifyOperationResponse(response, 'setLiveViewOutput($liveViewOutput)');
  }
}
