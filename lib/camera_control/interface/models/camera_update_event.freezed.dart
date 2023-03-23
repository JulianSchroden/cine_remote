// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'camera_update_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CameraUpdateEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ControlPropType propType, ControlPropValue value)
        prop,
    required TResult Function(bool isRecording) recordState,
    required TResult Function(AutoFocusMode focusMode) focusMode,
    required TResult Function(int ndValue) ndFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ControlPropType propType, ControlPropValue value)? prop,
    TResult? Function(bool isRecording)? recordState,
    TResult? Function(AutoFocusMode focusMode)? focusMode,
    TResult? Function(int ndValue)? ndFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ControlPropType propType, ControlPropValue value)? prop,
    TResult Function(bool isRecording)? recordState,
    TResult Function(AutoFocusMode focusMode)? focusMode,
    TResult Function(int ndValue)? ndFilter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PropUpdate value) prop,
    required TResult Function(_RecordStateUpdate value) recordState,
    required TResult Function(_FocusModeUpdate value) focusMode,
    required TResult Function(_NdFilterUpdate value) ndFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PropUpdate value)? prop,
    TResult? Function(_RecordStateUpdate value)? recordState,
    TResult? Function(_FocusModeUpdate value)? focusMode,
    TResult? Function(_NdFilterUpdate value)? ndFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PropUpdate value)? prop,
    TResult Function(_RecordStateUpdate value)? recordState,
    TResult Function(_FocusModeUpdate value)? focusMode,
    TResult Function(_NdFilterUpdate value)? ndFilter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraUpdateEventCopyWith<$Res> {
  factory $CameraUpdateEventCopyWith(
          CameraUpdateEvent value, $Res Function(CameraUpdateEvent) then) =
      _$CameraUpdateEventCopyWithImpl<$Res, CameraUpdateEvent>;
}

/// @nodoc
class _$CameraUpdateEventCopyWithImpl<$Res, $Val extends CameraUpdateEvent>
    implements $CameraUpdateEventCopyWith<$Res> {
  _$CameraUpdateEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_PropUpdateCopyWith<$Res> {
  factory _$$_PropUpdateCopyWith(
          _$_PropUpdate value, $Res Function(_$_PropUpdate) then) =
      __$$_PropUpdateCopyWithImpl<$Res>;
  @useResult
  $Res call({ControlPropType propType, ControlPropValue value});
}

/// @nodoc
class __$$_PropUpdateCopyWithImpl<$Res>
    extends _$CameraUpdateEventCopyWithImpl<$Res, _$_PropUpdate>
    implements _$$_PropUpdateCopyWith<$Res> {
  __$$_PropUpdateCopyWithImpl(
      _$_PropUpdate _value, $Res Function(_$_PropUpdate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propType = null,
    Object? value = null,
  }) {
    return _then(_$_PropUpdate(
      null == propType
          ? _value.propType
          : propType // ignore: cast_nullable_to_non_nullable
              as ControlPropType,
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as ControlPropValue,
    ));
  }
}

/// @nodoc

class _$_PropUpdate implements _PropUpdate {
  const _$_PropUpdate(this.propType, this.value);

  @override
  final ControlPropType propType;
  @override
  final ControlPropValue value;

  @override
  String toString() {
    return 'CameraUpdateEvent.prop(propType: $propType, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PropUpdate &&
            (identical(other.propType, propType) ||
                other.propType == propType) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, propType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PropUpdateCopyWith<_$_PropUpdate> get copyWith =>
      __$$_PropUpdateCopyWithImpl<_$_PropUpdate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ControlPropType propType, ControlPropValue value)
        prop,
    required TResult Function(bool isRecording) recordState,
    required TResult Function(AutoFocusMode focusMode) focusMode,
    required TResult Function(int ndValue) ndFilter,
  }) {
    return prop(propType, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ControlPropType propType, ControlPropValue value)? prop,
    TResult? Function(bool isRecording)? recordState,
    TResult? Function(AutoFocusMode focusMode)? focusMode,
    TResult? Function(int ndValue)? ndFilter,
  }) {
    return prop?.call(propType, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ControlPropType propType, ControlPropValue value)? prop,
    TResult Function(bool isRecording)? recordState,
    TResult Function(AutoFocusMode focusMode)? focusMode,
    TResult Function(int ndValue)? ndFilter,
    required TResult orElse(),
  }) {
    if (prop != null) {
      return prop(propType, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PropUpdate value) prop,
    required TResult Function(_RecordStateUpdate value) recordState,
    required TResult Function(_FocusModeUpdate value) focusMode,
    required TResult Function(_NdFilterUpdate value) ndFilter,
  }) {
    return prop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PropUpdate value)? prop,
    TResult? Function(_RecordStateUpdate value)? recordState,
    TResult? Function(_FocusModeUpdate value)? focusMode,
    TResult? Function(_NdFilterUpdate value)? ndFilter,
  }) {
    return prop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PropUpdate value)? prop,
    TResult Function(_RecordStateUpdate value)? recordState,
    TResult Function(_FocusModeUpdate value)? focusMode,
    TResult Function(_NdFilterUpdate value)? ndFilter,
    required TResult orElse(),
  }) {
    if (prop != null) {
      return prop(this);
    }
    return orElse();
  }
}

