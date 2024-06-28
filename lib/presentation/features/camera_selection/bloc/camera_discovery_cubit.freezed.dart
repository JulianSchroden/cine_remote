// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_discovery_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CameraDiscoveryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initInProgress,
    required TResult Function(
            String? currentIp, List<DiscoveryHandle> discoveryHandles)
        active,
    required TResult Function(String? currentIp) paused,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initInProgress,
    TResult? Function(
            String? currentIp, List<DiscoveryHandle> discoveryHandles)?
        active,
    TResult? Function(String? currentIp)? paused,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initInProgress,
    TResult Function(String? currentIp, List<DiscoveryHandle> discoveryHandles)?
        active,
    TResult Function(String? currentIp)? paused,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitInProgress value) initInProgress,
    required TResult Function(_Active value) active,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitInProgress value)? initInProgress,
    TResult? Function(_Active value)? active,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitInProgress value)? initInProgress,
    TResult Function(_Active value)? active,
    TResult Function(_Paused value)? paused,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraDiscoveryStateCopyWith<$Res> {
  factory $CameraDiscoveryStateCopyWith(CameraDiscoveryState value,
          $Res Function(CameraDiscoveryState) then) =
      _$CameraDiscoveryStateCopyWithImpl<$Res, CameraDiscoveryState>;
}

/// @nodoc
class _$CameraDiscoveryStateCopyWithImpl<$Res,
        $Val extends CameraDiscoveryState>
    implements $CameraDiscoveryStateCopyWith<$Res> {
  _$CameraDiscoveryStateCopyWithImpl(this._value, this._then);

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
    extends _$CameraDiscoveryStateCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl extends _Init {
  const _$InitImpl() : super._();

  @override
  String toString() {
    return 'CameraDiscoveryState.init()';
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
    required TResult Function() initInProgress,
    required TResult Function(
            String? currentIp, List<DiscoveryHandle> discoveryHandles)
        active,
    required TResult Function(String? currentIp) paused,
    required TResult Function() error,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initInProgress,
    TResult? Function(
            String? currentIp, List<DiscoveryHandle> discoveryHandles)?
        active,
    TResult? Function(String? currentIp)? paused,
    TResult? Function()? error,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initInProgress,
    TResult Function(String? currentIp, List<DiscoveryHandle> discoveryHandles)?
        active,
    TResult Function(String? currentIp)? paused,
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
    required TResult Function(_InitInProgress value) initInProgress,
    required TResult Function(_Active value) active,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Error value) error,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitInProgress value)? initInProgress,
    TResult? Function(_Active value)? active,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Error value)? error,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitInProgress value)? initInProgress,
    TResult Function(_Active value)? active,
    TResult Function(_Paused value)? paused,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init extends CameraDiscoveryState {
  const factory _Init() = _$InitImpl;
  const _Init._() : super._();
}

/// @nodoc
abstract class _$$InitInProgressImplCopyWith<$Res> {
  factory _$$InitInProgressImplCopyWith(_$InitInProgressImpl value,
          $Res Function(_$InitInProgressImpl) then) =
      __$$InitInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitInProgressImplCopyWithImpl<$Res>
    extends _$CameraDiscoveryStateCopyWithImpl<$Res, _$InitInProgressImpl>
    implements _$$InitInProgressImplCopyWith<$Res> {
  __$$InitInProgressImplCopyWithImpl(
      _$InitInProgressImpl _value, $Res Function(_$InitInProgressImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitInProgressImpl extends _InitInProgress {
  const _$InitInProgressImpl() : super._();

  @override
  String toString() {
    return 'CameraDiscoveryState.initInProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initInProgress,
    required TResult Function(
            String? currentIp, List<DiscoveryHandle> discoveryHandles)
        active,
    required TResult Function(String? currentIp) paused,
    required TResult Function() error,
  }) {
    return initInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initInProgress,
    TResult? Function(
            String? currentIp, List<DiscoveryHandle> discoveryHandles)?
        active,
    TResult? Function(String? currentIp)? paused,
    TResult? Function()? error,
  }) {
    return initInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initInProgress,
    TResult Function(String? currentIp, List<DiscoveryHandle> discoveryHandles)?
        active,
    TResult Function(String? currentIp)? paused,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initInProgress != null) {
      return initInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitInProgress value) initInProgress,
    required TResult Function(_Active value) active,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Error value) error,
  }) {
    return initInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitInProgress value)? initInProgress,
    TResult? Function(_Active value)? active,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Error value)? error,
  }) {
    return initInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitInProgress value)? initInProgress,
    TResult Function(_Active value)? active,
    TResult Function(_Paused value)? paused,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initInProgress != null) {
      return initInProgress(this);
    }
    return orElse();
  }
}

