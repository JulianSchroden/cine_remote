// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'camera_connection_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CameraConnectionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function() connectingFailed,
    required TResult Function(CameraHandle cameraHandle) connectionEstablished,
    required TResult Function(CameraHandle cameraHandle) connectionUpdated,
    required TResult Function() disconnecting,
    required TResult Function() disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function()? connectingFailed,
    TResult? Function(CameraHandle cameraHandle)? connectionEstablished,
    TResult? Function(CameraHandle cameraHandle)? connectionUpdated,
    TResult? Function()? disconnecting,
    TResult? Function()? disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connectingFailed,
    TResult Function(CameraHandle cameraHandle)? connectionEstablished,
    TResult Function(CameraHandle cameraHandle)? connectionUpdated,
    TResult Function()? disconnecting,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitConnection value) connecting,
    required TResult Function(_ConnectingFailed value) connectingFailed,
    required TResult Function(_ConnectionEstablished value)
        connectionEstablished,
    required TResult Function(_ConnectionUpdated value) connectionUpdated,
    required TResult Function(_Disconnecting value) disconnecting,
    required TResult Function(_Disconnected value) disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitConnection value)? connecting,
    TResult? Function(_ConnectingFailed value)? connectingFailed,
    TResult? Function(_ConnectionEstablished value)? connectionEstablished,
    TResult? Function(_ConnectionUpdated value)? connectionUpdated,
    TResult? Function(_Disconnecting value)? disconnecting,
    TResult? Function(_Disconnected value)? disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitConnection value)? connecting,
    TResult Function(_ConnectingFailed value)? connectingFailed,
    TResult Function(_ConnectionEstablished value)? connectionEstablished,
    TResult Function(_ConnectionUpdated value)? connectionUpdated,
    TResult Function(_Disconnecting value)? disconnecting,
    TResult Function(_Disconnected value)? disconnected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraConnectionStateCopyWith<$Res> {
  factory $CameraConnectionStateCopyWith(CameraConnectionState value,
          $Res Function(CameraConnectionState) then) =
      _$CameraConnectionStateCopyWithImpl<$Res, CameraConnectionState>;
}

/// @nodoc
class _$CameraConnectionStateCopyWithImpl<$Res,
        $Val extends CameraConnectionState>
    implements $CameraConnectionStateCopyWith<$Res> {
  _$CameraConnectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitConnectionCopyWith<$Res> {
  factory _$$_InitConnectionCopyWith(
          _$_InitConnection value, $Res Function(_$_InitConnection) then) =
      __$$_InitConnectionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitConnectionCopyWithImpl<$Res>
    extends _$CameraConnectionStateCopyWithImpl<$Res, _$_InitConnection>
    implements _$$_InitConnectionCopyWith<$Res> {
  __$$_InitConnectionCopyWithImpl(
      _$_InitConnection _value, $Res Function(_$_InitConnection) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_InitConnection implements _InitConnection {
  const _$_InitConnection();

  @override
  String toString() {
    return 'CameraConnectionState.connecting()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_InitConnection);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function() connectingFailed,
    required TResult Function(CameraHandle cameraHandle) connectionEstablished,
    required TResult Function(CameraHandle cameraHandle) connectionUpdated,
    required TResult Function() disconnecting,
    required TResult Function() disconnected,
  }) {
    return connecting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function()? connectingFailed,
    TResult? Function(CameraHandle cameraHandle)? connectionEstablished,
    TResult? Function(CameraHandle cameraHandle)? connectionUpdated,
    TResult? Function()? disconnecting,
    TResult? Function()? disconnected,
  }) {
    return connecting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connectingFailed,
    TResult Function(CameraHandle cameraHandle)? connectionEstablished,
    TResult Function(CameraHandle cameraHandle)? connectionUpdated,
    TResult Function()? disconnecting,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitConnection value) connecting,
    required TResult Function(_ConnectingFailed value) connectingFailed,
    required TResult Function(_ConnectionEstablished value)
        connectionEstablished,
    required TResult Function(_ConnectionUpdated value) connectionUpdated,
    required TResult Function(_Disconnecting value) disconnecting,
    required TResult Function(_Disconnected value) disconnected,
  }) {
    return connecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitConnection value)? connecting,
    TResult? Function(_ConnectingFailed value)? connectingFailed,
    TResult? Function(_ConnectionEstablished value)? connectionEstablished,
    TResult? Function(_ConnectionUpdated value)? connectionUpdated,
    TResult? Function(_Disconnecting value)? disconnecting,
    TResult? Function(_Disconnected value)? disconnected,
  }) {
    return connecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitConnection value)? connecting,
    TResult Function(_ConnectingFailed value)? connectingFailed,
    TResult Function(_ConnectionEstablished value)? connectionEstablished,
    TResult Function(_ConnectionUpdated value)? connectionUpdated,
    TResult Function(_Disconnecting value)? disconnecting,
    TResult Function(_Disconnected value)? disconnected,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(this);
    }
    return orElse();
  }
}

