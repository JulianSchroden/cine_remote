// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'actions_control_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ActionsState {
  bool get isRecording => throw _privateConstructorUsedError;
  bool get isAfLocked => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ActionsStateCopyWith<ActionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionsStateCopyWith<$Res> {
  factory $ActionsStateCopyWith(
          ActionsState value, $Res Function(ActionsState) then) =
      _$ActionsStateCopyWithImpl<$Res, ActionsState>;
  @useResult
  $Res call({bool isRecording, bool isAfLocked});
}

/// @nodoc
class _$ActionsStateCopyWithImpl<$Res, $Val extends ActionsState>
    implements $ActionsStateCopyWith<$Res> {
  _$ActionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRecording = null,
    Object? isAfLocked = null,
  }) {
    return _then(_value.copyWith(
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      isAfLocked: null == isAfLocked
          ? _value.isAfLocked
          : isAfLocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ActionsStateCopyWith<$Res>
    implements $ActionsStateCopyWith<$Res> {
  factory _$$_ActionsStateCopyWith(
          _$_ActionsState value, $Res Function(_$_ActionsState) then) =
      __$$_ActionsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isRecording, bool isAfLocked});
}

/// @nodoc
class __$$_ActionsStateCopyWithImpl<$Res>
    extends _$ActionsStateCopyWithImpl<$Res, _$_ActionsState>
    implements _$$_ActionsStateCopyWith<$Res> {
  __$$_ActionsStateCopyWithImpl(
      _$_ActionsState _value, $Res Function(_$_ActionsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRecording = null,
    Object? isAfLocked = null,
  }) {
    return _then(_$_ActionsState(
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      isAfLocked: null == isAfLocked
          ? _value.isAfLocked
          : isAfLocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ActionsState implements _ActionsState {
  _$_ActionsState({required this.isRecording, required this.isAfLocked});

  @override
  final bool isRecording;
  @override
  final bool isAfLocked;

  @override
  String toString() {
    return 'ActionsState(isRecording: $isRecording, isAfLocked: $isAfLocked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ActionsState &&
            (identical(other.isRecording, isRecording) ||
                other.isRecording == isRecording) &&
            (identical(other.isAfLocked, isAfLocked) ||
                other.isAfLocked == isAfLocked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isRecording, isAfLocked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ActionsStateCopyWith<_$_ActionsState> get copyWith =>
      __$$_ActionsStateCopyWithImpl<_$_ActionsState>(this, _$identity);
}

abstract class _ActionsState implements ActionsState {
  factory _ActionsState(
      {required final bool isRecording,
      required final bool isAfLocked}) = _$_ActionsState;

  @override
  bool get isRecording;
  @override
  bool get isAfLocked;
  @override
  @JsonKey(ignore: true)
  _$$_ActionsStateCopyWith<_$_ActionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ActionsControlState {
  ActionsState get actionsState => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ActionsState actionsState) init,
    required TResult Function(ActionsState actionsState) updating,
    required TResult Function(ActionsState actionsState) updateSuccess,
    required TResult Function(ActionsState actionsState) updateFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ActionsState actionsState)? init,
    TResult? Function(ActionsState actionsState)? updating,
    TResult? Function(ActionsState actionsState)? updateSuccess,
    TResult? Function(ActionsState actionsState)? updateFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ActionsState actionsState)? init,
    TResult Function(ActionsState actionsState)? updating,
    TResult Function(ActionsState actionsState)? updateSuccess,
    TResult Function(ActionsState actionsState)? updateFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Updating value) updating,
    required TResult Function(_UpdateSuccess value) updateSuccess,
    required TResult Function(_UpdateFailed value) updateFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Updating value)? updating,
    TResult? Function(_UpdateSuccess value)? updateSuccess,
    TResult? Function(_UpdateFailed value)? updateFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Updating value)? updating,
    TResult Function(_UpdateSuccess value)? updateSuccess,
    TResult Function(_UpdateFailed value)? updateFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ActionsControlStateCopyWith<ActionsControlState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionsControlStateCopyWith<$Res> {
  factory $ActionsControlStateCopyWith(
          ActionsControlState value, $Res Function(ActionsControlState) then) =
      _$ActionsControlStateCopyWithImpl<$Res, ActionsControlState>;
  @useResult
  $Res call({ActionsState actionsState});

  $ActionsStateCopyWith<$Res> get actionsState;
}

/// @nodoc
class _$ActionsControlStateCopyWithImpl<$Res, $Val extends ActionsControlState>
    implements $ActionsControlStateCopyWith<$Res> {
  _$ActionsControlStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actionsState = null,
  }) {
    return _then(_value.copyWith(
      actionsState: null == actionsState
          ? _value.actionsState
          : actionsState // ignore: cast_nullable_to_non_nullable
              as ActionsState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ActionsStateCopyWith<$Res> get actionsState {
    return $ActionsStateCopyWith<$Res>(_value.actionsState, (value) {
      return _then(_value.copyWith(actionsState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_InitCopyWith<$Res>
    implements $ActionsControlStateCopyWith<$Res> {
  factory _$$_InitCopyWith(_$_Init value, $Res Function(_$_Init) then) =
      __$$_InitCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ActionsState actionsState});

  @override
  $ActionsStateCopyWith<$Res> get actionsState;
}

/// @nodoc
class __$$_InitCopyWithImpl<$Res>
    extends _$ActionsControlStateCopyWithImpl<$Res, _$_Init>
    implements _$$_InitCopyWith<$Res> {
  __$$_InitCopyWithImpl(_$_Init _value, $Res Function(_$_Init) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actionsState = null,
  }) {
    return _then(_$_Init(
      null == actionsState
          ? _value.actionsState
          : actionsState // ignore: cast_nullable_to_non_nullable
              as ActionsState,
    ));
  }
}

/// @nodoc

class _$_Init implements _Init {
  _$_Init(this.actionsState);

  @override
  final ActionsState actionsState;

  @override
  String toString() {
    return 'ActionsControlState.init(actionsState: $actionsState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Init &&
            (identical(other.actionsState, actionsState) ||
                other.actionsState == actionsState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, actionsState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitCopyWith<_$_Init> get copyWith =>
      __$$_InitCopyWithImpl<_$_Init>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ActionsState actionsState) init,
    required TResult Function(ActionsState actionsState) updating,
    required TResult Function(ActionsState actionsState) updateSuccess,
    required TResult Function(ActionsState actionsState) updateFailed,
  }) {
    return init(actionsState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ActionsState actionsState)? init,
    TResult? Function(ActionsState actionsState)? updating,
    TResult? Function(ActionsState actionsState)? updateSuccess,
    TResult? Function(ActionsState actionsState)? updateFailed,
  }) {
    return init?.call(actionsState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ActionsState actionsState)? init,
    TResult Function(ActionsState actionsState)? updating,
    TResult Function(ActionsState actionsState)? updateSuccess,
    TResult Function(ActionsState actionsState)? updateFailed,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(actionsState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Updating value) updating,
    required TResult Function(_UpdateSuccess value) updateSuccess,
    required TResult Function(_UpdateFailed value) updateFailed,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Updating value)? updating,
    TResult? Function(_UpdateSuccess value)? updateSuccess,
    TResult? Function(_UpdateFailed value)? updateFailed,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Updating value)? updating,
    TResult Function(_UpdateSuccess value)? updateSuccess,
    TResult Function(_UpdateFailed value)? updateFailed,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements ActionsControlState {
  factory _Init(final ActionsState actionsState) = _$_Init;

  @override
  ActionsState get actionsState;
  @override
  @JsonKey(ignore: true)
  _$$_InitCopyWith<_$_Init> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdatingCopyWith<$Res>
    implements $ActionsControlStateCopyWith<$Res> {
  factory _$$_UpdatingCopyWith(
          _$_Updating value, $Res Function(_$_Updating) then) =
      __$$_UpdatingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ActionsState actionsState});

  @override
  $ActionsStateCopyWith<$Res> get actionsState;
}

/// @nodoc
class __$$_UpdatingCopyWithImpl<$Res>
    extends _$ActionsControlStateCopyWithImpl<$Res, _$_Updating>
    implements _$$_UpdatingCopyWith<$Res> {
  __$$_UpdatingCopyWithImpl(
      _$_Updating _value, $Res Function(_$_Updating) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actionsState = null,
  }) {
    return _then(_$_Updating(
      null == actionsState
          ? _value.actionsState
          : actionsState // ignore: cast_nullable_to_non_nullable
              as ActionsState,
    ));
  }
}

/// @nodoc

class _$_Updating implements _Updating {
  _$_Updating(this.actionsState);

  @override
  final ActionsState actionsState;

  @override
  String toString() {
    return 'ActionsControlState.updating(actionsState: $actionsState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Updating &&
            (identical(other.actionsState, actionsState) ||
                other.actionsState == actionsState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, actionsState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdatingCopyWith<_$_Updating> get copyWith =>
      __$$_UpdatingCopyWithImpl<_$_Updating>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ActionsState actionsState) init,
    required TResult Function(ActionsState actionsState) updating,
    required TResult Function(ActionsState actionsState) updateSuccess,
    required TResult Function(ActionsState actionsState) updateFailed,
  }) {
    return updating(actionsState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ActionsState actionsState)? init,
    TResult? Function(ActionsState actionsState)? updating,
    TResult? Function(ActionsState actionsState)? updateSuccess,
    TResult? Function(ActionsState actionsState)? updateFailed,
  }) {
    return updating?.call(actionsState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ActionsState actionsState)? init,
    TResult Function(ActionsState actionsState)? updating,
    TResult Function(ActionsState actionsState)? updateSuccess,
    TResult Function(ActionsState actionsState)? updateFailed,
    required TResult orElse(),
  }) {
    if (updating != null) {
      return updating(actionsState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Updating value) updating,
    required TResult Function(_UpdateSuccess value) updateSuccess,
    required TResult Function(_UpdateFailed value) updateFailed,
  }) {
    return updating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Updating value)? updating,
    TResult? Function(_UpdateSuccess value)? updateSuccess,
    TResult? Function(_UpdateFailed value)? updateFailed,
  }) {
    return updating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Updating value)? updating,
    TResult Function(_UpdateSuccess value)? updateSuccess,
    TResult Function(_UpdateFailed value)? updateFailed,
    required TResult orElse(),
  }) {
    if (updating != null) {
      return updating(this);
    }
    return orElse();
  }
}

