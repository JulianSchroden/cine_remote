// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'screen_orientation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScreenOrientationState {
  Orientation? get forcedOrientation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScreenOrientationStateCopyWith<ScreenOrientationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreenOrientationStateCopyWith<$Res> {
  factory $ScreenOrientationStateCopyWith(ScreenOrientationState value,
          $Res Function(ScreenOrientationState) then) =
      _$ScreenOrientationStateCopyWithImpl<$Res, ScreenOrientationState>;
  @useResult
  $Res call({Orientation? forcedOrientation});
}

/// @nodoc
class _$ScreenOrientationStateCopyWithImpl<$Res,
        $Val extends ScreenOrientationState>
    implements $ScreenOrientationStateCopyWith<$Res> {
  _$ScreenOrientationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forcedOrientation = freezed,
  }) {
    return _then(_value.copyWith(
      forcedOrientation: freezed == forcedOrientation
          ? _value.forcedOrientation
          : forcedOrientation // ignore: cast_nullable_to_non_nullable
              as Orientation?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScreenOrientationStateImplCopyWith<$Res>
    implements $ScreenOrientationStateCopyWith<$Res> {
  factory _$$ScreenOrientationStateImplCopyWith(
          _$ScreenOrientationStateImpl value,
          $Res Function(_$ScreenOrientationStateImpl) then) =
      __$$ScreenOrientationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Orientation? forcedOrientation});
}

/// @nodoc
class __$$ScreenOrientationStateImplCopyWithImpl<$Res>
    extends _$ScreenOrientationStateCopyWithImpl<$Res,
        _$ScreenOrientationStateImpl>
    implements _$$ScreenOrientationStateImplCopyWith<$Res> {
  __$$ScreenOrientationStateImplCopyWithImpl(
      _$ScreenOrientationStateImpl _value,
      $Res Function(_$ScreenOrientationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forcedOrientation = freezed,
  }) {
    return _then(_$ScreenOrientationStateImpl(
      forcedOrientation: freezed == forcedOrientation
          ? _value.forcedOrientation
          : forcedOrientation // ignore: cast_nullable_to_non_nullable
              as Orientation?,
    ));
  }
}

/// @nodoc

class _$ScreenOrientationStateImpl implements _ScreenOrientationState {
  const _$ScreenOrientationStateImpl({required this.forcedOrientation});

  @override
  final Orientation? forcedOrientation;

  @override
  String toString() {
    return 'ScreenOrientationState(forcedOrientation: $forcedOrientation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreenOrientationStateImpl &&
            (identical(other.forcedOrientation, forcedOrientation) ||
                other.forcedOrientation == forcedOrientation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, forcedOrientation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreenOrientationStateImplCopyWith<_$ScreenOrientationStateImpl>
      get copyWith => __$$ScreenOrientationStateImplCopyWithImpl<
          _$ScreenOrientationStateImpl>(this, _$identity);
}

abstract class _ScreenOrientationState implements ScreenOrientationState {
  const factory _ScreenOrientationState(
          {required final Orientation? forcedOrientation}) =
      _$ScreenOrientationStateImpl;

  @override
  Orientation? get forcedOrientation;
  @override
  @JsonKey(ignore: true)
  _$$ScreenOrientationStateImplCopyWith<_$ScreenOrientationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
