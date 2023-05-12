// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
    required TResult Function(DiscoveryHandle handle) requiresPairing,
    required TResult Function(Camera camera) connected,
    required TResult Function(Camera camera) disconnecting,
    required TResult Function() disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function()? connectingFailed,
    TResult? Function(DiscoveryHandle handle)? requiresPairing,
    TResult? Function(Camera camera)? connected,
    TResult? Function(Camera camera)? disconnecting,
    TResult? Function()? disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connectingFailed,
    TResult Function(DiscoveryHandle handle)? requiresPairing,
    TResult Function(Camera camera)? connected,
    TResult Function(Camera camera)? disconnecting,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitConnection value) connecting,
    required TResult Function(_ConnectingFailed value) connectingFailed,
    required TResult Function(_RequiresPairing value) requiresPairing,
    required TResult Function(_ConnectionEstablished value) connected,
    required TResult Function(_Disconnecting value) disconnecting,
    required TResult Function(_Disconnected value) disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitConnection value)? connecting,
    TResult? Function(_ConnectingFailed value)? connectingFailed,
    TResult? Function(_RequiresPairing value)? requiresPairing,
    TResult? Function(_ConnectionEstablished value)? connected,
    TResult? Function(_Disconnecting value)? disconnecting,
    TResult? Function(_Disconnected value)? disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitConnection value)? connecting,
    TResult Function(_ConnectingFailed value)? connectingFailed,
    TResult Function(_RequiresPairing value)? requiresPairing,
    TResult Function(_ConnectionEstablished value)? connected,
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

class _$_InitConnection extends _InitConnection {
  const _$_InitConnection() : super._();

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
    required TResult Function(DiscoveryHandle handle) requiresPairing,
    required TResult Function(Camera camera) connected,
    required TResult Function(Camera camera) disconnecting,
    required TResult Function() disconnected,
  }) {
    return connecting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function()? connectingFailed,
    TResult? Function(DiscoveryHandle handle)? requiresPairing,
    TResult? Function(Camera camera)? connected,
    TResult? Function(Camera camera)? disconnecting,
    TResult? Function()? disconnected,
  }) {
    return connecting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connectingFailed,
    TResult Function(DiscoveryHandle handle)? requiresPairing,
    TResult Function(Camera camera)? connected,
    TResult Function(Camera camera)? disconnecting,
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
    required TResult Function(_RequiresPairing value) requiresPairing,
    required TResult Function(_ConnectionEstablished value) connected,
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
    TResult? Function(_RequiresPairing value)? requiresPairing,
    TResult? Function(_ConnectionEstablished value)? connected,
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
    TResult Function(_RequiresPairing value)? requiresPairing,
    TResult Function(_ConnectionEstablished value)? connected,
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

abstract class _InitConnection extends CameraConnectionState {
  const factory _InitConnection() = _$_InitConnection;
  const _InitConnection._() : super._();
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

class _$_ConnectingFailed extends _ConnectingFailed {
  const _$_ConnectingFailed() : super._();

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
    required TResult Function(DiscoveryHandle handle) requiresPairing,
    required TResult Function(Camera camera) connected,
    required TResult Function(Camera camera) disconnecting,
    required TResult Function() disconnected,
  }) {
    return connectingFailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function()? connectingFailed,
    TResult? Function(DiscoveryHandle handle)? requiresPairing,
    TResult? Function(Camera camera)? connected,
    TResult? Function(Camera camera)? disconnecting,
    TResult? Function()? disconnected,
  }) {
    return connectingFailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connectingFailed,
    TResult Function(DiscoveryHandle handle)? requiresPairing,
    TResult Function(Camera camera)? connected,
    TResult Function(Camera camera)? disconnecting,
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
    required TResult Function(_RequiresPairing value) requiresPairing,
    required TResult Function(_ConnectionEstablished value) connected,
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
    TResult? Function(_RequiresPairing value)? requiresPairing,
    TResult? Function(_ConnectionEstablished value)? connected,
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
    TResult Function(_RequiresPairing value)? requiresPairing,
    TResult Function(_ConnectionEstablished value)? connected,
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

abstract class _ConnectingFailed extends CameraConnectionState {
  const factory _ConnectingFailed() = _$_ConnectingFailed;
  const _ConnectingFailed._() : super._();
}

/// @nodoc
abstract class _$$_RequiresPairingCopyWith<$Res> {
  factory _$$_RequiresPairingCopyWith(
          _$_RequiresPairing value, $Res Function(_$_RequiresPairing) then) =
      __$$_RequiresPairingCopyWithImpl<$Res>;
  @useResult
  $Res call({DiscoveryHandle handle});
}

/// @nodoc
class __$$_RequiresPairingCopyWithImpl<$Res>
    extends _$CameraConnectionStateCopyWithImpl<$Res, _$_RequiresPairing>
    implements _$$_RequiresPairingCopyWith<$Res> {
  __$$_RequiresPairingCopyWithImpl(
      _$_RequiresPairing _value, $Res Function(_$_RequiresPairing) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? handle = null,
  }) {
    return _then(_$_RequiresPairing(
      null == handle
          ? _value.handle
          : handle // ignore: cast_nullable_to_non_nullable
              as DiscoveryHandle,
    ));
  }
}