abstract class _Updating implements ActionsControlState {
  factory _Updating(final ActionsState actionsState) = _$_Updating;

  @override
  ActionsState get actionsState;
  @override
  @JsonKey(ignore: true)
  _$$_UpdatingCopyWith<_$_Updating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateSuccessCopyWith<$Res>
    implements $ActionsControlStateCopyWith<$Res> {
  factory _$$_UpdateSuccessCopyWith(
          _$_UpdateSuccess value, $Res Function(_$_UpdateSuccess) then) =
      __$$_UpdateSuccessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ActionsState actionsState});

  @override
  $ActionsStateCopyWith<$Res> get actionsState;
}

/// @nodoc
class __$$_UpdateSuccessCopyWithImpl<$Res>
    extends _$ActionsControlStateCopyWithImpl<$Res, _$_UpdateSuccess>
    implements _$$_UpdateSuccessCopyWith<$Res> {
  __$$_UpdateSuccessCopyWithImpl(
      _$_UpdateSuccess _value, $Res Function(_$_UpdateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actionsState = null,
  }) {
    return _then(_$_UpdateSuccess(
      null == actionsState
          ? _value.actionsState
          : actionsState // ignore: cast_nullable_to_non_nullable
              as ActionsState,
    ));
  }
}

/// @nodoc

