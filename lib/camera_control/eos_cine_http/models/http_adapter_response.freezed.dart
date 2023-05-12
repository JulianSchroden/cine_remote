// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'http_adapter_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HttpAdapterResponse {
  int get statusCode => throw _privateConstructorUsedError;
  dynamic get jsonBody => throw _privateConstructorUsedError;
  List<Cookie> get cookies => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HttpAdapterResponseCopyWith<HttpAdapterResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HttpAdapterResponseCopyWith<$Res> {
  factory $HttpAdapterResponseCopyWith(
          HttpAdapterResponse value, $Res Function(HttpAdapterResponse) then) =
      _$HttpAdapterResponseCopyWithImpl<$Res, HttpAdapterResponse>;
  @useResult
  $Res call({int statusCode, dynamic jsonBody, List<Cookie> cookies});
}

/// @nodoc
class _$HttpAdapterResponseCopyWithImpl<$Res, $Val extends HttpAdapterResponse>
    implements $HttpAdapterResponseCopyWith<$Res> {
  _$HttpAdapterResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? jsonBody = freezed,
    Object? cookies = null,
  }) {
    return _then(_value.copyWith(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      jsonBody: freezed == jsonBody
          ? _value.jsonBody
          : jsonBody // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cookies: null == cookies
          ? _value.cookies
          : cookies // ignore: cast_nullable_to_non_nullable
              as List<Cookie>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HttpAdapterResponseCopyWith<$Res>
    implements $HttpAdapterResponseCopyWith<$Res> {
  factory _$$_HttpAdapterResponseCopyWith(_$_HttpAdapterResponse value,
          $Res Function(_$_HttpAdapterResponse) then) =
      __$$_HttpAdapterResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int statusCode, dynamic jsonBody, List<Cookie> cookies});
}

/// @nodoc
class __$$_HttpAdapterResponseCopyWithImpl<$Res>
    extends _$HttpAdapterResponseCopyWithImpl<$Res, _$_HttpAdapterResponse>
    implements _$$_HttpAdapterResponseCopyWith<$Res> {
  __$$_HttpAdapterResponseCopyWithImpl(_$_HttpAdapterResponse _value,
      $Res Function(_$_HttpAdapterResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? jsonBody = freezed,
    Object? cookies = null,
  }) {
    return _then(_$_HttpAdapterResponse(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      jsonBody: freezed == jsonBody
          ? _value.jsonBody
          : jsonBody // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cookies: null == cookies
          ? _value._cookies
          : cookies // ignore: cast_nullable_to_non_nullable
              as List<Cookie>,
    ));
  }
}

/// @nodoc

class _$_HttpAdapterResponse extends _HttpAdapterResponse {
  const _$_HttpAdapterResponse(
      {required this.statusCode,
      required this.jsonBody,
      required final List<Cookie> cookies})
      : _cookies = cookies,
        super._();

  @override
  final int statusCode;
  @override
  final dynamic jsonBody;
  final List<Cookie> _cookies;
  @override
  List<Cookie> get cookies {
    if (_cookies is EqualUnmodifiableListView) return _cookies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cookies);
  }

  @override
  String toString() {
    return 'HttpAdapterResponse(statusCode: $statusCode, jsonBody: $jsonBody, cookies: $cookies)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HttpAdapterResponse &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            const DeepCollectionEquality().equals(other.jsonBody, jsonBody) &&
            const DeepCollectionEquality().equals(other._cookies, _cookies));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      statusCode,
      const DeepCollectionEquality().hash(jsonBody),
      const DeepCollectionEquality().hash(_cookies));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HttpAdapterResponseCopyWith<_$_HttpAdapterResponse> get copyWith =>
      __$$_HttpAdapterResponseCopyWithImpl<_$_HttpAdapterResponse>(
          this, _$identity);
}

abstract class _HttpAdapterResponse extends HttpAdapterResponse {
  const factory _HttpAdapterResponse(
      {required final int statusCode,
      required final dynamic jsonBody,
      required final List<Cookie> cookies}) = _$_HttpAdapterResponse;
  const _HttpAdapterResponse._() : super._();

  @override
  int get statusCode;
  @override
  dynamic get jsonBody;
  @override
  List<Cookie> get cookies;
  @override
  @JsonKey(ignore: true)
  _$$_HttpAdapterResponseCopyWith<_$_HttpAdapterResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
