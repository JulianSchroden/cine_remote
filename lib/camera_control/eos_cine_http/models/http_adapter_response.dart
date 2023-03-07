import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_adapter_response.freezed.dart';

@freezed
class HttpAdapterResponse with _$HttpAdapterResponse {
  const HttpAdapterResponse._();

  const factory HttpAdapterResponse({
    required int statusCode,
    required dynamic jsonBody,
    required List<Cookie> cookies,
  }) = _HttpAdapterResponse;

  bool isOkay() {
    if (statusCode != 200) return false;
    return jsonBody['res'] == 'ok';
  }
}
