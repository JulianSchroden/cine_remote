import '../actions/action_factory.dart';
import '../communication/events/ptp_event.dart';
import '../communication/ptp_transaction_queue.dart';

class GetEosEventsDelegate {
  final PtpTransactionQueue _transactionQueue;
  final ActionFactory _actionFactory;

  GetEosEventsDelegate(this._transactionQueue, this._actionFactory);

  Future<List<PtpEvent>> getEvents() {
    final getEvents = _actionFactory.createGetEventsAction();
    return getEvents.run(_transactionQueue);
  }
}
