// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'props_control_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PropsControlState {
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
abstract class $PropsControlStateCopyWith<$Res> {
  factory $PropsControlStateCopyWith(
          PropsControlState value, $Res Function(PropsControlState) then) =
      _$PropsControlStateCopyWithImpl<$Res, PropsControlState>;
}

/// @nodoc
class _$PropsControlStateCopyWithImpl<$Res, $Val extends PropsControlState>
    implements $PropsControlStateCopyWith<$Res> {
  _$PropsControlStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitImplCopyWith<$Res> {
  factory _$$InitImplCopyWith(
          _$InitImpl value, $Res Function(_$InitImpl) then) =
      __$$InitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$PropsControlStateCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl extends _Init {
  const _$InitImpl() : super._();

  @override
  String toString() {
    return 'PropsControlState.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitImpl);
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

abstract class _Init extends PropsControlState {
  const factory _Init() = _$InitImpl;
  const _Init._() : super._();
}

/// @nodoc
abstract class _$$UpdatingImplCopyWith<$Res> {
  factory _$$UpdatingImplCopyWith(
          _$UpdatingImpl value, $Res Function(_$UpdatingImpl) then) =
      __$$UpdatingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ControlProp> props});
}

/// @nodoc
class __$$UpdatingImplCopyWithImpl<$Res>
    extends _$PropsControlStateCopyWithImpl<$Res, _$UpdatingImpl>
    implements _$$UpdatingImplCopyWith<$Res> {
  __$$UpdatingImplCopyWithImpl(
      _$UpdatingImpl _value, $Res Function(_$UpdatingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? props = null,
  }) {
    return _then(_$UpdatingImpl(
      null == props
          ? _value._props
          : props // ignore: cast_nullable_to_non_nullable
              as List<ControlProp>,
    ));
  }
}

/// @nodoc

class _$UpdatingImpl extends _Updating {
  const _$UpdatingImpl(final List<ControlProp> props)
      : _props = props,
        super._();

  final List<ControlProp> _props;
  @override
  List<ControlProp> get props {
    if (_props is EqualUnmodifiableListView) return _props;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_props);
  }

  @override
  String toString() {
    return 'PropsControlState.updating(props: $props)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatingImpl &&
            const DeepCollectionEquality().equals(other._props, _props));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_props));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatingImplCopyWith<_$UpdatingImpl> get copyWith =>
      __$$UpdatingImplCopyWithImpl<_$UpdatingImpl>(this, _$identity);

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

abstract class _Updating extends PropsControlState {
  const factory _Updating(final List<ControlProp> props) = _$UpdatingImpl;
  const _Updating._() : super._();

  List<ControlProp> get props;
  @JsonKey(ignore: true)
  _$$UpdatingImplCopyWith<_$UpdatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateSuccessImplCopyWith<$Res> {
  factory _$$UpdateSuccessImplCopyWith(
          _$UpdateSuccessImpl value, $Res Function(_$UpdateSuccessImpl) then) =
      __$$UpdateSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ControlProp> props});
}

/// @nodoc
class __$$UpdateSuccessImplCopyWithImpl<$Res>
    extends _$PropsControlStateCopyWithImpl<$Res, _$UpdateSuccessImpl>
    implements _$$UpdateSuccessImplCopyWith<$Res> {
  __$$UpdateSuccessImplCopyWithImpl(
      _$UpdateSuccessImpl _value, $Res Function(_$UpdateSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? props = null,
  }) {
    return _then(_$UpdateSuccessImpl(
      null == props
          ? _value._props
          : props // ignore: cast_nullable_to_non_nullable
              as List<ControlProp>,
    ));
  }
}

/// @nodoc

class _$UpdateSuccessImpl extends _UpdateSuccess {
  const _$UpdateSuccessImpl(final List<ControlProp> props)
      : _props = props,
        super._();

  final List<ControlProp> _props;
  @override
  List<ControlProp> get props {
    if (_props is EqualUnmodifiableListView) return _props;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_props);
  }

  @override
  String toString() {
    return 'PropsControlState.updateSuccess(props: $props)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSuccessImpl &&
            const DeepCollectionEquality().equals(other._props, _props));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_props));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSuccessImplCopyWith<_$UpdateSuccessImpl> get copyWith =>
      __$$UpdateSuccessImplCopyWithImpl<_$UpdateSuccessImpl>(this, _$identity);

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

abstract class _UpdateSuccess extends PropsControlState {
  const factory _UpdateSuccess(final List<ControlProp> props) =
      _$UpdateSuccessImpl;
  const _UpdateSuccess._() : super._();

  List<ControlProp> get props;
  @JsonKey(ignore: true)
  _$$UpdateSuccessImplCopyWith<_$UpdateSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateFailedImplCopyWith<$Res> {
  factory _$$UpdateFailedImplCopyWith(
          _$UpdateFailedImpl value, $Res Function(_$UpdateFailedImpl) then) =
      __$$UpdateFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ControlProp> props});
}

/// @nodoc
class __$$UpdateFailedImplCopyWithImpl<$Res>
    extends _$PropsControlStateCopyWithImpl<$Res, _$UpdateFailedImpl>
    implements _$$UpdateFailedImplCopyWith<$Res> {
  __$$UpdateFailedImplCopyWithImpl(
      _$UpdateFailedImpl _value, $Res Function(_$UpdateFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? props = null,
  }) {
    return _then(_$UpdateFailedImpl(
      null == props
          ? _value._props
          : props // ignore: cast_nullable_to_non_nullable
              as List<ControlProp>,
    ));
  }
}

/// @nodoc

class _$UpdateFailedImpl extends _UpdateFailed {
  const _$UpdateFailedImpl(final List<ControlProp> props)
      : _props = props,
        super._();

  final List<ControlProp> _props;
  @override
  List<ControlProp> get props {
    if (_props is EqualUnmodifiableListView) return _props;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_props);
  }

  @override
  String toString() {
    return 'PropsControlState.updateFailed(props: $props)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateFailedImpl &&
            const DeepCollectionEquality().equals(other._props, _props));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_props));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateFailedImplCopyWith<_$UpdateFailedImpl> get copyWith =>
      __$$UpdateFailedImplCopyWithImpl<_$UpdateFailedImpl>(this, _$identity);

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

abstract class _UpdateFailed extends PropsControlState {
  const factory _UpdateFailed(final List<ControlProp> props) =
      _$UpdateFailedImpl;
  const _UpdateFailed._() : super._();

  List<ControlProp> get props;
  @JsonKey(ignore: true)
  _$$UpdateFailedImplCopyWith<_$UpdateFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
