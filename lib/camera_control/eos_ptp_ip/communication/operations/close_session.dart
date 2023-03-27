import '../../constants/ptp_operation_code.dart';
import 'ptp_operation.dart';

class CloseSession extends PtpRequestOperation {
  CloseSession() : super(PtpOperationCode.closeSession);
}