abstract class _PropUpdate implements CameraUpdateEvent {
  const factory _PropUpdate(
          final ControlPropType propType, final ControlPropValue value) =
      _$_PropUpdate;

  ControlPropType get propType;
  ControlPropValue get value;
  @JsonKey(ignore: true)
  _$$_PropUpdateCopyWith<_$_PropUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RecordStateUpdateCopyWith<$Res> {
  factory _$$_RecordStateUpdateCopyWith(_$_RecordStateUpdate value,
          $Res Function(_$_RecordStateUpdate) then) =
      __$$_RecordStateUpdateCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isRecording});
}

/// @nodoc
class __$$_RecordStateUpdateCopyWithImpl<$Res>
    extends _$CameraUpdateEventCopyWithImpl<$Res, _$_RecordStateUpdate>
    implements _$$_RecordStateUpdateCopyWith<$Res> {
  __$$_RecordStateUpdateCopyWithImpl(
      _$_RecordStateUpdate _value, $Res Function(_$_RecordStateUpdate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRecording = null,
  }) {
    return _then(_$_RecordStateUpdate(
      null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_RecordStateUpdate implements _RecordStateUpdate {
  const _$_RecordStateUpdate(this.isRecording);

  @override
  final bool isRecording;

  @override
  String toString() {
    return 'CameraUpdateEvent.recordState(isRecording: $isRecording)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecordStateUpdate &&
            (identical(other.isRecording, isRecording) ||
                other.isRecording == isRecording));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isRecording);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecordStateUpdateCopyWith<_$_RecordStateUpdate> get copyWith =>
      __$$_RecordStateUpdateCopyWithImpl<_$_RecordStateUpdate>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ControlPropType propType, ControlPropValue value)
        prop,
    required TResult Function(bool isRecording) recordState,
    required TResult Function(AutoFocusMode focusMode) focusMode,
    required TResult Function(int ndValue) ndFilter,
  }) {
    return recordState(isRecording);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ControlPropType propType, ControlPropValue value)? prop,
    TResult? Function(bool isRecording)? recordState,
    TResult? Function(AutoFocusMode focusMode)? focusMode,
    TResult? Function(int ndValue)? ndFilter,
  }) {
    return recordState?.call(isRecording);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ControlPropType propType, ControlPropValue value)? prop,
    TResult Function(bool isRecording)? recordState,
    TResult Function(AutoFocusMode focusMode)? focusMode,
    TResult Function(int ndValue)? ndFilter,
    required TResult orElse(),
  }) {
    if (recordState != null) {
      return recordState(isRecording);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PropUpdate value) prop,
    required TResult Function(_RecordStateUpdate value) recordState,
    required TResult Function(_FocusModeUpdate value) focusMode,
    required TResult Function(_NdFilterUpdate value) ndFilter,
  }) {
    return recordState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PropUpdate value)? prop,
    TResult? Function(_RecordStateUpdate value)? recordState,
    TResult? Function(_FocusModeUpdate value)? focusMode,
    TResult? Function(_NdFilterUpdate value)? ndFilter,
  }) {
    return recordState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PropUpdate value)? prop,
    TResult Function(_RecordStateUpdate value)? recordState,
    TResult Function(_FocusModeUpdate value)? focusMode,
    TResult Function(_NdFilterUpdate value)? ndFilter,
    required TResult orElse(),
  }) {
    if (recordState != null) {
      return recordState(this);
    }
    return orElse();
  }
}

