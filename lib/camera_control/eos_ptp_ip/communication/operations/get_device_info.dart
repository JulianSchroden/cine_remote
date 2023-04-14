import '../../constants/ptp_operation_code.dart';
import 'ptp_operation.dart';

class GetDeviceInfo extends PtpRequestOperation {
  const GetDeviceInfo() : super(PtpOperationCode.getDeviceInfo);
}
