import 'ptp_operation.dart';
import '../../constants/ptp_operation_code.dart';

class GetEventData extends PtpRequestOperation {
  const GetEventData() : super(PtpOperationCode.getEventData);
}