abstract class _RecordStateUpdate implements CameraUpdateEvent {
  const factory _RecordStateUpdate(final bool isRecording) =
      _$_RecordStateUpdate;

  bool get isRecording;
  @JsonKey(ignore: true)
  _$$_RecordStateUpdateCopyWith<_$_RecordStateUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FocusModeUpdateCopyWith<$Res> {
  factory _$$_FocusModeUpdateCopyWith(
          _$_FocusModeUpdate value, $Res Function(_$_FocusModeUpdate) then) =
      __$$_FocusModeUpdateCopyWithImpl<$Res>;
  @useResult
  $Res call({AutoFocusMode focusMode});
}

/// @nodoc
class __$$_FocusModeUpdateCopyWithImpl<$Res>
    extends _$CameraUpdateEventCopyWithImpl<$Res, _$_FocusModeUpdate>
    implements _$$_FocusModeUpdateCopyWith<$Res> {
  __$$_FocusModeUpdateCopyWithImpl(
      _$_FocusModeUpdate _value, $Res Function(_$_FocusModeUpdate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? focusMode = null,
  }) {
    return _then(_$_FocusModeUpdate(
      null == focusMode
          ? _value.focusMode
          : focusMode // ignore: cast_nullable_to_non_nullable
              as AutoFocusMode,
    ));
  }
}

/// @nodoc

class _$_FocusModeUpdate implements _FocusModeUpdate {
  const _$_FocusModeUpdate(this.focusMode);

  @override
  final AutoFocusMode focusMode;

  @override
  String toString() {
    return 'CameraUpdateEvent.focusMode(focusMode: $focusMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FocusModeUpdate &&
            (identical(other.focusMode, focusMode) ||
                other.focusMode == focusMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, focusMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FocusModeUpdateCopyWith<_$_FocusModeUpdate> get copyWith =>
      __$$_FocusModeUpdateCopyWithImpl<_$_FocusModeUpdate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ControlPropType propType, ControlPropValue value)
        prop,
    required TResult Function(bool isRecording) recordState,
    required TResult Function(AutoFocusMode focusMode) focusMode,
    required TResult Function(int ndValue) ndFilter,
  }) {
    return focusMode(this.focusMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ControlPropType propType, ControlPropValue value)? prop,
    TResult? Function(bool isRecording)? recordState,
    TResult? Function(AutoFocusMode focusMode)? focusMode,
    TResult? Function(int ndValue)? ndFilter,
  }) {
    return focusMode?.call(this.focusMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ControlPropType propType, ControlPropValue value)? prop,
    TResult Function(bool isRecording)? recordState,
    TResult Function(AutoFocusMode focusMode)? focusMode,
    TResult Function(int ndValue)? ndFilter,
    required TResult orElse(),
  }) {
    if (focusMode != null) {
      return focusMode(this.focusMode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PropUpdate value) prop,
    required TResult Function(_RecordStateUpdate value) recordState,
    required TResult Function(_FocusModeUpdate value) focusMode,
    required TResult Function(_NdFilterUpdate value) ndFilter,
  }) {
    return focusMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PropUpdate value)? prop,
    TResult? Function(_RecordStateUpdate value)? recordState,
    TResult? Function(_FocusModeUpdate value)? focusMode,
    TResult? Function(_NdFilterUpdate value)? ndFilter,
  }) {
    return focusMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PropUpdate value)? prop,
    TResult Function(_RecordStateUpdate value)? recordState,
    TResult Function(_FocusModeUpdate value)? focusMode,
    TResult Function(_NdFilterUpdate value)? ndFilter,
    required TResult orElse(),
  }) {
    if (focusMode != null) {
      return focusMode(this);
    }
    return orElse();
  }
}

