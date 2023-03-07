import 'dart:io';

import '../extensions/client_response_extensions.dart';
import '../models/http_adapter_response.dart';
import '../models/eos_cine_http_camera_handle.dart';

class HttpAdapter {
  final String _authority = '192.168.0.80';

  HttpAdapter();

  Future<HttpAdapterResponse> get(
    EosCineHttpCameraHandle? handle,
    String path, [
    Map<String, dynamic>? queryParams,
  ]) async {
    final url = Uri.http(_authority, path, queryParams);
    final client = HttpClient();
    final request = await client.getUrl(url);
    if (handle != null) {
      request.cookies.addAll(handle.cookies);
    }

    final clientResponse = await request.close();
    client.close();

    return await clientResponse.toAdapterResponse();
  }
}
