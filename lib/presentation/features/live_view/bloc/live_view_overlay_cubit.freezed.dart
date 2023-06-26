// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_view_overlay_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LiveViewOverlayState {
  bool get showCenterMarker => throw _privateConstructorUsedError;
  bool get showGrid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LiveViewOverlayStateCopyWith<LiveViewOverlayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveViewOverlayStateCopyWith<$Res> {
  factory $LiveViewOverlayStateCopyWith(LiveViewOverlayState value,
          $Res Function(LiveViewOverlayState) then) =
      _$LiveViewOverlayStateCopyWithImpl<$Res, LiveViewOverlayState>;
  @useResult
  $Res call({bool showCenterMarker, bool showGrid});
}

/// @nodoc
class _$LiveViewOverlayStateCopyWithImpl<$Res,
        $Val extends LiveViewOverlayState>
    implements $LiveViewOverlayStateCopyWith<$Res> {
  _$LiveViewOverlayStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showCenterMarker = null,
    Object? showGrid = null,
  }) {
    return _then(_value.copyWith(
      showCenterMarker: null == showCenterMarker
          ? _value.showCenterMarker
          : showCenterMarker // ignore: cast_nullable_to_non_nullable
              as bool,
      showGrid: null == showGrid
          ? _value.showGrid
          : showGrid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LiveViewOverlayStateCopyWith<$Res>
    implements $LiveViewOverlayStateCopyWith<$Res> {
  factory _$$_LiveViewOverlayStateCopyWith(_$_LiveViewOverlayState value,
          $Res Function(_$_LiveViewOverlayState) then) =
      __$$_LiveViewOverlayStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool showCenterMarker, bool showGrid});
}

/// @nodoc
class __$$_LiveViewOverlayStateCopyWithImpl<$Res>
    extends _$LiveViewOverlayStateCopyWithImpl<$Res, _$_LiveViewOverlayState>
    implements _$$_LiveViewOverlayStateCopyWith<$Res> {
  __$$_LiveViewOverlayStateCopyWithImpl(_$_LiveViewOverlayState _value,
      $Res Function(_$_LiveViewOverlayState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showCenterMarker = null,
    Object? showGrid = null,
  }) {
    return _then(_$_LiveViewOverlayState(
      showCenterMarker: null == showCenterMarker
          ? _value.showCenterMarker
          : showCenterMarker // ignore: cast_nullable_to_non_nullable
              as bool,
      showGrid: null == showGrid
          ? _value.showGrid
          : showGrid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LiveViewOverlayState implements _LiveViewOverlayState {
  const _$_LiveViewOverlayState(
      {this.showCenterMarker = true, this.showGrid = true});

  @override
  @JsonKey()
  final bool showCenterMarker;
  @override
  @JsonKey()
  final bool showGrid;

  @override
  String toString() {
    return 'LiveViewOverlayState(showCenterMarker: $showCenterMarker, showGrid: $showGrid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LiveViewOverlayState &&
            (identical(other.showCenterMarker, showCenterMarker) ||
                other.showCenterMarker == showCenterMarker) &&
            (identical(other.showGrid, showGrid) ||
                other.showGrid == showGrid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, showCenterMarker, showGrid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LiveViewOverlayStateCopyWith<_$_LiveViewOverlayState> get copyWith =>
      __$$_LiveViewOverlayStateCopyWithImpl<_$_LiveViewOverlayState>(
          this, _$identity);
}

abstract class _LiveViewOverlayState implements LiveViewOverlayState {
  const factory _LiveViewOverlayState(
      {final bool showCenterMarker,
      final bool showGrid}) = _$_LiveViewOverlayState;

  @override
  bool get showCenterMarker;
  @override
  bool get showGrid;
  @override
  @JsonKey(ignore: true)
  _$$_LiveViewOverlayStateCopyWith<_$_LiveViewOverlayState> get copyWith =>
      throw _privateConstructorUsedError;
}
