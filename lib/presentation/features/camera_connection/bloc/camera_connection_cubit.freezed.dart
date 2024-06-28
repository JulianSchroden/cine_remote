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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$InitConnectionImplCopyWith<$Res> {
  factory _$$InitConnectionImplCopyWith(_$InitConnectionImpl value,
          $Res Function(_$InitConnectionImpl) then) =
      __$$InitConnectionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitConnectionImplCopyWithImpl<$Res>
    extends _$CameraConnectionStateCopyWithImpl<$Res, _$InitConnectionImpl>
    implements _$$InitConnectionImplCopyWith<$Res> {
  __$$InitConnectionImplCopyWithImpl(
      _$InitConnectionImpl _value, $Res Function(_$InitConnectionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitConnectionImpl extends _InitConnection {
  const _$InitConnectionImpl() : super._();

  @override
  String toString() {
    return 'CameraConnectionState.connecting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitConnectionImpl);
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
  const factory _InitConnection() = _$InitConnectionImpl;
  const _InitConnection._() : super._();
}

/// @nodoc
abstract class _$$ConnectingFailedImplCopyWith<$Res> {
  factory _$$ConnectingFailedImplCopyWith(_$ConnectingFailedImpl value,
          $Res Function(_$ConnectingFailedImpl) then) =
      __$$ConnectingFailedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectingFailedImplCopyWithImpl<$Res>
    extends _$CameraConnectionStateCopyWithImpl<$Res, _$ConnectingFailedImpl>
    implements _$$ConnectingFailedImplCopyWith<$Res> {
  __$$ConnectingFailedImplCopyWithImpl(_$ConnectingFailedImpl _value,
      $Res Function(_$ConnectingFailedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ConnectingFailedImpl extends _ConnectingFailed {
  const _$ConnectingFailedImpl() : super._();

  @override
  String toString() {
    return 'CameraConnectionState.connectingFailed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConnectingFailedImpl);
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
  const factory _ConnectingFailed() = _$ConnectingFailedImpl;
  const _ConnectingFailed._() : super._();
}

/// @nodoc
abstract class _$$RequiresPairingImplCopyWith<$Res> {
  factory _$$RequiresPairingImplCopyWith(_$RequiresPairingImpl value,
          $Res Function(_$RequiresPairingImpl) then) =
      __$$RequiresPairingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DiscoveryHandle handle});
}

/// @nodoc
class __$$RequiresPairingImplCopyWithImpl<$Res>
    extends _$CameraConnectionStateCopyWithImpl<$Res, _$RequiresPairingImpl>
    implements _$$RequiresPairingImplCopyWith<$Res> {
  __$$RequiresPairingImplCopyWithImpl(
      _$RequiresPairingImpl _value, $Res Function(_$RequiresPairingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? handle = null,
  }) {
    return _then(_$RequiresPairingImpl(
      null == handle
          ? _value.handle
          : handle // ignore: cast_nullable_to_non_nullable
              as DiscoveryHandle,
    ));
  }
}

/// @nodoc

class _$RequiresPairingImpl extends _RequiresPairing {
  const _$RequiresPairingImpl(this.handle) : super._();

  @override
  final DiscoveryHandle handle;

  @override
  String toString() {
    return 'CameraConnectionState.requiresPairing(handle: $handle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequiresPairingImpl &&
            (identical(other.handle, handle) || other.handle == handle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, handle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequiresPairingImplCopyWith<_$RequiresPairingImpl> get copyWith =>
      __$$RequiresPairingImplCopyWithImpl<_$RequiresPairingImpl>(
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
      _$RequiresPairingImpl;
  const _RequiresPairing._() : super._();

  DiscoveryHandle get handle;
  @JsonKey(ignore: true)
  _$$RequiresPairingImplCopyWith<_$RequiresPairingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectionEstablishedImplCopyWith<$Res> {
  factory _$$ConnectionEstablishedImplCopyWith(
          _$ConnectionEstablishedImpl value,
          $Res Function(_$ConnectionEstablishedImpl) then) =
      __$$ConnectionEstablishedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Camera camera});
}

/// @nodoc
class __$$ConnectionEstablishedImplCopyWithImpl<$Res>
    extends _$CameraConnectionStateCopyWithImpl<$Res,
        _$ConnectionEstablishedImpl>
    implements _$$ConnectionEstablishedImplCopyWith<$Res> {
  __$$ConnectionEstablishedImplCopyWithImpl(_$ConnectionEstablishedImpl _value,
      $Res Function(_$ConnectionEstablishedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? camera = null,
  }) {
    return _then(_$ConnectionEstablishedImpl(
      null == camera
          ? _value.camera
          : camera // ignore: cast_nullable_to_non_nullable
              as Camera,
    ));
  }
}

/// @nodoc

class _$ConnectionEstablishedImpl extends _ConnectionEstablished {
  const _$ConnectionEstablishedImpl(this.camera) : super._();

  @override
  final Camera camera;

  @override
  String toString() {
    return 'CameraConnectionState.connected(camera: $camera)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionEstablishedImpl &&
            (identical(other.camera, camera) || other.camera == camera));
  }

  @override
  int get hashCode => Object.hash(runtimeType, camera);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionEstablishedImplCopyWith<_$ConnectionEstablishedImpl>
      get copyWith => __$$ConnectionEstablishedImplCopyWithImpl<
          _$ConnectionEstablishedImpl>(this, _$identity);

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
      _$ConnectionEstablishedImpl;
  const _ConnectionEstablished._() : super._();

  Camera get camera;
  @JsonKey(ignore: true)
  _$$ConnectionEstablishedImplCopyWith<_$ConnectionEstablishedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DisconnectingImplCopyWith<$Res> {
  factory _$$DisconnectingImplCopyWith(
          _$DisconnectingImpl value, $Res Function(_$DisconnectingImpl) then) =
      __$$DisconnectingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Camera camera});
}

/// @nodoc
class __$$DisconnectingImplCopyWithImpl<$Res>
    extends _$CameraConnectionStateCopyWithImpl<$Res, _$DisconnectingImpl>
    implements _$$DisconnectingImplCopyWith<$Res> {
  __$$DisconnectingImplCopyWithImpl(
      _$DisconnectingImpl _value, $Res Function(_$DisconnectingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? camera = null,
  }) {
    return _then(_$DisconnectingImpl(
      null == camera
          ? _value.camera
          : camera // ignore: cast_nullable_to_non_nullable
              as Camera,
    ));
  }
}

/// @nodoc

class _$DisconnectingImpl extends _Disconnecting {
  const _$DisconnectingImpl(this.camera) : super._();

  @override
  final Camera camera;

  @override
  String toString() {
    return 'CameraConnectionState.disconnecting(camera: $camera)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisconnectingImpl &&
            (identical(other.camera, camera) || other.camera == camera));
  }

  @override
  int get hashCode => Object.hash(runtimeType, camera);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DisconnectingImplCopyWith<_$DisconnectingImpl> get copyWith =>
      __$$DisconnectingImplCopyWithImpl<_$DisconnectingImpl>(this, _$identity);

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
  const factory _Disconnecting(final Camera camera) = _$DisconnectingImpl;
  const _Disconnecting._() : super._();

  Camera get camera;
  @JsonKey(ignore: true)
  _$$DisconnectingImplCopyWith<_$DisconnectingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DisconnectedImplCopyWith<$Res> {
  factory _$$DisconnectedImplCopyWith(
          _$DisconnectedImpl value, $Res Function(_$DisconnectedImpl) then) =
      __$$DisconnectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DisconnectedImplCopyWithImpl<$Res>
    extends _$CameraConnectionStateCopyWithImpl<$Res, _$DisconnectedImpl>
    implements _$$DisconnectedImplCopyWith<$Res> {
  __$$DisconnectedImplCopyWithImpl(
      _$DisconnectedImpl _value, $Res Function(_$DisconnectedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DisconnectedImpl extends _Disconnected {
  const _$DisconnectedImpl() : super._();

  @override
  String toString() {
    return 'CameraConnectionState.disconnected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DisconnectedImpl);
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
  const factory _Disconnected() = _$DisconnectedImpl;
  const _Disconnected._() : super._();
}
