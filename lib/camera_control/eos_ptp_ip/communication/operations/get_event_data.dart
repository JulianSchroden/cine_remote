import '../../constants/ptp_operation_code.dart';
import 'ptp_operation.dart';

class GetEventData extends PtpRequestOperation {
  const GetEventData() : super(PtpOperationCode.getEventData);
}
