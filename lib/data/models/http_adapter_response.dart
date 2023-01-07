import 'dart:convert';
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_adapter_response.freezed.dart';

@freezed
class HttpAdapterResponse with _$HttpAdapterResponse {
  factory HttpAdapterResponse({
    required int statusCode,
    required dynamic jsonBody,
    required List<Cookie> cookies,
  }) = _HttpAdapterResponse;
}