/// @nodoc

class _$_RequiresPairing extends _RequiresPairing {
  const _$_RequiresPairing(this.handle) : super._();

  @override
  final DiscoveryHandle handle;

  @override
  String toString() {
    return 'CameraConnectionState.requiresPairing(handle: $handle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RequiresPairing &&
            (identical(other.handle, handle) || other.handle == handle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, handle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RequiresPairingCopyWith<_$_RequiresPairing> get copyWith =>
      __$$_RequiresPairingCopyWithImpl<_$_RequiresPairing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function() connectingFailed,
    required TResult Function(DiscoveryHandle handle) requiresPairing,
    required TResult Function(Camera camera) connected,
    required TResult Function(Camera camera) disconnecting,
    required TResult Function() disconnected,
  }) {
    return requiresPairing(handle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function()? connectingFailed,
    TResult? Function(DiscoveryHandle handle)? requiresPairing,
    TResult? Function(Camera camera)? connected,
    TResult? Function(Camera camera)? disconnecting,
    TResult? Function()? disconnected,
  }) {
    return requiresPairing?.call(handle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connectingFailed,
    TResult Function(DiscoveryHandle handle)? requiresPairing,
    TResult Function(Camera camera)? connected,
    TResult Function(Camera camera)? disconnecting,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) {
    if (requiresPairing != null) {
      return requiresPairing(handle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitConnection value) connecting,
    required TResult Function(_ConnectingFailed value) connectingFailed,
    required TResult Function(_RequiresPairing value) requiresPairing,
    required TResult Function(_ConnectionEstablished value) connected,
    required TResult Function(_Disconnecting value) disconnecting,
    required TResult Function(_Disconnected value) disconnected,
  }) {
    return requiresPairing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitConnection value)? connecting,
    TResult? Function(_ConnectingFailed value)? connectingFailed,
    TResult? Function(_RequiresPairing value)? requiresPairing,
    TResult? Function(_ConnectionEstablished value)? connected,
    TResult? Function(_Disconnecting value)? disconnecting,
    TResult? Function(_Disconnected value)? disconnected,
  }) {
    return requiresPairing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitConnection value)? connecting,
    TResult Function(_ConnectingFailed value)? connectingFailed,
    TResult Function(_RequiresPairing value)? requiresPairing,
    TResult Function(_ConnectionEstablished value)? connected,
    TResult Function(_Disconnecting value)? disconnecting,
    TResult Function(_Disconnected value)? disconnected,
    required TResult orElse(),
  }) {
    if (requiresPairing != null) {
      return requiresPairing(this);
    }
    return orElse();
  }
}

