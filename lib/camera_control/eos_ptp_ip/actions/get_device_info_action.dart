import '../adapter/ptp_device_info_parser.dart';
import '../communication/ptp_transaction_queue.dart';
import '../responses/ptp_operation_response.dart';
import 'action.dart';

class GetDeviceInfoAction extends Action<void> {
  final PtpDeviceInfoParser infoParser;
  GetDeviceInfoAction([
    super.operationFactory,
    this.infoParser = const PtpDeviceInfoParser(),
  ]);

  @override
  Future<void> run(PtpTransactionQueue transactionQueue) async {
    final getDeviceInfo = operationFactory.createGetDeviceInfo();
    final response = await transactionQueue.handle(getDeviceInfo);

    verifyOperationResponse(response, 'getDeviceInfo');

    final operationResponse = response as PtpOperationResponse;
    final deviceInfo = infoParser.parseData(operationResponse.data);

    logger.info('received getDeviceInfo response with data: $deviceInfo');
  }
}