abstract class _InitInProgress extends CameraDiscoveryState {
  const factory _InitInProgress() = _$InitInProgressImpl;
  const _InitInProgress._() : super._();
}

/// @nodoc
abstract class _$$ActiveImplCopyWith<$Res> {
  factory _$$ActiveImplCopyWith(
          _$ActiveImpl value, $Res Function(_$ActiveImpl) then) =
      __$$ActiveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? currentIp, List<DiscoveryHandle> discoveryHandles});
}

/// @nodoc
class __$$ActiveImplCopyWithImpl<$Res>
    extends _$CameraDiscoveryStateCopyWithImpl<$Res, _$ActiveImpl>
    implements _$$ActiveImplCopyWith<$Res> {
  __$$ActiveImplCopyWithImpl(
      _$ActiveImpl _value, $Res Function(_$ActiveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIp = freezed,
    Object? discoveryHandles = null,
  }) {
    return _then(_$ActiveImpl(
      freezed == currentIp
          ? _value.currentIp
          : currentIp // ignore: cast_nullable_to_non_nullable
              as String?,
      null == discoveryHandles
          ? _value._discoveryHandles
          : discoveryHandles // ignore: cast_nullable_to_non_nullable
              as List<DiscoveryHandle>,
    ));
  }
}

/// @nodoc

class _$ActiveImpl extends _Active {
  const _$ActiveImpl(
      this.currentIp, final List<DiscoveryHandle> discoveryHandles)
      : _discoveryHandles = discoveryHandles,
        super._();

  @override
  final String? currentIp;
  final List<DiscoveryHandle> _discoveryHandles;
  @override
  List<DiscoveryHandle> get discoveryHandles {
    if (_discoveryHandles is EqualUnmodifiableListView)
      return _discoveryHandles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_discoveryHandles);
  }

  @override
  String toString() {
    return 'CameraDiscoveryState.active(currentIp: $currentIp, discoveryHandles: $discoveryHandles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActiveImpl &&
            (identical(other.currentIp, currentIp) ||
                other.currentIp == currentIp) &&
            const DeepCollectionEquality()
                .equals(other._discoveryHandles, _discoveryHandles));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentIp,
      const DeepCollectionEquality().hash(_discoveryHandles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActiveImplCopyWith<_$ActiveImpl> get copyWith =>
      __$$ActiveImplCopyWithImpl<_$ActiveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initInProgress,
    required TResult Function(
            String? currentIp, List<DiscoveryHandle> discoveryHandles)
        active,
    required TResult Function(String? currentIp) paused,
    required TResult Function() error,
  }) {
    return active(currentIp, discoveryHandles);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initInProgress,
    TResult? Function(
            String? currentIp, List<DiscoveryHandle> discoveryHandles)?
        active,
    TResult? Function(String? currentIp)? paused,
    TResult? Function()? error,
  }) {
    return active?.call(currentIp, discoveryHandles);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initInProgress,
    TResult Function(String? currentIp, List<DiscoveryHandle> discoveryHandles)?
        active,
    TResult Function(String? currentIp)? paused,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active(currentIp, discoveryHandles);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitInProgress value) initInProgress,
    required TResult Function(_Active value) active,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Error value) error,
  }) {
    return active(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitInProgress value)? initInProgress,
    TResult? Function(_Active value)? active,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Error value)? error,
  }) {
    return active?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitInProgress value)? initInProgress,
    TResult Function(_Active value)? active,
    TResult Function(_Paused value)? paused,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active(this);
    }
    return orElse();
  }
}

