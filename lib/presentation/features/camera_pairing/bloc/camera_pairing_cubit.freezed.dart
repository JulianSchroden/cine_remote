// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_pairing_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CameraPairingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DiscoveryHandle discoveryHandle) active,
    required TResult Function(DiscoveryHandle discoveryHandle) inProgress,
    required TResult Function(CameraConnectionHandle cameraHandle) success,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DiscoveryHandle discoveryHandle)? active,
    TResult? Function(DiscoveryHandle discoveryHandle)? inProgress,
    TResult? Function(CameraConnectionHandle cameraHandle)? success,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DiscoveryHandle discoveryHandle)? active,
    TResult Function(DiscoveryHandle discoveryHandle)? inProgress,
    TResult Function(CameraConnectionHandle cameraHandle)? success,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Activ value) active,
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Activ value)? active,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Activ value)? active,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraPairingStateCopyWith<$Res> {
  factory $CameraPairingStateCopyWith(
          CameraPairingState value, $Res Function(CameraPairingState) then) =
      _$CameraPairingStateCopyWithImpl<$Res, CameraPairingState>;
}

/// @nodoc
class _$CameraPairingStateCopyWithImpl<$Res, $Val extends CameraPairingState>
    implements $CameraPairingStateCopyWith<$Res> {
  _$CameraPairingStateCopyWithImpl(this._value, this._then);

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
    extends _$CameraPairingStateCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'CameraPairingState.init()';
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
    required TResult Function(DiscoveryHandle discoveryHandle) active,
    required TResult Function(DiscoveryHandle discoveryHandle) inProgress,
    required TResult Function(CameraConnectionHandle cameraHandle) success,
    required TResult Function() error,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DiscoveryHandle discoveryHandle)? active,
    TResult? Function(DiscoveryHandle discoveryHandle)? inProgress,
    TResult? Function(CameraConnectionHandle cameraHandle)? success,
    TResult? Function()? error,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DiscoveryHandle discoveryHandle)? active,
    TResult Function(DiscoveryHandle discoveryHandle)? inProgress,
    TResult Function(CameraConnectionHandle cameraHandle)? success,
    TResult Function()? error,
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
    required TResult Function(_Activ value) active,
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Activ value)? active,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Activ value)? active,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements CameraPairingState {
  const factory _Init() = _$InitImpl;
}

/// @nodoc
abstract class _$$ActivImplCopyWith<$Res> {
  factory _$$ActivImplCopyWith(
          _$ActivImpl value, $Res Function(_$ActivImpl) then) =
      __$$ActivImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DiscoveryHandle discoveryHandle});
}

/// @nodoc
class __$$ActivImplCopyWithImpl<$Res>
    extends _$CameraPairingStateCopyWithImpl<$Res, _$ActivImpl>
    implements _$$ActivImplCopyWith<$Res> {
  __$$ActivImplCopyWithImpl(
      _$ActivImpl _value, $Res Function(_$ActivImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discoveryHandle = null,
  }) {
    return _then(_$ActivImpl(
      null == discoveryHandle
          ? _value.discoveryHandle
          : discoveryHandle // ignore: cast_nullable_to_non_nullable
              as DiscoveryHandle,
    ));
  }
}

/// @nodoc

class _$ActivImpl implements _Activ {
  const _$ActivImpl(this.discoveryHandle);

  @override
  final DiscoveryHandle discoveryHandle;

  @override
  String toString() {
    return 'CameraPairingState.active(discoveryHandle: $discoveryHandle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivImpl &&
            (identical(other.discoveryHandle, discoveryHandle) ||
                other.discoveryHandle == discoveryHandle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, discoveryHandle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivImplCopyWith<_$ActivImpl> get copyWith =>
      __$$ActivImplCopyWithImpl<_$ActivImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DiscoveryHandle discoveryHandle) active,
    required TResult Function(DiscoveryHandle discoveryHandle) inProgress,
    required TResult Function(CameraConnectionHandle cameraHandle) success,
    required TResult Function() error,
  }) {
    return active(discoveryHandle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DiscoveryHandle discoveryHandle)? active,
    TResult? Function(DiscoveryHandle discoveryHandle)? inProgress,
    TResult? Function(CameraConnectionHandle cameraHandle)? success,
    TResult? Function()? error,
  }) {
    return active?.call(discoveryHandle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DiscoveryHandle discoveryHandle)? active,
    TResult Function(DiscoveryHandle discoveryHandle)? inProgress,
    TResult Function(CameraConnectionHandle cameraHandle)? success,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active(discoveryHandle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Activ value) active,
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return active(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Activ value)? active,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return active?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Activ value)? active,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active(this);
    }
    return orElse();
  }
}

abstract class _Activ implements CameraPairingState {
  const factory _Activ(final DiscoveryHandle discoveryHandle) = _$ActivImpl;