abstract class _InitConnection implements CameraConnectionState {
  const factory _InitConnection() = _$_InitConnection;
}

/// @nodoc
abstract class _$$_ConnectingFailedCopyWith<$Res> {
  factory _$$_ConnectingFailedCopyWith(
          _$_ConnectingFailed value, $Res Function(_$_ConnectingFailed) then) =
      __$$_ConnectingFailedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ConnectingFailedCopyWithImpl<$Res>
    extends _$CameraConnectionStateCopyWithImpl<$Res, _$_ConnectingFailed>
    implements _$$_ConnectingFailedCopyWith<$Res> {
  __$$_ConnectingFailedCopyWithImpl(
      _$_ConnectingFailed _value, $Res Function(_$_ConnectingFailed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ConnectingFailed implements _ConnectingFailed {
  const _$_ConnectingFailed();

  @override
  String toString() {
    return 'CameraConnectionState.connectingFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ConnectingFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function() connectingFailed,
    required TResult Function(CameraHandle cameraHandle) connectionEstablished,
    required TResult Function(CameraHandle cameraHandle) connectionUpdated,
    required TResult Function() disconnecting,
    required TResult Function() disconnected,
  }) {
    return connectingFailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function()? connectingFailed,
    TResult? Function(CameraHandle cameraHandle)? connectionEstablished,
    TResult? Function(CameraHandle cameraHandle)? connectionUpdated,
    TResult? Function()? disconnecting,
    TResult? Function()? disconnected,
  }) {
    return connectingFailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connectingFailed,
    TResult Function(CameraHandle cameraHandle)? connectionEstablished,
    TResult Function(CameraHandle cameraHandle)? connectionUpdated,
    TResult Function()? disconnecting,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) {
    if (connectingFailed != null) {
      return connectingFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitConnection value) connecting,
    required TResult Function(_ConnectingFailed value) connectingFailed,
    required TResult Function(_ConnectionEstablished value)
        connectionEstablished,
    required TResult Function(_ConnectionUpdated value) connectionUpdated,
    required TResult Function(_Disconnecting value) disconnecting,
    required TResult Function(_Disconnected value) disconnected,
  }) {
    return connectingFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitConnection value)? connecting,
    TResult? Function(_ConnectingFailed value)? connectingFailed,
    TResult? Function(_ConnectionEstablished value)? connectionEstablished,
    TResult? Function(_ConnectionUpdated value)? connectionUpdated,
    TResult? Function(_Disconnecting value)? disconnecting,
    TResult? Function(_Disconnected value)? disconnected,
  }) {
    return connectingFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitConnection value)? connecting,
    TResult Function(_ConnectingFailed value)? connectingFailed,
    TResult Function(_ConnectionEstablished value)? connectionEstablished,
    TResult Function(_ConnectionUpdated value)? connectionUpdated,
    TResult Function(_Disconnecting value)? disconnecting,
    TResult Function(_Disconnected value)? disconnected,
    required TResult orElse(),
  }) {
    if (connectingFailed != null) {
      return connectingFailed(this);
    }
    return orElse();
  }
}

abstract class _ConnectingFailed implements CameraConnectionState {
  const factory _ConnectingFailed() = _$_ConnectingFailed;
}

/// @nodoc
abstract class _$$_ConnectionEstablishedCopyWith<$Res> {
  factory _$$_ConnectionEstablishedCopyWith(_$_ConnectionEstablished value,
          $Res Function(_$_ConnectionEstablished) then) =
      __$$_ConnectionEstablishedCopyWithImpl<$Res>;
  @useResult
  $Res call({CameraHandle cameraHandle});
}

/// @nodoc
class __$$_ConnectionEstablishedCopyWithImpl<$Res>
    extends _$CameraConnectionStateCopyWithImpl<$Res, _$_ConnectionEstablished>
    implements _$$_ConnectionEstablishedCopyWith<$Res> {
  __$$_ConnectionEstablishedCopyWithImpl(_$_ConnectionEstablished _value,
      $Res Function(_$_ConnectionEstablished) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cameraHandle = null,
  }) {
    return _then(_$_ConnectionEstablished(
      null == cameraHandle
          ? _value.cameraHandle
          : cameraHandle // ignore: cast_nullable_to_non_nullable
              as CameraHandle,
    ));
  }
}

