import '../adapter/http_adapter.dart';

abstract class GetAction<T> {
  final HttpAdapter httpAdapter;

  const GetAction(this.httpAdapter);

  Future<T> call();
}