abstract class _Active extends CameraDiscoveryState {
  const factory _Active(final String? currentIp,
      final List<DiscoveryHandle> discoveryHandles) = _$ActiveImpl;
  const _Active._() : super._();

  String? get currentIp;
  List<DiscoveryHandle> get discoveryHandles;
  @JsonKey(ignore: true)
  _$$ActiveImplCopyWith<_$ActiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PausedImplCopyWith<$Res> {
  factory _$$PausedImplCopyWith(
          _$PausedImpl value, $Res Function(_$PausedImpl) then) =
      __$$PausedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? currentIp});
}

/// @nodoc
class __$$PausedImplCopyWithImpl<$Res>
    extends _$CameraDiscoveryStateCopyWithImpl<$Res, _$PausedImpl>
    implements _$$PausedImplCopyWith<$Res> {
  __$$PausedImplCopyWithImpl(
      _$PausedImpl _value, $Res Function(_$PausedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIp = freezed,
  }) {
    return _then(_$PausedImpl(
      freezed == currentIp
          ? _value.currentIp
          : currentIp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PausedImpl extends _Paused {
  const _$PausedImpl(this.currentIp) : super._();

  @override
  final String? currentIp;

  @override
  String toString() {
    return 'CameraDiscoveryState.paused(currentIp: $currentIp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PausedImpl &&
            (identical(other.currentIp, currentIp) ||
                other.currentIp == currentIp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentIp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PausedImplCopyWith<_$PausedImpl> get copyWith =>
      __$$PausedImplCopyWithImpl<_$PausedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() initInProgress,
    required TResult Function(
            String? currentIp, List<DiscoveryHandle> discoveryHandles)
        active,
    required TResult Function(String? currentIp) paused,
    required TResult Function() error,
  }) {
    return paused(currentIp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initInProgress,
    TResult? Function(
            String? currentIp, List<DiscoveryHandle> discoveryHandles)?
        active,
    TResult? Function(String? currentIp)? paused,
    TResult? Function()? error,
  }) {
    return paused?.call(currentIp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initInProgress,
    TResult Function(String? currentIp, List<DiscoveryHandle> discoveryHandles)?
        active,
    TResult Function(String? currentIp)? paused,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(currentIp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InitInProgress value) initInProgress,
    required TResult Function(_Active value) active,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Error value) error,
  }) {
    return paused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitInProgress value)? initInProgress,
    TResult? Function(_Active value)? active,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Error value)? error,
  }) {
    return paused?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitInProgress value)? initInProgress,
    TResult Function(_Active value)? active,
    TResult Function(_Paused value)? paused,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(this);
    }
    return orElse();
  }
}

abstract class _Paused extends CameraDiscoveryState {
  const factory _Paused(final String? currentIp) = _$PausedImpl;
  const _Paused._() : super._();

  String? get currentIp;
  @JsonKey(ignore: true)
  _$$PausedImplCopyWith<_$PausedImpl> get copyWith =>
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
    extends _$CameraDiscoveryStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorImpl extends _Error {
  const _$ErrorImpl() : super._();

  @override
  String toString() {
    return 'CameraDiscoveryState.error()';
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
    required TResult Function() initInProgress,
    required TResult Function(
            String? currentIp, List<DiscoveryHandle> discoveryHandles)
        active,
    required TResult Function(String? currentIp) paused,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? initInProgress,
    TResult? Function(
            String? currentIp, List<DiscoveryHandle> discoveryHandles)?
        active,
    TResult? Function(String? currentIp)? paused,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? initInProgress,
    TResult Function(String? currentIp, List<DiscoveryHandle> discoveryHandles)?
        active,
    TResult Function(String? currentIp)? paused,
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
    required TResult Function(_InitInProgress value) initInProgress,
    required TResult Function(_Active value) active,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InitInProgress value)? initInProgress,
    TResult? Function(_Active value)? active,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InitInProgress value)? initInProgress,
    TResult Function(_Active value)? active,
    TResult Function(_Paused value)? paused,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error extends CameraDiscoveryState {
  const factory _Error() = _$ErrorImpl;
  const _Error._() : super._();
}