/// @nodoc

class _$_ConnectionEstablished implements _ConnectionEstablished {
  const _$_ConnectionEstablished(this.cameraHandle);

  @override
  final CameraHandle cameraHandle;

  @override
  String toString() {
    return 'CameraConnectionState.connectionEstablished(cameraHandle: $cameraHandle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConnectionEstablished &&
            (identical(other.cameraHandle, cameraHandle) ||
                other.cameraHandle == cameraHandle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cameraHandle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConnectionEstablishedCopyWith<_$_ConnectionEstablished> get copyWith =>
      __$$_ConnectionEstablishedCopyWithImpl<_$_ConnectionEstablished>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function() connectingFailed,
    required TResult Function(CameraHandle cameraHandle) connectionEstablished,
    required TResult Function(CameraHandle cameraHandle) connectionUpdated,
    required TResult Function() disconnecting,
    required TResult Function() disconnected,
  }) {
    return connectionEstablished(cameraHandle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function()? connectingFailed,
    TResult? Function(CameraHandle cameraHandle)? connectionEstablished,
    TResult? Function(CameraHandle cameraHandle)? connectionUpdated,
    TResult? Function()? disconnecting,
    TResult? Function()? disconnected,
  }) {
    return connectionEstablished?.call(cameraHandle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connectingFailed,
    TResult Function(CameraHandle cameraHandle)? connectionEstablished,
    TResult Function(CameraHandle cameraHandle)? connectionUpdated,
    TResult Function()? disconnecting,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) {
    if (connectionEstablished != null) {
      return connectionEstablished(cameraHandle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitConnection value) connecting,
    required TResult Function(_ConnectingFailed value) connectingFailed,
    required TResult Function(_ConnectionEstablished value)
        connectionEstablished,
    required TResult Function(_ConnectionUpdated value) connectionUpdated,
    required TResult Function(_Disconnecting value) disconnecting,
    required TResult Function(_Disconnected value) disconnected,
  }) {
    return connectionEstablished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitConnection value)? connecting,
    TResult? Function(_ConnectingFailed value)? connectingFailed,
    TResult? Function(_ConnectionEstablished value)? connectionEstablished,
    TResult? Function(_ConnectionUpdated value)? connectionUpdated,
    TResult? Function(_Disconnecting value)? disconnecting,
    TResult? Function(_Disconnected value)? disconnected,
  }) {
    return connectionEstablished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitConnection value)? connecting,
    TResult Function(_ConnectingFailed value)? connectingFailed,
    TResult Function(_ConnectionEstablished value)? connectionEstablished,
    TResult Function(_ConnectionUpdated value)? connectionUpdated,
    TResult Function(_Disconnecting value)? disconnecting,
    TResult Function(_Disconnected value)? disconnected,
    required TResult orElse(),
  }) {
    if (connectionEstablished != null) {
      return connectionEstablished(this);
    }
    return orElse();
  }
}

abstract class _ConnectionEstablished implements CameraConnectionState {
  const factory _ConnectionEstablished(final CameraHandle cameraHandle) =
      _$_ConnectionEstablished;

  CameraHandle get cameraHandle;
  @JsonKey(ignore: true)
  _$$_ConnectionEstablishedCopyWith<_$_ConnectionEstablished> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ConnectionUpdatedCopyWith<$Res> {
  factory _$$_ConnectionUpdatedCopyWith(_$_ConnectionUpdated value,
          $Res Function(_$_ConnectionUpdated) then) =
      __$$_ConnectionUpdatedCopyWithImpl<$Res>;
  @useResult
  $Res call({CameraHandle cameraHandle});
}

/// @nodoc
class __$$_ConnectionUpdatedCopyWithImpl<$Res>
    extends _$CameraConnectionStateCopyWithImpl<$Res, _$_ConnectionUpdated>
    implements _$$_ConnectionUpdatedCopyWith<$Res> {
  __$$_ConnectionUpdatedCopyWithImpl(
      _$_ConnectionUpdated _value, $Res Function(_$_ConnectionUpdated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cameraHandle = null,
  }) {
    return _then(_$_ConnectionUpdated(
      null == cameraHandle
          ? _value.cameraHandle
          : cameraHandle // ignore: cast_nullable_to_non_nullable
              as CameraHandle,
    ));
  }
}

/// @nodoc

class _$_ConnectionUpdated implements _ConnectionUpdated {
  const _$_ConnectionUpdated(this.cameraHandle);

