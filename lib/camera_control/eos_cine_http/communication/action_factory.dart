import 'actions/get_info_action.dart';
import 'actions/login_action.dart';
import 'http_adapter.dart';

class ActionFactory {
  const ActionFactory();

  LoginAction createLoginAction(HttpAdapter adapter) => LoginAction(adapter);

  GetInfoAction createGetInfoAction(HttpAdapter adapter) =>
      GetInfoAction(adapter);
}