class _$_UpdateSuccess implements _UpdateSuccess {
  _$_UpdateSuccess(this.actionsState);

  @override
  final ActionsState actionsState;

  @override
  String toString() {
    return 'ActionsControlState.updateSuccess(actionsState: $actionsState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateSuccess &&
            (identical(other.actionsState, actionsState) ||
                other.actionsState == actionsState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, actionsState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateSuccessCopyWith<_$_UpdateSuccess> get copyWith =>
      __$$_UpdateSuccessCopyWithImpl<_$_UpdateSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ActionsState actionsState) init,
    required TResult Function(ActionsState actionsState) updating,
    required TResult Function(ActionsState actionsState) updateSuccess,
    required TResult Function(ActionsState actionsState) updateFailed,
  }) {
    return updateSuccess(actionsState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ActionsState actionsState)? init,
    TResult? Function(ActionsState actionsState)? updating,
    TResult? Function(ActionsState actionsState)? updateSuccess,
    TResult? Function(ActionsState actionsState)? updateFailed,
  }) {
    return updateSuccess?.call(actionsState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ActionsState actionsState)? init,
    TResult Function(ActionsState actionsState)? updating,
    TResult Function(ActionsState actionsState)? updateSuccess,
    TResult Function(ActionsState actionsState)? updateFailed,
    required TResult orElse(),
  }) {
    if (updateSuccess != null) {
      return updateSuccess(actionsState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Updating value) updating,
    required TResult Function(_UpdateSuccess value) updateSuccess,
    required TResult Function(_UpdateFailed value) updateFailed,
  }) {
    return updateSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Updating value)? updating,
    TResult? Function(_UpdateSuccess value)? updateSuccess,
    TResult? Function(_UpdateFailed value)? updateFailed,
  }) {
    return updateSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Updating value)? updating,
    TResult Function(_UpdateSuccess value)? updateSuccess,
    TResult Function(_UpdateFailed value)? updateFailed,
    required TResult orElse(),
  }) {
    if (updateSuccess != null) {
      return updateSuccess(this);
    }
    return orElse();
  }
}