  @override
  final CameraHandle cameraHandle;

  @override
  String toString() {
    return 'CameraConnectionState.connectionUpdated(cameraHandle: $cameraHandle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConnectionUpdated &&
            (identical(other.cameraHandle, cameraHandle) ||
                other.cameraHandle == cameraHandle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cameraHandle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConnectionUpdatedCopyWith<_$_ConnectionUpdated> get copyWith =>
      __$$_ConnectionUpdatedCopyWithImpl<_$_ConnectionUpdated>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function() connectingFailed,
    required TResult Function(CameraHandle cameraHandle) connectionEstablished,
    required TResult Function(CameraHandle cameraHandle) connectionUpdated,
    required TResult Function() disconnecting,
    required TResult Function() disconnected,
  }) {
    return connectionUpdated(cameraHandle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function()? connectingFailed,
    TResult? Function(CameraHandle cameraHandle)? connectionEstablished,
    TResult? Function(CameraHandle cameraHandle)? connectionUpdated,
    TResult? Function()? disconnecting,
    TResult? Function()? disconnected,
  }) {
    return connectionUpdated?.call(cameraHandle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connectingFailed,
    TResult Function(CameraHandle cameraHandle)? connectionEstablished,
    TResult Function(CameraHandle cameraHandle)? connectionUpdated,
    TResult Function()? disconnecting,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) {
    if (connectionUpdated != null) {
      return connectionUpdated(cameraHandle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitConnection value) connecting,
    required TResult Function(_ConnectingFailed value) connectingFailed,
    required TResult Function(_ConnectionEstablished value)
        connectionEstablished,
    required TResult Function(_ConnectionUpdated value) connectionUpdated,
    required TResult Function(_Disconnecting value) disconnecting,
    required TResult Function(_Disconnected value) disconnected,
  }) {
    return connectionUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitConnection value)? connecting,
    TResult? Function(_ConnectingFailed value)? connectingFailed,
    TResult? Function(_ConnectionEstablished value)? connectionEstablished,
    TResult? Function(_ConnectionUpdated value)? connectionUpdated,
    TResult? Function(_Disconnecting value)? disconnecting,
    TResult? Function(_Disconnected value)? disconnected,
  }) {
    return connectionUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitConnection value)? connecting,
    TResult Function(_ConnectingFailed value)? connectingFailed,
    TResult Function(_ConnectionEstablished value)? connectionEstablished,
    TResult Function(_ConnectionUpdated value)? connectionUpdated,
    TResult Function(_Disconnecting value)? disconnecting,
    TResult Function(_Disconnected value)? disconnected,
    required TResult orElse(),
  }) {
    if (connectionUpdated != null) {
      return connectionUpdated(this);
    }
    return orElse();
  }
}

abstract class _ConnectionUpdated implements CameraConnectionState {
  const factory _ConnectionUpdated(final CameraHandle cameraHandle) =
      _$_ConnectionUpdated;