abstract class _FocusModeUpdate implements CameraUpdateEvent {
  const factory _FocusModeUpdate(final AutoFocusMode focusMode) =
      _$_FocusModeUpdate;

  AutoFocusMode get focusMode;
  @JsonKey(ignore: true)
  _$$_FocusModeUpdateCopyWith<_$_FocusModeUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NdFilterUpdateCopyWith<$Res> {
  factory _$$_NdFilterUpdateCopyWith(
          _$_NdFilterUpdate value, $Res Function(_$_NdFilterUpdate) then) =
      __$$_NdFilterUpdateCopyWithImpl<$Res>;
  @useResult
  $Res call({int ndValue});
}

/// @nodoc
class __$$_NdFilterUpdateCopyWithImpl<$Res>
    extends _$CameraUpdateEventCopyWithImpl<$Res, _$_NdFilterUpdate>
    implements _$$_NdFilterUpdateCopyWith<$Res> {
  __$$_NdFilterUpdateCopyWithImpl(
      _$_NdFilterUpdate _value, $Res Function(_$_NdFilterUpdate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ndValue = null,
  }) {
    return _then(_$_NdFilterUpdate(
      null == ndValue
          ? _value.ndValue
          : ndValue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_NdFilterUpdate implements _NdFilterUpdate {
  const _$_NdFilterUpdate(this.ndValue);

  @override
  final int ndValue;

  @override
  String toString() {
    return 'CameraUpdateEvent.ndFilter(ndValue: $ndValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NdFilterUpdate &&
            (identical(other.ndValue, ndValue) || other.ndValue == ndValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ndValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NdFilterUpdateCopyWith<_$_NdFilterUpdate> get copyWith =>
      __$$_NdFilterUpdateCopyWithImpl<_$_NdFilterUpdate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ControlPropType propType, ControlPropValue value)
        prop,
    required TResult Function(bool isRecording) recordState,
    required TResult Function(AutoFocusMode focusMode) focusMode,
    required TResult Function(int ndValue) ndFilter,
  }) {
    return ndFilter(ndValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ControlPropType propType, ControlPropValue value)? prop,
    TResult? Function(bool isRecording)? recordState,
    TResult? Function(AutoFocusMode focusMode)? focusMode,
    TResult? Function(int ndValue)? ndFilter,
  }) {
    return ndFilter?.call(ndValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ControlPropType propType, ControlPropValue value)? prop,
    TResult Function(bool isRecording)? recordState,
    TResult Function(AutoFocusMode focusMode)? focusMode,
    TResult Function(int ndValue)? ndFilter,
    required TResult orElse(),
  }) {
    if (ndFilter != null) {
      return ndFilter(ndValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PropUpdate value) prop,
    required TResult Function(_RecordStateUpdate value) recordState,
    required TResult Function(_FocusModeUpdate value) focusMode,
    required TResult Function(_NdFilterUpdate value) ndFilter,
  }) {
    return ndFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PropUpdate value)? prop,
    TResult? Function(_RecordStateUpdate value)? recordState,
    TResult? Function(_FocusModeUpdate value)? focusMode,
    TResult? Function(_NdFilterUpdate value)? ndFilter,
  }) {
    return ndFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PropUpdate value)? prop,
    TResult Function(_RecordStateUpdate value)? recordState,
    TResult Function(_FocusModeUpdate value)? focusMode,
    TResult Function(_NdFilterUpdate value)? ndFilter,
    required TResult orElse(),
  }) {
    if (ndFilter != null) {
      return ndFilter(this);
    }
    return orElse();
  }
}

abstract class _NdFilterUpdate implements CameraUpdateEvent {
  const factory _NdFilterUpdate(final int ndValue) = _$_NdFilterUpdate;

  int get ndValue;
  @JsonKey(ignore: true)
  _$$_NdFilterUpdateCopyWith<_$_NdFilterUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}
