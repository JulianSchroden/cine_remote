// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'live_view_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LiveViewState {
  bool get isLiveViewActive => throw _privateConstructorUsedError;
  Uint8List? get imageBytes => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LiveViewStateCopyWith<LiveViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveViewStateCopyWith<$Res> {
  factory $LiveViewStateCopyWith(
          LiveViewState value, $Res Function(LiveViewState) then) =
      _$LiveViewStateCopyWithImpl<$Res, LiveViewState>;
  @useResult
  $Res call(
      {bool isLiveViewActive,
      Uint8List? imageBytes,
      bool isLoading,
      bool hasError});
}

/// @nodoc
class _$LiveViewStateCopyWithImpl<$Res, $Val extends LiveViewState>
    implements $LiveViewStateCopyWith<$Res> {
  _$LiveViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLiveViewActive = null,
    Object? imageBytes = freezed,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(_value.copyWith(
      isLiveViewActive: null == isLiveViewActive
          ? _value.isLiveViewActive
          : isLiveViewActive // ignore: cast_nullable_to_non_nullable
              as bool,
      imageBytes: freezed == imageBytes
          ? _value.imageBytes
          : imageBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LiveViewStateCopyWith<$Res>
    implements $LiveViewStateCopyWith<$Res> {
  factory _$$_LiveViewStateCopyWith(
          _$_LiveViewState value, $Res Function(_$_LiveViewState) then) =
      __$$_LiveViewStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLiveViewActive,
      Uint8List? imageBytes,
      bool isLoading,
      bool hasError});
}

/// @nodoc
class __$$_LiveViewStateCopyWithImpl<$Res>
    extends _$LiveViewStateCopyWithImpl<$Res, _$_LiveViewState>
    implements _$$_LiveViewStateCopyWith<$Res> {
  __$$_LiveViewStateCopyWithImpl(
      _$_LiveViewState _value, $Res Function(_$_LiveViewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLiveViewActive = null,
    Object? imageBytes = freezed,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(_$_LiveViewState(
      isLiveViewActive: null == isLiveViewActive
          ? _value.isLiveViewActive
          : isLiveViewActive // ignore: cast_nullable_to_non_nullable
              as bool,
      imageBytes: freezed == imageBytes
          ? _value.imageBytes
          : imageBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LiveViewState implements _LiveViewState {
  const _$_LiveViewState(
      {required this.isLiveViewActive,
      this.imageBytes,
      this.isLoading = false,
      this.hasError = false});

  @override
  final bool isLiveViewActive;
  @override
  final Uint8List? imageBytes;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasError;

  @override
  String toString() {
    return 'LiveViewState(isLiveViewActive: $isLiveViewActive, imageBytes: $imageBytes, isLoading: $isLoading, hasError: $hasError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LiveViewState &&
            (identical(other.isLiveViewActive, isLiveViewActive) ||
                other.isLiveViewActive == isLiveViewActive) &&
            const DeepCollectionEquality()
                .equals(other.imageBytes, imageBytes) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLiveViewActive,
      const DeepCollectionEquality().hash(imageBytes), isLoading, hasError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LiveViewStateCopyWith<_$_LiveViewState> get copyWith =>
      __$$_LiveViewStateCopyWithImpl<_$_LiveViewState>(this, _$identity);
}

abstract class _LiveViewState implements LiveViewState {
  const factory _LiveViewState(
      {required final bool isLiveViewActive,
      final Uint8List? imageBytes,
      final bool isLoading,
      final bool hasError}) = _$_LiveViewState;

  @override
  bool get isLiveViewActive;
  @override
  Uint8List? get imageBytes;
  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  @JsonKey(ignore: true)
  _$$_LiveViewStateCopyWith<_$_LiveViewState> get copyWith =>
      throw _privateConstructorUsedError;
}
