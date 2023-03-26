import '../actions/get_events_action.dart';
import 'init_session_action.dart';

class ActionFactory {
  const ActionFactory();

  InitSessionAction createInitSessionAction() => InitSessionAction();

  GetEventsAction createGetEventsAction() => GetEventsAction();
}