abstract class _UpdateSuccess implements ActionsControlState {
  factory _UpdateSuccess(final ActionsState actionsState) = _$_UpdateSuccess;

  @override
  ActionsState get actionsState;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateSuccessCopyWith<_$_UpdateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateFailedCopyWith<$Res>
    implements $ActionsControlStateCopyWith<$Res> {
  factory _$$_UpdateFailedCopyWith(
          _$_UpdateFailed value, $Res Function(_$_UpdateFailed) then) =
      __$$_UpdateFailedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ActionsState actionsState});

  @override
  $ActionsStateCopyWith<$Res> get actionsState;
}

/// @nodoc
class __$$_UpdateFailedCopyWithImpl<$Res>
    extends _$ActionsControlStateCopyWithImpl<$Res, _$_UpdateFailed>
    implements _$$_UpdateFailedCopyWith<$Res> {
  __$$_UpdateFailedCopyWithImpl(
      _$_UpdateFailed _value, $Res Function(_$_UpdateFailed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actionsState = null,
  }) {
    return _then(_$_UpdateFailed(
      null == actionsState
          ? _value.actionsState
          : actionsState // ignore: cast_nullable_to_non_nullable
              as ActionsState,
    ));
  }
}

/// @nodoc

class _$_UpdateFailed implements _UpdateFailed {
  _$_UpdateFailed(this.actionsState);

  @override
  final ActionsState actionsState;

  @override
  String toString() {
    return 'ActionsControlState.updateFailed(actionsState: $actionsState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateFailed &&
            (identical(other.actionsState, actionsState) ||
                other.actionsState == actionsState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, actionsState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateFailedCopyWith<_$_UpdateFailed> get copyWith =>
      __$$_UpdateFailedCopyWithImpl<_$_UpdateFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ActionsState actionsState) init,
    required TResult Function(ActionsState actionsState) updating,
    required TResult Function(ActionsState actionsState) updateSuccess,
    required TResult Function(ActionsState actionsState) updateFailed,
  }) {
    return updateFailed(actionsState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ActionsState actionsState)? init,
    TResult? Function(ActionsState actionsState)? updating,
    TResult? Function(ActionsState actionsState)? updateSuccess,
    TResult? Function(ActionsState actionsState)? updateFailed,
  }) {
    return updateFailed?.call(actionsState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ActionsState actionsState)? init,
    TResult Function(ActionsState actionsState)? updating,
    TResult Function(ActionsState actionsState)? updateSuccess,
    TResult Function(ActionsState actionsState)? updateFailed,
    required TResult orElse(),
  }) {
    if (updateFailed != null) {
      return updateFailed(actionsState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Updating value) updating,
    required TResult Function(_UpdateSuccess value) updateSuccess,
    required TResult Function(_UpdateFailed value) updateFailed,
  }) {
    return updateFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Updating value)? updating,
    TResult? Function(_UpdateSuccess value)? updateSuccess,
    TResult? Function(_UpdateFailed value)? updateFailed,
  }) {
    return updateFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Updating value)? updating,
    TResult Function(_UpdateSuccess value)? updateSuccess,
    TResult Function(_UpdateFailed value)? updateFailed,
    required TResult orElse(),
  }) {
    if (updateFailed != null) {
      return updateFailed(this);
    }
    return orElse();
  }
}

abstract class _UpdateFailed implements ActionsControlState {
  factory _UpdateFailed(final ActionsState actionsState) = _$_UpdateFailed;

  @override
  ActionsState get actionsState;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateFailedCopyWith<_$_UpdateFailed> get copyWith =>
      throw _privateConstructorUsedError;
}
