// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'control_props_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ControlPropsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<ControlProp> props) updating,
    required TResult Function(List<ControlProp> props) updateSuccess,
    required TResult Function(List<ControlProp> props) updateFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(List<ControlProp> props)? updating,
    TResult? Function(List<ControlProp> props)? updateSuccess,
    TResult? Function(List<ControlProp> props)? updateFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<ControlProp> props)? updating,
    TResult Function(List<ControlProp> props)? updateSuccess,
    TResult Function(List<ControlProp> props)? updateFailed,
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
}

/// @nodoc
abstract class $ControlPropsStateCopyWith<$Res> {
  factory $ControlPropsStateCopyWith(
          ControlPropsState value, $Res Function(ControlPropsState) then) =
      _$ControlPropsStateCopyWithImpl<$Res, ControlPropsState>;
}

/// @nodoc
class _$ControlPropsStateCopyWithImpl<$Res, $Val extends ControlPropsState>
    implements $ControlPropsStateCopyWith<$Res> {
  _$ControlPropsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitCopyWith<$Res> {
  factory _$$_InitCopyWith(_$_Init value, $Res Function(_$_Init) then) =
      __$$_InitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitCopyWithImpl<$Res>
    extends _$ControlPropsStateCopyWithImpl<$Res, _$_Init>
    implements _$$_InitCopyWith<$Res> {
  __$$_InitCopyWithImpl(_$_Init _value, $Res Function(_$_Init) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Init implements _Init {
  const _$_Init();

  @override
  String toString() {
    return 'ControlPropsState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Init);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<ControlProp> props) updating,
    required TResult Function(List<ControlProp> props) updateSuccess,
    required TResult Function(List<ControlProp> props) updateFailed,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(List<ControlProp> props)? updating,
    TResult? Function(List<ControlProp> props)? updateSuccess,
    TResult? Function(List<ControlProp> props)? updateFailed,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<ControlProp> props)? updating,
    TResult Function(List<ControlProp> props)? updateSuccess,
    TResult Function(List<ControlProp> props)? updateFailed,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
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

abstract class _Init implements ControlPropsState {
  const factory _Init() = _$_Init;
}

/// @nodoc
abstract class _$$_UpdatingCopyWith<$Res> {
  factory _$$_UpdatingCopyWith(
          _$_Updating value, $Res Function(_$_Updating) then) =
      __$$_UpdatingCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ControlProp> props});
}

/// @nodoc
class __$$_UpdatingCopyWithImpl<$Res>
    extends _$ControlPropsStateCopyWithImpl<$Res, _$_Updating>
    implements _$$_UpdatingCopyWith<$Res> {
  __$$_UpdatingCopyWithImpl(
      _$_Updating _value, $Res Function(_$_Updating) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? props = null,
  }) {
    return _then(_$_Updating(
      null == props
          ? _value.props
          : props // ignore: cast_nullable_to_non_nullable
              as List<ControlProp>,
    ));
  }
}

/// @nodoc

class _$_Updating implements _Updating {
  const _$_Updating(this.props);

  @override
  final List<ControlProp> props;

  @override
  String toString() {
    return 'ControlPropsState.updating(props: $props)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Updating &&
            const DeepCollectionEquality().equals(other.props, props));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(props));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdatingCopyWith<_$_Updating> get copyWith =>
      __$$_UpdatingCopyWithImpl<_$_Updating>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<ControlProp> props) updating,
    required TResult Function(List<ControlProp> props) updateSuccess,
    required TResult Function(List<ControlProp> props) updateFailed,
  }) {
    return updating(props);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(List<ControlProp> props)? updating,
    TResult? Function(List<ControlProp> props)? updateSuccess,
    TResult? Function(List<ControlProp> props)? updateFailed,
  }) {
    return updating?.call(props);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<ControlProp> props)? updating,
    TResult Function(List<ControlProp> props)? updateSuccess,
    TResult Function(List<ControlProp> props)? updateFailed,
    required TResult orElse(),
  }) {
    if (updating != null) {
      return updating(props);
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

abstract class _Updating implements ControlPropsState {
  const factory _Updating(final List<ControlProp> props) = _$_Updating;

  List<ControlProp> get props;
  @JsonKey(ignore: true)
  _$$_UpdatingCopyWith<_$_Updating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateSuccessCopyWith<$Res> {
  factory _$$_UpdateSuccessCopyWith(
          _$_UpdateSuccess value, $Res Function(_$_UpdateSuccess) then) =
      __$$_UpdateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ControlProp> props});
}

/// @nodoc
class __$$_UpdateSuccessCopyWithImpl<$Res>
    extends _$ControlPropsStateCopyWithImpl<$Res, _$_UpdateSuccess>
    implements _$$_UpdateSuccessCopyWith<$Res> {
  __$$_UpdateSuccessCopyWithImpl(
      _$_UpdateSuccess _value, $Res Function(_$_UpdateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? props = null,
  }) {
    return _then(_$_UpdateSuccess(
      null == props
          ? _value.props
          : props // ignore: cast_nullable_to_non_nullable
              as List<ControlProp>,
    ));
  }
}

/// @nodoc

class _$_UpdateSuccess implements _UpdateSuccess {
  const _$_UpdateSuccess(this.props);

  @override
  final List<ControlProp> props;

  @override
  String toString() {
    return 'ControlPropsState.updateSuccess(props: $props)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateSuccess &&
            const DeepCollectionEquality().equals(other.props, props));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(props));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateSuccessCopyWith<_$_UpdateSuccess> get copyWith =>
      __$$_UpdateSuccessCopyWithImpl<_$_UpdateSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<ControlProp> props) updating,
    required TResult Function(List<ControlProp> props) updateSuccess,
    required TResult Function(List<ControlProp> props) updateFailed,
  }) {
    return updateSuccess(props);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(List<ControlProp> props)? updating,
    TResult? Function(List<ControlProp> props)? updateSuccess,
    TResult? Function(List<ControlProp> props)? updateFailed,
  }) {
    return updateSuccess?.call(props);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<ControlProp> props)? updating,
    TResult Function(List<ControlProp> props)? updateSuccess,
    TResult Function(List<ControlProp> props)? updateFailed,
    required TResult orElse(),
  }) {
    if (updateSuccess != null) {
      return updateSuccess(props);
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

abstract class _UpdateSuccess implements ControlPropsState {
  const factory _UpdateSuccess(final List<ControlProp> props) =
      _$_UpdateSuccess;

  List<ControlProp> get props;
  @JsonKey(ignore: true)
  _$$_UpdateSuccessCopyWith<_$_UpdateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateFailedCopyWith<$Res> {
  factory _$$_UpdateFailedCopyWith(
          _$_UpdateFailed value, $Res Function(_$_UpdateFailed) then) =
      __$$_UpdateFailedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ControlProp> props});
}

/// @nodoc
class __$$_UpdateFailedCopyWithImpl<$Res>
    extends _$ControlPropsStateCopyWithImpl<$Res, _$_UpdateFailed>
    implements _$$_UpdateFailedCopyWith<$Res> {
  __$$_UpdateFailedCopyWithImpl(
      _$_UpdateFailed _value, $Res Function(_$_UpdateFailed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? props = null,
  }) {
    return _then(_$_UpdateFailed(
      null == props
          ? _value.props
          : props // ignore: cast_nullable_to_non_nullable
              as List<ControlProp>,
    ));
  }
}

/// @nodoc

class _$_UpdateFailed implements _UpdateFailed {
  const _$_UpdateFailed(this.props);

  @override
  final List<ControlProp> props;

  @override
  String toString() {
    return 'ControlPropsState.updateFailed(props: $props)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateFailed &&
            const DeepCollectionEquality().equals(other.props, props));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(props));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateFailedCopyWith<_$_UpdateFailed> get copyWith =>
      __$$_UpdateFailedCopyWithImpl<_$_UpdateFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<ControlProp> props) updating,
    required TResult Function(List<ControlProp> props) updateSuccess,
    required TResult Function(List<ControlProp> props) updateFailed,
  }) {
    return updateFailed(props);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(List<ControlProp> props)? updating,
    TResult? Function(List<ControlProp> props)? updateSuccess,
    TResult? Function(List<ControlProp> props)? updateFailed,
  }) {
    return updateFailed?.call(props);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<ControlProp> props)? updating,
    TResult Function(List<ControlProp> props)? updateSuccess,
    TResult Function(List<ControlProp> props)? updateFailed,
    required TResult orElse(),
  }) {
    if (updateFailed != null) {
      return updateFailed(props);
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

abstract class _UpdateFailed implements ControlPropsState {
  const factory _UpdateFailed(final List<ControlProp> props) = _$_UpdateFailed;

  List<ControlProp> get props;
  @JsonKey(ignore: true)
  _$$_UpdateFailedCopyWith<_$_UpdateFailed> get copyWith =>
      throw _privateConstructorUsedError;
}
