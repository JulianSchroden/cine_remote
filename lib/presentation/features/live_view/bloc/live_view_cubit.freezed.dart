// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_view_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LiveViewState {
  LiveViewStatus get status => throw _privateConstructorUsedError;
  Uint8List? get imageBytes => throw _privateConstructorUsedError;
  double get aspectRatio => throw _privateConstructorUsedError;
  bool get supportsTouchAutofocus => throw _privateConstructorUsedError;
  TouchAutofocusState? get autofocusState => throw _privateConstructorUsedError;

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
      {LiveViewStatus status,
      Uint8List? imageBytes,
      double aspectRatio,
      bool supportsTouchAutofocus,
      TouchAutofocusState? autofocusState});
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
    Object? status = null,
    Object? imageBytes = freezed,
    Object? aspectRatio = null,
    Object? supportsTouchAutofocus = null,
    Object? autofocusState = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LiveViewStatus,
      imageBytes: freezed == imageBytes
          ? _value.imageBytes
          : imageBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      aspectRatio: null == aspectRatio
          ? _value.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double,
      supportsTouchAutofocus: null == supportsTouchAutofocus
          ? _value.supportsTouchAutofocus
          : supportsTouchAutofocus // ignore: cast_nullable_to_non_nullable
              as bool,
      autofocusState: freezed == autofocusState
          ? _value.autofocusState
          : autofocusState // ignore: cast_nullable_to_non_nullable
              as TouchAutofocusState?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiveViewStateImplCopyWith<$Res>
    implements $LiveViewStateCopyWith<$Res> {
  factory _$$LiveViewStateImplCopyWith(
          _$LiveViewStateImpl value, $Res Function(_$LiveViewStateImpl) then) =
      __$$LiveViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LiveViewStatus status,
      Uint8List? imageBytes,
      double aspectRatio,
      bool supportsTouchAutofocus,
      TouchAutofocusState? autofocusState});
}

/// @nodoc
class __$$LiveViewStateImplCopyWithImpl<$Res>
    extends _$LiveViewStateCopyWithImpl<$Res, _$LiveViewStateImpl>
    implements _$$LiveViewStateImplCopyWith<$Res> {
  __$$LiveViewStateImplCopyWithImpl(
      _$LiveViewStateImpl _value, $Res Function(_$LiveViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? imageBytes = freezed,
    Object? aspectRatio = null,
    Object? supportsTouchAutofocus = null,
    Object? autofocusState = freezed,
  }) {
    return _then(_$LiveViewStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LiveViewStatus,
      imageBytes: freezed == imageBytes
          ? _value.imageBytes
          : imageBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      aspectRatio: null == aspectRatio
          ? _value.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double,
      supportsTouchAutofocus: null == supportsTouchAutofocus
          ? _value.supportsTouchAutofocus
          : supportsTouchAutofocus // ignore: cast_nullable_to_non_nullable
              as bool,
      autofocusState: freezed == autofocusState
          ? _value.autofocusState
          : autofocusState // ignore: cast_nullable_to_non_nullable
              as TouchAutofocusState?,
    ));
  }
}

/// @nodoc

class _$LiveViewStateImpl extends _LiveViewState {
  const _$LiveViewStateImpl(
      {required this.status,
      this.imageBytes,
      this.aspectRatio = 16 / 9,
      this.supportsTouchAutofocus = false,
      this.autofocusState})
      : super._();

  @override
  final LiveViewStatus status;
  @override
  final Uint8List? imageBytes;
  @override
  @JsonKey()
  final double aspectRatio;
  @override
  @JsonKey()
  final bool supportsTouchAutofocus;
  @override
  final TouchAutofocusState? autofocusState;

  @override
  String toString() {
    return 'LiveViewState(status: $status, imageBytes: $imageBytes, aspectRatio: $aspectRatio, supportsTouchAutofocus: $supportsTouchAutofocus, autofocusState: $autofocusState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveViewStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other.imageBytes, imageBytes) &&
            (identical(other.aspectRatio, aspectRatio) ||
                other.aspectRatio == aspectRatio) &&
            (identical(other.supportsTouchAutofocus, supportsTouchAutofocus) ||
                other.supportsTouchAutofocus == supportsTouchAutofocus) &&
            (identical(other.autofocusState, autofocusState) ||
                other.autofocusState == autofocusState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(imageBytes),
      aspectRatio,
      supportsTouchAutofocus,
      autofocusState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveViewStateImplCopyWith<_$LiveViewStateImpl> get copyWith =>
      __$$LiveViewStateImplCopyWithImpl<_$LiveViewStateImpl>(this, _$identity);
}

abstract class _LiveViewState extends LiveViewState {
  const factory _LiveViewState(
      {required final LiveViewStatus status,
      final Uint8List? imageBytes,
      final double aspectRatio,
      final bool supportsTouchAutofocus,
      final TouchAutofocusState? autofocusState}) = _$LiveViewStateImpl;
  const _LiveViewState._() : super._();

  @override
  LiveViewStatus get status;
  @override
  Uint8List? get imageBytes;
  @override
  double get aspectRatio;
  @override
  bool get supportsTouchAutofocus;
  @override
  TouchAutofocusState? get autofocusState;
  @override
  @JsonKey(ignore: true)
  _$$LiveViewStateImplCopyWith<_$LiveViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
