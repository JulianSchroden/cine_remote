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
    required TResult Function() initConnection,
    required TResult Function(CameraHandle cameraHandle) connectSuccess,
    required TResult Function() connectFailed,
    required TResult Function() disconnecting,
    required TResult Function() disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initConnection,
    TResult? Function(CameraHandle cameraHandle)? connectSuccess,
    TResult? Function()? connectFailed,
    TResult? Function()? disconnecting,
    TResult? Function()? disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initConnection,
    TResult Function(CameraHandle cameraHandle)? connectSuccess,
    TResult Function()? connectFailed,
    TResult Function()? disconnecting,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitConnection value) initConnection,
    required TResult Function(_connectSuccess value) connectSuccess,
    required TResult Function(_ConnectFailed value) connectFailed,
    required TResult Function(_Disconnecting value) disconnecting,
    required TResult Function(_Disconnected value) disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitConnection value)? initConnection,
    TResult? Function(_connectSuccess value)? connectSuccess,
    TResult? Function(_ConnectFailed value)? connectFailed,
    TResult? Function(_Disconnecting value)? disconnecting,
    TResult? Function(_Disconnected value)? disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitConnection value)? initConnection,
    TResult Function(_connectSuccess value)? connectSuccess,
    TResult Function(_ConnectFailed value)? connectFailed,
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
    return 'CameraConnectionState.initConnection()';
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
    required TResult Function() initConnection,
    required TResult Function(CameraHandle cameraHandle) connectSuccess,
    required TResult Function() connectFailed,
    required TResult Function() disconnecting,
    required TResult Function() disconnected,
  }) {
    return initConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initConnection,
    TResult? Function(CameraHandle cameraHandle)? connectSuccess,
    TResult? Function()? connectFailed,
    TResult? Function()? disconnecting,
    TResult? Function()? disconnected,
  }) {
    return initConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initConnection,
    TResult Function(CameraHandle cameraHandle)? connectSuccess,
    TResult Function()? connectFailed,
    TResult Function()? disconnecting,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) {
    if (initConnection != null) {
      return initConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitConnection value) initConnection,
    required TResult Function(_connectSuccess value) connectSuccess,
    required TResult Function(_ConnectFailed value) connectFailed,
    required TResult Function(_Disconnecting value) disconnecting,
    required TResult Function(_Disconnected value) disconnected,
  }) {
    return initConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitConnection value)? initConnection,
    TResult? Function(_connectSuccess value)? connectSuccess,
    TResult? Function(_ConnectFailed value)? connectFailed,
    TResult? Function(_Disconnecting value)? disconnecting,
    TResult? Function(_Disconnected value)? disconnected,
  }) {
    return initConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitConnection value)? initConnection,
    TResult Function(_connectSuccess value)? connectSuccess,
    TResult Function(_ConnectFailed value)? connectFailed,
    TResult Function(_Disconnecting value)? disconnecting,
    TResult Function(_Disconnected value)? disconnected,
    required TResult orElse(),
  }) {
    if (initConnection != null) {
      return initConnection(this);
    }
    return orElse();
  }
}

abstract class _InitConnection implements CameraConnectionState {
  const factory _InitConnection() = _$_InitConnection;
}

/// @nodoc
abstract class _$$_connectSuccessCopyWith<$Res> {
  factory _$$_connectSuccessCopyWith(
          _$_connectSuccess value, $Res Function(_$_connectSuccess) then) =
      __$$_connectSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({CameraHandle cameraHandle});
}

/// @nodoc
class __$$_connectSuccessCopyWithImpl<$Res>
    extends _$CameraConnectionStateCopyWithImpl<$Res, _$_connectSuccess>
    implements _$$_connectSuccessCopyWith<$Res> {
  __$$_connectSuccessCopyWithImpl(
      _$_connectSuccess _value, $Res Function(_$_connectSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cameraHandle = null,
  }) {
    return _then(_$_connectSuccess(
      null == cameraHandle
          ? _value.cameraHandle
          : cameraHandle // ignore: cast_nullable_to_non_nullable
              as CameraHandle,
    ));
  }
}