abstract class _RequiresPairing extends CameraConnectionState {
  const factory _RequiresPairing(final DiscoveryHandle handle) =
      _$_RequiresPairing;
  const _RequiresPairing._() : super._();

  DiscoveryHandle get handle;
  @JsonKey(ignore: true)
  _$$_RequiresPairingCopyWith<_$_RequiresPairing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ConnectionEstablishedCopyWith<$Res> {
  factory _$$_ConnectionEstablishedCopyWith(_$_ConnectionEstablished value,
          $Res Function(_$_ConnectionEstablished) then) =
      __$$_ConnectionEstablishedCopyWithImpl<$Res>;
  @useResult
  $Res call({Camera camera});
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
    Object? camera = null,
  }) {
    return _then(_$_ConnectionEstablished(
      null == camera
          ? _value.camera
          : camera // ignore: cast_nullable_to_non_nullable
              as Camera,
    ));
  }
}

/// @nodoc

class _$_ConnectionEstablished extends _ConnectionEstablished {
  const _$_ConnectionEstablished(this.camera) : super._();

  @override
  final Camera camera;

  @override
  String toString() {
    return 'CameraConnectionState.connected(camera: $camera)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConnectionEstablished &&
            (identical(other.camera, camera) || other.camera == camera));
  }

  @override
  int get hashCode => Object.hash(runtimeType, camera);

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
    required TResult Function(DiscoveryHandle handle) requiresPairing,
    required TResult Function(Camera camera) connected,
    required TResult Function(Camera camera) disconnecting,
    required TResult Function() disconnected,
  }) {
    return connected(camera);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function()? connectingFailed,
    TResult? Function(DiscoveryHandle handle)? requiresPairing,
    TResult? Function(Camera camera)? connected,
    TResult? Function(Camera camera)? disconnecting,
    TResult? Function()? disconnected,
  }) {
    return connected?.call(camera);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connectingFailed,
    TResult Function(DiscoveryHandle handle)? requiresPairing,
    TResult Function(Camera camera)? connected,
    TResult Function(Camera camera)? disconnecting,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(camera);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitConnection value) connecting,
    required TResult Function(_ConnectingFailed value) connectingFailed,
    required TResult Function(_RequiresPairing value) requiresPairing,
    required TResult Function(_ConnectionEstablished value) connected,
    required TResult Function(_Disconnecting value) disconnecting,
    required TResult Function(_Disconnected value) disconnected,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitConnection value)? connecting,
    TResult? Function(_ConnectingFailed value)? connectingFailed,
    TResult? Function(_RequiresPairing value)? requiresPairing,
    TResult? Function(_ConnectionEstablished value)? connected,
    TResult? Function(_Disconnecting value)? disconnecting,
    TResult? Function(_Disconnected value)? disconnected,
  }) {
    return connected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitConnection value)? connecting,
    TResult Function(_ConnectingFailed value)? connectingFailed,
    TResult Function(_RequiresPairing value)? requiresPairing,
    TResult Function(_ConnectionEstablished value)? connected,
    TResult Function(_Disconnecting value)? disconnecting,
    TResult Function(_Disconnected value)? disconnected,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class _ConnectionEstablished extends CameraConnectionState {
  const factory _ConnectionEstablished(final Camera camera) =
      _$_ConnectionEstablished;
  const _ConnectionEstablished._() : super._();

  Camera get camera;
  @JsonKey(ignore: true)
  _$$_ConnectionEstablishedCopyWith<_$_ConnectionEstablished> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DisconnectingCopyWith<$Res> {
  factory _$$_DisconnectingCopyWith(
          _$_Disconnecting value, $Res Function(_$_Disconnecting) then) =
      __$$_DisconnectingCopyWithImpl<$Res>;
  @useResult
  $Res call({Camera camera});
}

/// @nodoc
class __$$_DisconnectingCopyWithImpl<$Res>
    extends _$CameraConnectionStateCopyWithImpl<$Res, _$_Disconnecting>
    implements _$$_DisconnectingCopyWith<$Res> {
  __$$_DisconnectingCopyWithImpl(
      _$_Disconnecting _value, $Res Function(_$_Disconnecting) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? camera = null,
  }) {
    return _then(_$_Disconnecting(
      null == camera
          ? _value.camera
          : camera // ignore: cast_nullable_to_non_nullable
              as Camera,
    ));
  }
}

