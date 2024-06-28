// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'actions_control_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ActionsState {
  bool get isRecording => throw _privateConstructorUsedError;
  AutoFocusMode get focusMode => throw _privateConstructorUsedError;

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
  $Res call({bool isRecording, AutoFocusMode focusMode});
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
    Object? focusMode = null,
  }) {
    return _then(_value.copyWith(
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      focusMode: null == focusMode
          ? _value.focusMode
          : focusMode // ignore: cast_nullable_to_non_nullable
              as AutoFocusMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActionsStateImplCopyWith<$Res>
    implements $ActionsStateCopyWith<$Res> {
  factory _$$ActionsStateImplCopyWith(
          _$ActionsStateImpl value, $Res Function(_$ActionsStateImpl) then) =
      __$$ActionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isRecording, AutoFocusMode focusMode});
}

/// @nodoc
class __$$ActionsStateImplCopyWithImpl<$Res>
    extends _$ActionsStateCopyWithImpl<$Res, _$ActionsStateImpl>
    implements _$$ActionsStateImplCopyWith<$Res> {
  __$$ActionsStateImplCopyWithImpl(
      _$ActionsStateImpl _value, $Res Function(_$ActionsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRecording = null,
    Object? focusMode = null,
  }) {
    return _then(_$ActionsStateImpl(
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      focusMode: null == focusMode
          ? _value.focusMode
          : focusMode // ignore: cast_nullable_to_non_nullable
              as AutoFocusMode,
    ));
  }
}

/// @nodoc

class _$ActionsStateImpl implements _ActionsState {
  _$ActionsStateImpl({required this.isRecording, required this.focusMode});

  @override
  final bool isRecording;
  @override
  final AutoFocusMode focusMode;

  @override
  String toString() {
    return 'ActionsState(isRecording: $isRecording, focusMode: $focusMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionsStateImpl &&
            (identical(other.isRecording, isRecording) ||
                other.isRecording == isRecording) &&
            (identical(other.focusMode, focusMode) ||
                other.focusMode == focusMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isRecording, focusMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionsStateImplCopyWith<_$ActionsStateImpl> get copyWith =>
      __$$ActionsStateImplCopyWithImpl<_$ActionsStateImpl>(this, _$identity);
}

abstract class _ActionsState implements ActionsState {
  factory _ActionsState(
      {required final bool isRecording,
      required final AutoFocusMode focusMode}) = _$ActionsStateImpl;

  @override
  bool get isRecording;
  @override
  AutoFocusMode get focusMode;
  @override
  @JsonKey(ignore: true)
  _$$ActionsStateImplCopyWith<_$ActionsStateImpl> get copyWith =>
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
abstract class _$$InitImplCopyWith<$Res>
    implements $ActionsControlStateCopyWith<$Res> {
  factory _$$InitImplCopyWith(
          _$InitImpl value, $Res Function(_$InitImpl) then) =
      __$$InitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ActionsState actionsState});

  @override
  $ActionsStateCopyWith<$Res> get actionsState;
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$ActionsControlStateCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actionsState = null,
  }) {
    return _then(_$InitImpl(
      null == actionsState
          ? _value.actionsState
          : actionsState // ignore: cast_nullable_to_non_nullable
              as ActionsState,
    ));
  }
}

/// @nodoc

class _$InitImpl implements _Init {
  _$InitImpl(this.actionsState);

  @override
  final ActionsState actionsState;

  @override
  String toString() {
    return 'ActionsControlState.init(actionsState: $actionsState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitImpl &&
            (identical(other.actionsState, actionsState) ||
                other.actionsState == actionsState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, actionsState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitImplCopyWith<_$InitImpl> get copyWith =>
      __$$InitImplCopyWithImpl<_$InitImpl>(this, _$identity);

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
  factory _Init(final ActionsState actionsState) = _$InitImpl;

  @override
  ActionsState get actionsState;
  @override
  @JsonKey(ignore: true)
  _$$InitImplCopyWith<_$InitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatingImplCopyWith<$Res>
    implements $ActionsControlStateCopyWith<$Res> {
  factory _$$UpdatingImplCopyWith(
          _$UpdatingImpl value, $Res Function(_$UpdatingImpl) then) =
      __$$UpdatingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ActionsState actionsState});

  @override
  $ActionsStateCopyWith<$Res> get actionsState;
}

/// @nodoc
class __$$UpdatingImplCopyWithImpl<$Res>
    extends _$ActionsControlStateCopyWithImpl<$Res, _$UpdatingImpl>
    implements _$$UpdatingImplCopyWith<$Res> {
  __$$UpdatingImplCopyWithImpl(
      _$UpdatingImpl _value, $Res Function(_$UpdatingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actionsState = null,
  }) {
    return _then(_$UpdatingImpl(
      null == actionsState
          ? _value.actionsState
          : actionsState // ignore: cast_nullable_to_non_nullable
              as ActionsState,
    ));
  }
}

/// @nodoc

class _$UpdatingImpl implements _Updating {
  _$UpdatingImpl(this.actionsState);