/// @nodoc

class _$_connectSuccess implements _connectSuccess {
  const _$_connectSuccess(this.cameraHandle);

  @override
  final CameraHandle cameraHandle;

  @override
  String toString() {
    return 'CameraConnectionState.connectSuccess(cameraHandle: $cameraHandle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_connectSuccess &&
            (identical(other.cameraHandle, cameraHandle) ||
                other.cameraHandle == cameraHandle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cameraHandle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_connectSuccessCopyWith<_$_connectSuccess> get copyWith =>
      __$$_connectSuccessCopyWithImpl<_$_connectSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initConnection,
    required TResult Function(CameraHandle cameraHandle) connectSuccess,
    required TResult Function() connectFailed,
    required TResult Function() disconnecting,
    required TResult Function() disconnected,
  }) {
    return connectSuccess(cameraHandle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initConnection,
    TResult? Function(CameraHandle cameraHandle)? connectSuccess,
    TResult? Function()? connectFailed,
    TResult? Function()? disconnecting,
    TResult? Function()? disconnected,
  }) {
    return connectSuccess?.call(cameraHandle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initConnection,
    TResult Function(CameraHandle cameraHandle)? connectSuccess,
    TResult Function()? connectFailed,
    TResult Function()? disconnecting,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) {
    if (connectSuccess != null) {
      return connectSuccess(cameraHandle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitConnection value) initConnection,
    required TResult Function(_connectSuccess value) connectSuccess,
    required TResult Function(_ConnectFailed value) connectFailed,
    required TResult Function(_Disconnecting value) disconnecting,
    required TResult Function(_Disconnected value) disconnected,
  }) {
    return connectSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitConnection value)? initConnection,
    TResult? Function(_connectSuccess value)? connectSuccess,
    TResult? Function(_ConnectFailed value)? connectFailed,
    TResult? Function(_Disconnecting value)? disconnecting,
    TResult? Function(_Disconnected value)? disconnected,
  }) {
    return connectSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitConnection value)? initConnection,
    TResult Function(_connectSuccess value)? connectSuccess,
    TResult Function(_ConnectFailed value)? connectFailed,
    TResult Function(_Disconnecting value)? disconnecting,
    TResult Function(_Disconnected value)? disconnected,
    required TResult orElse(),
  }) {
    if (connectSuccess != null) {
      return connectSuccess(this);
    }
    return orElse();
  }
}

abstract class _connectSuccess implements CameraConnectionState {
  const factory _connectSuccess(final CameraHandle cameraHandle) =
      _$_connectSuccess;

  CameraHandle get cameraHandle;
  @JsonKey(ignore: true)
  _$$_connectSuccessCopyWith<_$_connectSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ConnectFailedCopyWith<$Res> {
  factory _$$_ConnectFailedCopyWith(
          _$_ConnectFailed value, $Res Function(_$_ConnectFailed) then) =
      __$$_ConnectFailedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ConnectFailedCopyWithImpl<$Res>
    extends _$CameraConnectionStateCopyWithImpl<$Res, _$_ConnectFailed>
    implements _$$_ConnectFailedCopyWith<$Res> {
  __$$_ConnectFailedCopyWithImpl(
      _$_ConnectFailed _value, $Res Function(_$_ConnectFailed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ConnectFailed implements _ConnectFailed {
  const _$_ConnectFailed();

  @override
  String toString() {
    return 'CameraConnectionState.connectFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ConnectFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initConnection,
    required TResult Function(CameraHandle cameraHandle) connectSuccess,
    required TResult Function() connectFailed,
    required TResult Function() disconnecting,
    required TResult Function() disconnected,
  }) {
    return connectFailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initConnection,
    TResult? Function(CameraHandle cameraHandle)? connectSuccess,
    TResult? Function()? connectFailed,
    TResult? Function()? disconnecting,
    TResult? Function()? disconnected,
  }) {
    return connectFailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initConnection,
    TResult Function(CameraHandle cameraHandle)? connectSuccess,
    TResult Function()? connectFailed,
    TResult Function()? disconnecting,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) {
    if (connectFailed != null) {
      return connectFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitConnection value) initConnection,
    required TResult Function(_connectSuccess value) connectSuccess,
    required TResult Function(_ConnectFailed value) connectFailed,
    required TResult Function(_Disconnecting value) disconnecting,
    required TResult Function(_Disconnected value) disconnected,
  }) {
    return connectFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitConnection value)? initConnection,
    TResult? Function(_connectSuccess value)? connectSuccess,
    TResult? Function(_ConnectFailed value)? connectFailed,
    TResult? Function(_Disconnecting value)? disconnecting,
    TResult? Function(_Disconnected value)? disconnected,
  }) {
    return connectFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitConnection value)? initConnection,
    TResult Function(_connectSuccess value)? connectSuccess,
    TResult Function(_ConnectFailed value)? connectFailed,
    TResult Function(_Disconnecting value)? disconnecting,
    TResult Function(_Disconnected value)? disconnected,
    required TResult orElse(),
  }) {
    if (connectFailed != null) {
      return connectFailed(this);
    }
    return orElse();
  }
}

