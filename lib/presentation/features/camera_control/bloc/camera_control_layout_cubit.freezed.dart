// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_control_layout_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CameraControlLayoutState {
  ControlPropType? get activePropType => throw _privateConstructorUsedError;
  bool get showMenu => throw _privateConstructorUsedError;

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
  $Res call({ControlPropType? activePropType, bool showMenu});
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
    Object? showMenu = null,
  }) {
    return _then(_value.copyWith(
      activePropType: freezed == activePropType
          ? _value.activePropType
          : activePropType // ignore: cast_nullable_to_non_nullable
              as ControlPropType?,
      showMenu: null == showMenu
          ? _value.showMenu
          : showMenu // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CameraControlPageLandscapeStateImplCopyWith<$Res>
    implements $CameraControlLayoutStateCopyWith<$Res> {
  factory _$$CameraControlPageLandscapeStateImplCopyWith(
          _$CameraControlPageLandscapeStateImpl value,
          $Res Function(_$CameraControlPageLandscapeStateImpl) then) =
      __$$CameraControlPageLandscapeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ControlPropType? activePropType, bool showMenu});
}

/// @nodoc
class __$$CameraControlPageLandscapeStateImplCopyWithImpl<$Res>
    extends _$CameraControlLayoutStateCopyWithImpl<$Res,
        _$CameraControlPageLandscapeStateImpl>
    implements _$$CameraControlPageLandscapeStateImplCopyWith<$Res> {
  __$$CameraControlPageLandscapeStateImplCopyWithImpl(
      _$CameraControlPageLandscapeStateImpl _value,
      $Res Function(_$CameraControlPageLandscapeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activePropType = freezed,
    Object? showMenu = null,
  }) {
    return _then(_$CameraControlPageLandscapeStateImpl(
      activePropType: freezed == activePropType
          ? _value.activePropType
          : activePropType // ignore: cast_nullable_to_non_nullable
              as ControlPropType?,
      showMenu: null == showMenu
          ? _value.showMenu
          : showMenu // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CameraControlPageLandscapeStateImpl
    implements _CameraControlPageLandscapeState {
  const _$CameraControlPageLandscapeStateImpl(
      {required this.activePropType, required this.showMenu});

  @override
  final ControlPropType? activePropType;
  @override
  final bool showMenu;

  @override
  String toString() {
    return 'CameraControlLayoutState(activePropType: $activePropType, showMenu: $showMenu)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraControlPageLandscapeStateImpl &&
            (identical(other.activePropType, activePropType) ||
                other.activePropType == activePropType) &&
            (identical(other.showMenu, showMenu) ||
                other.showMenu == showMenu));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activePropType, showMenu);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraControlPageLandscapeStateImplCopyWith<
          _$CameraControlPageLandscapeStateImpl>
      get copyWith => __$$CameraControlPageLandscapeStateImplCopyWithImpl<
          _$CameraControlPageLandscapeStateImpl>(this, _$identity);
}

abstract class _CameraControlPageLandscapeState
    implements CameraControlLayoutState {
  const factory _CameraControlPageLandscapeState(
      {required final ControlPropType? activePropType,
      required final bool showMenu}) = _$CameraControlPageLandscapeStateImpl;

  @override
  ControlPropType? get activePropType;
  @override
  bool get showMenu;
  @override
  @JsonKey(ignore: true)
  _$$CameraControlPageLandscapeStateImplCopyWith<
          _$CameraControlPageLandscapeStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
