// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'camera_control_layout_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CameraControlLayoutState {
  ControlPropType? get activePropType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CameraControlLayoutStateCopyWith<CameraControlLayoutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraControlLayoutStateCopyWith<$Res> {
  factory $CameraControlLayoutStateCopyWith(CameraControlLayoutState value,
          $Res Function(CameraControlLayoutState) then) =
      _$CameraControlLayoutStateCopyWithImpl<$Res, CameraControlLayoutState>;
  @useResult
  $Res call({ControlPropType? activePropType});
}

/// @nodoc
class _$CameraControlLayoutStateCopyWithImpl<$Res,
        $Val extends CameraControlLayoutState>
    implements $CameraControlLayoutStateCopyWith<$Res> {
  _$CameraControlLayoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activePropType = freezed,
  }) {
    return _then(_value.copyWith(
      activePropType: freezed == activePropType
          ? _value.activePropType
          : activePropType // ignore: cast_nullable_to_non_nullable
              as ControlPropType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CameraControlPageLandscapeStateCopyWith<$Res>
    implements $CameraControlLayoutStateCopyWith<$Res> {
  factory _$$_CameraControlPageLandscapeStateCopyWith(
          _$_CameraControlPageLandscapeState value,
          $Res Function(_$_CameraControlPageLandscapeState) then) =
      __$$_CameraControlPageLandscapeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ControlPropType? activePropType});
}

/// @nodoc
class __$$_CameraControlPageLandscapeStateCopyWithImpl<$Res>
    extends _$CameraControlLayoutStateCopyWithImpl<$Res,
        _$_CameraControlPageLandscapeState>
    implements _$$_CameraControlPageLandscapeStateCopyWith<$Res> {
  __$$_CameraControlPageLandscapeStateCopyWithImpl(
      _$_CameraControlPageLandscapeState _value,
      $Res Function(_$_CameraControlPageLandscapeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activePropType = freezed,
  }) {
    return _then(_$_CameraControlPageLandscapeState(
      activePropType: freezed == activePropType
          ? _value.activePropType
          : activePropType // ignore: cast_nullable_to_non_nullable
              as ControlPropType?,
    ));
  }
}

/// @nodoc

class _$_CameraControlPageLandscapeState
    implements _CameraControlPageLandscapeState {
  const _$_CameraControlPageLandscapeState({required this.activePropType});

  @override
  final ControlPropType? activePropType;

  @override
  String toString() {
    return 'CameraControlLayoutState(activePropType: $activePropType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CameraControlPageLandscapeState &&
            (identical(other.activePropType, activePropType) ||
                other.activePropType == activePropType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activePropType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CameraControlPageLandscapeStateCopyWith<
          _$_CameraControlPageLandscapeState>
      get copyWith => __$$_CameraControlPageLandscapeStateCopyWithImpl<
          _$_CameraControlPageLandscapeState>(this, _$identity);
}

abstract class _CameraControlPageLandscapeState
    implements CameraControlLayoutState {
  const factory _CameraControlPageLandscapeState(
          {required final ControlPropType? activePropType}) =
      _$_CameraControlPageLandscapeState;

  @override
  ControlPropType? get activePropType;
  @override
  @JsonKey(ignore: true)
  _$$_CameraControlPageLandscapeStateCopyWith<
          _$_CameraControlPageLandscapeState>
      get copyWith => throw _privateConstructorUsedError;
}