abstract class _ConnectFailed implements CameraConnectionState {
  const factory _ConnectFailed() = _$_ConnectFailed;
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
    required TResult Function() initConnection,
    required TResult Function(CameraHandle cameraHandle) connectSuccess,
    required TResult Function() connectFailed,
    required TResult Function() disconnecting,
    required TResult Function() disconnected,
  }) {
    return disconnecting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initConnection,
    TResult? Function(CameraHandle cameraHandle)? connectSuccess,
    TResult? Function()? connectFailed,
    TResult? Function()? disconnecting,
    TResult? Function()? disconnected,
  }) {
    return disconnecting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initConnection,
    TResult Function(CameraHandle cameraHandle)? connectSuccess,
    TResult Function()? connectFailed,
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
    required TResult Function(_InitConnection value) initConnection,
    required TResult Function(_connectSuccess value) connectSuccess,
    required TResult Function(_ConnectFailed value) connectFailed,
    required TResult Function(_Disconnecting value) disconnecting,
    required TResult Function(_Disconnected value) disconnected,
  }) {
    return disconnecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitConnection value)? initConnection,
    TResult? Function(_connectSuccess value)? connectSuccess,
    TResult? Function(_ConnectFailed value)? connectFailed,
    TResult? Function(_Disconnecting value)? disconnecting,
    TResult? Function(_Disconnected value)? disconnected,
  }) {
    return disconnecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitConnection value)? initConnection,
    TResult Function(_connectSuccess value)? connectSuccess,
    TResult Function(_ConnectFailed value)? connectFailed,
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
    required TResult Function() initConnection,
    required TResult Function(CameraHandle cameraHandle) connectSuccess,
    required TResult Function() connectFailed,
    required TResult Function() disconnecting,
    required TResult Function() disconnected,
  }) {
    return disconnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initConnection,
    TResult? Function(CameraHandle cameraHandle)? connectSuccess,
    TResult? Function()? connectFailed,
    TResult? Function()? disconnecting,
    TResult? Function()? disconnected,
  }) {
    return disconnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initConnection,
    TResult Function(CameraHandle cameraHandle)? connectSuccess,
    TResult Function()? connectFailed,
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
    required TResult Function(_InitConnection value) initConnection,
    required TResult Function(_connectSuccess value) connectSuccess,
    required TResult Function(_ConnectFailed value) connectFailed,
    required TResult Function(_Disconnecting value) disconnecting,
    required TResult Function(_Disconnected value) disconnected,
  }) {
    return disconnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitConnection value)? initConnection,
    TResult? Function(_connectSuccess value)? connectSuccess,
    TResult? Function(_ConnectFailed value)? connectFailed,
    TResult? Function(_Disconnecting value)? disconnecting,
    TResult? Function(_Disconnected value)? disconnected,
  }) {
    return disconnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitConnection value)? initConnection,
    TResult Function(_connectSuccess value)? connectSuccess,
    TResult Function(_ConnectFailed value)? connectFailed,
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