  @override
  final ActionsState actionsState;

  @override
  String toString() {
    return 'ActionsControlState.updating(actionsState: $actionsState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatingImpl &&
            (identical(other.actionsState, actionsState) ||
                other.actionsState == actionsState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, actionsState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatingImplCopyWith<_$UpdatingImpl> get copyWith =>
      __$$UpdatingImplCopyWithImpl<_$UpdatingImpl>(this, _$identity);

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
  factory _Updating(final ActionsState actionsState) = _$UpdatingImpl;

  @override
  ActionsState get actionsState;
  @override
  @JsonKey(ignore: true)
  _$$UpdatingImplCopyWith<_$UpdatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateSuccessImplCopyWith<$Res>
    implements $ActionsControlStateCopyWith<$Res> {
  factory _$$UpdateSuccessImplCopyWith(
          _$UpdateSuccessImpl value, $Res Function(_$UpdateSuccessImpl) then) =
      __$$UpdateSuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ActionsState actionsState});

  @override
  $ActionsStateCopyWith<$Res> get actionsState;
}

/// @nodoc
class __$$UpdateSuccessImplCopyWithImpl<$Res>
    extends _$ActionsControlStateCopyWithImpl<$Res, _$UpdateSuccessImpl>
    implements _$$UpdateSuccessImplCopyWith<$Res> {
  __$$UpdateSuccessImplCopyWithImpl(
      _$UpdateSuccessImpl _value, $Res Function(_$UpdateSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actionsState = null,
  }) {
    return _then(_$UpdateSuccessImpl(
      null == actionsState
          ? _value.actionsState
          : actionsState // ignore: cast_nullable_to_non_nullable
              as ActionsState,
    ));
  }
}

/// @nodoc

class _$UpdateSuccessImpl implements _UpdateSuccess {
  _$UpdateSuccessImpl(this.actionsState);

  @override
  final ActionsState actionsState;

  @override
  String toString() {
    return 'ActionsControlState.updateSuccess(actionsState: $actionsState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSuccessImpl &&
            (identical(other.actionsState, actionsState) ||
                other.actionsState == actionsState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, actionsState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSuccessImplCopyWith<_$UpdateSuccessImpl> get copyWith =>
      __$$UpdateSuccessImplCopyWithImpl<_$UpdateSuccessImpl>(this, _$identity);

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
  factory _UpdateSuccess(final ActionsState actionsState) = _$UpdateSuccessImpl;

  @override
  ActionsState get actionsState;
  @override
  @JsonKey(ignore: true)
  _$$UpdateSuccessImplCopyWith<_$UpdateSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateFailedImplCopyWith<$Res>
    implements $ActionsControlStateCopyWith<$Res> {
  factory _$$UpdateFailedImplCopyWith(
          _$UpdateFailedImpl value, $Res Function(_$UpdateFailedImpl) then) =
      __$$UpdateFailedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ActionsState actionsState});

  @override
  $ActionsStateCopyWith<$Res> get actionsState;
}

/// @nodoc
class __$$UpdateFailedImplCopyWithImpl<$Res>
    extends _$ActionsControlStateCopyWithImpl<$Res, _$UpdateFailedImpl>
    implements _$$UpdateFailedImplCopyWith<$Res> {
  __$$UpdateFailedImplCopyWithImpl(
      _$UpdateFailedImpl _value, $Res Function(_$UpdateFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actionsState = null,
  }) {
    return _then(_$UpdateFailedImpl(
      null == actionsState
          ? _value.actionsState
          : actionsState // ignore: cast_nullable_to_non_nullable
              as ActionsState,
    ));
  }
}

/// @nodoc

class _$UpdateFailedImpl implements _UpdateFailed {
  _$UpdateFailedImpl(this.actionsState);

  @override
  final ActionsState actionsState;

  @override
  String toString() {
    return 'ActionsControlState.updateFailed(actionsState: $actionsState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateFailedImpl &&
            (identical(other.actionsState, actionsState) ||
                other.actionsState == actionsState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, actionsState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateFailedImplCopyWith<_$UpdateFailedImpl> get copyWith =>
      __$$UpdateFailedImplCopyWithImpl<_$UpdateFailedImpl>(this, _$identity);

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
  factory _UpdateFailed(final ActionsState actionsState) = _$UpdateFailedImpl;

  @override
  ActionsState get actionsState;
  @override
  @JsonKey(ignore: true)
  _$$UpdateFailedImplCopyWith<_$UpdateFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
