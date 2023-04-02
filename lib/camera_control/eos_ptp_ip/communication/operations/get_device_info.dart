import 'ptp_operation.dart';
import '../../constants/ptp_operation_code.dart';

class GetDeviceInfo extends PtpRequestOperation {
  const GetDeviceInfo() : super(PtpOperationCode.getDeviceInfo);
}