/// @nodoc

class _$_Disconnecting extends _Disconnecting {
  const _$_Disconnecting(this.camera) : super._();

  @override
  final Camera camera;

  @override
  String toString() {
    return 'CameraConnectionState.disconnecting(camera: $camera)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Disconnecting &&
            (identical(other.camera, camera) || other.camera == camera));
  }

  @override
  int get hashCode => Object.hash(runtimeType, camera);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DisconnectingCopyWith<_$_Disconnecting> get copyWith =>
      __$$_DisconnectingCopyWithImpl<_$_Disconnecting>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connecting,
    required TResult Function() connectingFailed,
    required TResult Function(DiscoveryHandle handle) requiresPairing,
    required TResult Function(Camera camera) connected,
    required TResult Function(Camera camera) disconnecting,
    required TResult Function() disconnected,
  }) {
    return disconnecting(camera);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function()? connectingFailed,
    TResult? Function(DiscoveryHandle handle)? requiresPairing,
    TResult? Function(Camera camera)? connected,
    TResult? Function(Camera camera)? disconnecting,
    TResult? Function()? disconnected,
  }) {
    return disconnecting?.call(camera);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connectingFailed,
    TResult Function(DiscoveryHandle handle)? requiresPairing,
    TResult Function(Camera camera)? connected,
    TResult Function(Camera camera)? disconnecting,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) {
    if (disconnecting != null) {
      return disconnecting(camera);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitConnection value) connecting,
    required TResult Function(_ConnectingFailed value) connectingFailed,
    required TResult Function(_RequiresPairing value) requiresPairing,
    required TResult Function(_ConnectionEstablished value) connected,
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
    TResult? Function(_RequiresPairing value)? requiresPairing,
    TResult? Function(_ConnectionEstablished value)? connected,
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
    TResult Function(_RequiresPairing value)? requiresPairing,
    TResult Function(_ConnectionEstablished value)? connected,
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

abstract class _Disconnecting extends CameraConnectionState {
  const factory _Disconnecting(final Camera camera) = _$_Disconnecting;
  const _Disconnecting._() : super._();

  Camera get camera;
  @JsonKey(ignore: true)
  _$$_DisconnectingCopyWith<_$_Disconnecting> get copyWith =>
      throw _privateConstructorUsedError;
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

class _$_Disconnected extends _Disconnected {
  const _$_Disconnected() : super._();

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
    required TResult Function(DiscoveryHandle handle) requiresPairing,
    required TResult Function(Camera camera) connected,
    required TResult Function(Camera camera) disconnecting,
    required TResult Function() disconnected,
  }) {
    return disconnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connecting,
    TResult? Function()? connectingFailed,
    TResult? Function(DiscoveryHandle handle)? requiresPairing,
    TResult? Function(Camera camera)? connected,
    TResult? Function(Camera camera)? disconnecting,
    TResult? Function()? disconnected,
  }) {
    return disconnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connecting,
    TResult Function()? connectingFailed,
    TResult Function(DiscoveryHandle handle)? requiresPairing,
    TResult Function(Camera camera)? connected,
    TResult Function(Camera camera)? disconnecting,
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
    required TResult Function(_RequiresPairing value) requiresPairing,
    required TResult Function(_ConnectionEstablished value) connected,
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
    TResult? Function(_RequiresPairing value)? requiresPairing,
    TResult? Function(_ConnectionEstablished value)? connected,
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
    TResult Function(_RequiresPairing value)? requiresPairing,
    TResult Function(_ConnectionEstablished value)? connected,
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

abstract class _Disconnected extends CameraConnectionState {
  const factory _Disconnected() = _$_Disconnected;
  const _Disconnected._() : super._();
}
