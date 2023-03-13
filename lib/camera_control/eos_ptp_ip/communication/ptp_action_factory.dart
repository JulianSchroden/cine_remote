import 'actions/open_session_action.dart';
import 'ptp_ip_client.dart';

class PtpActionFactory {
  int _transactionId = 0;

  int get nextTransactionId => _transactionId++;

  OpenSesionAction createOpenSesionAction({
    required PtpIpClient client,
    required int sessionId,
  }) =>
      OpenSesionAction(
        client: client,
        transactionId: nextTransactionId,
        sessionId: sessionId,
      );
}
