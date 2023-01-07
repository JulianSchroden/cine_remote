import 'dart:convert';
import 'dart:io';

import '../models/http_adapter_response.dart';

extension ClientResponseMapperExtension on HttpClientResponse {
  Future<HttpAdapterResponse> toAdapterResponse() async {
    final body = await transform(utf8.decoder).join();
    final jsonBody = jsonDecode(body);

    return HttpAdapterResponse(
      statusCode: statusCode,
      jsonBody: jsonBody,
      cookies: cookies,
    );
  }
}
