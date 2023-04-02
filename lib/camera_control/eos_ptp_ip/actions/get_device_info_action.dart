import '../communication/ptp_transaction_queue.dart';
import '../extensions/dump_bytes_extensions.dart';
import '../responses/ptp_operation_response.dart';
import 'action.dart';

class GetDeviceInfoAction extends Action<void> {
  GetDeviceInfoAction([super.operationFactory]);

  @override
  Future<void> run(PtpTransactionQueue transactionQueue) async {
    logger.info('running getDeviceInfo request');
    final getDeviceInfo = operationFactory.createGetDeviceInfo();
    final response = await transactionQueue.handle(getDeviceInfo);
    logger.info('received response');

    verifyOperationResponse(response, 'getDeviceInfo');

    final operationResponse = response as PtpOperationResponse;

    print('received response');
    logger.info(
        'received getDeviceInfo response with data: \n${response.data.dumpAsHex(withLineNumbers: true, asValidList: true)}');
  }
}
