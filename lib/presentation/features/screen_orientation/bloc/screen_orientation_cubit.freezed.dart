// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'screen_orientation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_ScreenOrientationStateCopyWith<$Res>
    implements $ScreenOrientationStateCopyWith<$Res> {
  factory _$$_ScreenOrientationStateCopyWith(_$_ScreenOrientationState value,
          $Res Function(_$_ScreenOrientationState) then) =
      __$$_ScreenOrientationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Orientation? forcedOrientation});
}

/// @nodoc
class __$$_ScreenOrientationStateCopyWithImpl<$Res>
    extends _$ScreenOrientationStateCopyWithImpl<$Res,
        _$_ScreenOrientationState>
    implements _$$_ScreenOrientationStateCopyWith<$Res> {
  __$$_ScreenOrientationStateCopyWithImpl(_$_ScreenOrientationState _value,
      $Res Function(_$_ScreenOrientationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forcedOrientation = freezed,
  }) {
    return _then(_$_ScreenOrientationState(
      forcedOrientation: freezed == forcedOrientation
          ? _value.forcedOrientation
          : forcedOrientation // ignore: cast_nullable_to_non_nullable
              as Orientation?,
    ));
  }
}

/// @nodoc

class _$_ScreenOrientationState implements _ScreenOrientationState {
  const _$_ScreenOrientationState({required this.forcedOrientation});

  @override
  final Orientation? forcedOrientation;

  @override
  String toString() {
    return 'ScreenOrientationState(forcedOrientation: $forcedOrientation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScreenOrientationState &&
            (identical(other.forcedOrientation, forcedOrientation) ||
                other.forcedOrientation == forcedOrientation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, forcedOrientation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScreenOrientationStateCopyWith<_$_ScreenOrientationState> get copyWith =>
      __$$_ScreenOrientationStateCopyWithImpl<_$_ScreenOrientationState>(
          this, _$identity);
}

abstract class _ScreenOrientationState implements ScreenOrientationState {
  const factory _ScreenOrientationState(
          {required final Orientation? forcedOrientation}) =
      _$_ScreenOrientationState;

  @override
  Orientation? get forcedOrientation;
  @override
  @JsonKey(ignore: true)
  _$$_ScreenOrientationStateCopyWith<_$_ScreenOrientationState> get copyWith =>
      throw _privateConstructorUsedError;
}