  DiscoveryHandle get discoveryHandle;
  @JsonKey(ignore: true)
  _$$ActivImplCopyWith<_$ActivImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InProgressImplCopyWith<$Res> {
  factory _$$InProgressImplCopyWith(
          _$InProgressImpl value, $Res Function(_$InProgressImpl) then) =
      __$$InProgressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DiscoveryHandle discoveryHandle});
}

/// @nodoc
class __$$InProgressImplCopyWithImpl<$Res>
    extends _$CameraPairingStateCopyWithImpl<$Res, _$InProgressImpl>
    implements _$$InProgressImplCopyWith<$Res> {
  __$$InProgressImplCopyWithImpl(
      _$InProgressImpl _value, $Res Function(_$InProgressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discoveryHandle = null,
  }) {
    return _then(_$InProgressImpl(
      null == discoveryHandle
          ? _value.discoveryHandle
          : discoveryHandle // ignore: cast_nullable_to_non_nullable
              as DiscoveryHandle,
    ));
  }
}

/// @nodoc

class _$InProgressImpl implements _InProgress {
  const _$InProgressImpl(this.discoveryHandle);

  @override
  final DiscoveryHandle discoveryHandle;

  @override
  String toString() {
    return 'CameraPairingState.inProgress(discoveryHandle: $discoveryHandle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InProgressImpl &&
            (identical(other.discoveryHandle, discoveryHandle) ||
                other.discoveryHandle == discoveryHandle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, discoveryHandle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InProgressImplCopyWith<_$InProgressImpl> get copyWith =>
      __$$InProgressImplCopyWithImpl<_$InProgressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DiscoveryHandle discoveryHandle) active,
    required TResult Function(DiscoveryHandle discoveryHandle) inProgress,
    required TResult Function(CameraConnectionHandle cameraHandle) success,
    required TResult Function() error,
  }) {
    return inProgress(discoveryHandle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DiscoveryHandle discoveryHandle)? active,
    TResult? Function(DiscoveryHandle discoveryHandle)? inProgress,
    TResult? Function(CameraConnectionHandle cameraHandle)? success,
    TResult? Function()? error,
  }) {
    return inProgress?.call(discoveryHandle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DiscoveryHandle discoveryHandle)? active,
    TResult Function(DiscoveryHandle discoveryHandle)? inProgress,
    TResult Function(CameraConnectionHandle cameraHandle)? success,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(discoveryHandle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Activ value) active,
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Activ value)? active,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Activ value)? active,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class _InProgress implements CameraPairingState {
  const factory _InProgress(final DiscoveryHandle discoveryHandle) =
      _$InProgressImpl;

  DiscoveryHandle get discoveryHandle;
  @JsonKey(ignore: true)
  _$$InProgressImplCopyWith<_$InProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CameraConnectionHandle cameraHandle});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$CameraPairingStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cameraHandle = null,
  }) {
    return _then(_$SuccessImpl(
      null == cameraHandle
          ? _value.cameraHandle
          : cameraHandle // ignore: cast_nullable_to_non_nullable
              as CameraConnectionHandle,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.cameraHandle);

  @override
  final CameraConnectionHandle cameraHandle;

  @override
  String toString() {
    return 'CameraPairingState.success(cameraHandle: $cameraHandle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.cameraHandle, cameraHandle) ||
                other.cameraHandle == cameraHandle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cameraHandle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DiscoveryHandle discoveryHandle) active,
    required TResult Function(DiscoveryHandle discoveryHandle) inProgress,
    required TResult Function(CameraConnectionHandle cameraHandle) success,
    required TResult Function() error,
  }) {
    return success(cameraHandle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DiscoveryHandle discoveryHandle)? active,
    TResult? Function(DiscoveryHandle discoveryHandle)? inProgress,
    TResult? Function(CameraConnectionHandle cameraHandle)? success,
    TResult? Function()? error,
  }) {
    return success?.call(cameraHandle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DiscoveryHandle discoveryHandle)? active,
    TResult Function(DiscoveryHandle discoveryHandle)? inProgress,
    TResult Function(CameraConnectionHandle cameraHandle)? success,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(cameraHandle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Activ value) active,
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Activ value)? active,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Activ value)? active,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements CameraPairingState {
  const factory _Success(final CameraConnectionHandle cameraHandle) =
      _$SuccessImpl;

  CameraConnectionHandle get cameraHandle;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$CameraPairingStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl();

  @override
  String toString() {
    return 'CameraPairingState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DiscoveryHandle discoveryHandle) active,
    required TResult Function(DiscoveryHandle discoveryHandle) inProgress,
    required TResult Function(CameraConnectionHandle cameraHandle) success,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DiscoveryHandle discoveryHandle)? active,
    TResult? Function(DiscoveryHandle discoveryHandle)? inProgress,
    TResult? Function(CameraConnectionHandle cameraHandle)? success,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DiscoveryHandle discoveryHandle)? active,
    TResult Function(DiscoveryHandle discoveryHandle)? inProgress,
    TResult Function(CameraConnectionHandle cameraHandle)? success,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Activ value) active,
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Activ value)? active,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Activ value)? active,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements CameraPairingState {
  const factory _Error() = _$ErrorImpl;
}