  CameraHandle get cameraHandle;
  @JsonKey(ignore: true)
  _$$_ConnectionUpdatedCopyWith<_$_ConnectionUpdated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DisconnectingCopyWith<$Res> {
  factory _$$_DisconnectingCopyWith(
          _$_Disconnecting value, $Res Function(_$_Disconnecting) then) =
      __$$_DisconnectingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DisconnectingCopyWithImpl<$Res>
    extends _$CameraConnectionStateCopyWithImpl<$Res, _$_Disconnecting>
    implements _$$_DisconnectingCopyWith<$Res> {
  __$$_DisconnectingCopyWithImpl(
      _$_Disconnecting _value, $Res Function(_$_Disconnecting) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Disconnecting implements _Disconnecting {
  const _$_Disconnecting();

  @override
  String toString() {
    return 'CameraConnectionState.disconnecting()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Disconnecting);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function() connectingFailed,
    required TResult Function(CameraHandle cameraHandle) connectionEstablished,
    required TResult Function(CameraHandle cameraHandle) connectionUpdated,
    required TResult Function() disconnecting,
    required TResult Function() disconnected,
  }) {
    return disconnecting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function()? connectingFailed,
    TResult? Function(CameraHandle cameraHandle)? connectionEstablished,
    TResult? Function(CameraHandle cameraHandle)? connectionUpdated,
    TResult? Function()? disconnecting,
    TResult? Function()? disconnected,
  }) {
    return disconnecting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connectingFailed,
    TResult Function(CameraHandle cameraHandle)? connectionEstablished,
    TResult Function(CameraHandle cameraHandle)? connectionUpdated,
    TResult Function()? disconnecting,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) {
    if (disconnecting != null) {
      return disconnecting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitConnection value) connecting,
    required TResult Function(_ConnectingFailed value) connectingFailed,
    required TResult Function(_ConnectionEstablished value)
        connectionEstablished,
    required TResult Function(_ConnectionUpdated value) connectionUpdated,
    required TResult Function(_Disconnecting value) disconnecting,
    required TResult Function(_Disconnected value) disconnected,
  }) {
    return disconnecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitConnection value)? connecting,
    TResult? Function(_ConnectingFailed value)? connectingFailed,
    TResult? Function(_ConnectionEstablished value)? connectionEstablished,
    TResult? Function(_ConnectionUpdated value)? connectionUpdated,
    TResult? Function(_Disconnecting value)? disconnecting,
    TResult? Function(_Disconnected value)? disconnected,
  }) {
    return disconnecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitConnection value)? connecting,
    TResult Function(_ConnectingFailed value)? connectingFailed,
    TResult Function(_ConnectionEstablished value)? connectionEstablished,
    TResult Function(_ConnectionUpdated value)? connectionUpdated,
    TResult Function(_Disconnecting value)? disconnecting,
    TResult Function(_Disconnected value)? disconnected,
    required TResult orElse(),
  }) {
    if (disconnecting != null) {
      return disconnecting(this);
    }
    return orElse();
  }
}

abstract class _Disconnecting implements CameraConnectionState {
  const factory _Disconnecting() = _$_Disconnecting;
}

/// @nodoc
abstract class _$$_DisconnectedCopyWith<$Res> {
  factory _$$_DisconnectedCopyWith(
          _$_Disconnected value, $Res Function(_$_Disconnected) then) =
      __$$_DisconnectedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DisconnectedCopyWithImpl<$Res>
    extends _$CameraConnectionStateCopyWithImpl<$Res, _$_Disconnected>
    implements _$$_DisconnectedCopyWith<$Res> {
  __$$_DisconnectedCopyWithImpl(
      _$_Disconnected _value, $Res Function(_$_Disconnected) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Disconnected implements _Disconnected {
  const _$_Disconnected();

  @override
  String toString() {
    return 'CameraConnectionState.disconnected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Disconnected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function() connectingFailed,
    required TResult Function(CameraHandle cameraHandle) connectionEstablished,
    required TResult Function(CameraHandle cameraHandle) connectionUpdated,
    required TResult Function() disconnecting,
    required TResult Function() disconnected,
  }) {
    return disconnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function()? connectingFailed,
    TResult? Function(CameraHandle cameraHandle)? connectionEstablished,
    TResult? Function(CameraHandle cameraHandle)? connectionUpdated,
    TResult? Function()? disconnecting,
    TResult? Function()? disconnected,
  }) {
    return disconnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connectingFailed,
    TResult Function(CameraHandle cameraHandle)? connectionEstablished,
    TResult Function(CameraHandle cameraHandle)? connectionUpdated,
    TResult Function()? disconnecting,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitConnection value) connecting,
    required TResult Function(_ConnectingFailed value) connectingFailed,
    required TResult Function(_ConnectionEstablished value)
        connectionEstablished,
    required TResult Function(_ConnectionUpdated value) connectionUpdated,
    required TResult Function(_Disconnecting value) disconnecting,
    required TResult Function(_Disconnected value) disconnected,
  }) {
    return disconnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitConnection value)? connecting,
    TResult? Function(_ConnectingFailed value)? connectingFailed,
    TResult? Function(_ConnectionEstablished value)? connectionEstablished,
    TResult? Function(_ConnectionUpdated value)? connectionUpdated,
    TResult? Function(_Disconnecting value)? disconnecting,
    TResult? Function(_Disconnected value)? disconnected,
  }) {
    return disconnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitConnection value)? connecting,
    TResult Function(_ConnectingFailed value)? connectingFailed,
    TResult Function(_ConnectionEstablished value)? connectionEstablished,
    TResult Function(_ConnectionUpdated value)? connectionUpdated,
    TResult Function(_Disconnecting value)? disconnecting,
    TResult Function(_Disconnected value)? disconnected,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected(this);
    }
    return orElse();
  }
}

abstract class _Disconnected implements CameraConnectionState {
  const factory _Disconnected() = _$_Disconnected;
}
