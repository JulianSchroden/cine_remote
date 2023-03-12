import '../../constants/api_endpoint_path.dart';
import '../../models/http_adapter_response.dart';
import '../get_acion.dart';

class LoginAction extends GetAction<HttpAdapterResponse> {
  const LoginAction(super.httpAdapter);

  @override
  Future<HttpAdapterResponse> call() => httpAdapter.get(ApiEndpointPath.login);
}
