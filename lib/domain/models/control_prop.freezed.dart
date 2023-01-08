// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'control_prop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ControlProp {
  ControlPropType get type => throw _privateConstructorUsedError;
  String get currentValue => throw _privateConstructorUsedError;
  List<String> get allowedValues => throw _privateConstructorUsedError;
  bool get isPending => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ControlPropCopyWith<ControlProp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ControlPropCopyWith<$Res> {
  factory $ControlPropCopyWith(
          ControlProp value, $Res Function(ControlProp) then) =
      _$ControlPropCopyWithImpl<$Res, ControlProp>;
  @useResult
  $Res call(
      {ControlPropType type,
      String currentValue,
      List<String> allowedValues,
      bool isPending});
}

/// @nodoc
class _$ControlPropCopyWithImpl<$Res, $Val extends ControlProp>
    implements $ControlPropCopyWith<$Res> {
  _$ControlPropCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? currentValue = null,
    Object? allowedValues = null,
    Object? isPending = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ControlPropType,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as String,
      allowedValues: null == allowedValues
          ? _value.allowedValues
          : allowedValues // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isPending: null == isPending
          ? _value.isPending
          : isPending // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ControlPropCopyWith<$Res>
    implements $ControlPropCopyWith<$Res> {
  factory _$$_ControlPropCopyWith(
          _$_ControlProp value, $Res Function(_$_ControlProp) then) =
      __$$_ControlPropCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ControlPropType type,
      String currentValue,
      List<String> allowedValues,
      bool isPending});
}

/// @nodoc
class __$$_ControlPropCopyWithImpl<$Res>
    extends _$ControlPropCopyWithImpl<$Res, _$_ControlProp>
    implements _$$_ControlPropCopyWith<$Res> {
  __$$_ControlPropCopyWithImpl(
      _$_ControlProp _value, $Res Function(_$_ControlProp) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? currentValue = null,
    Object? allowedValues = null,
    Object? isPending = null,
  }) {
    return _then(_$_ControlProp(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ControlPropType,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as String,
      allowedValues: null == allowedValues
          ? _value._allowedValues
          : allowedValues // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isPending: null == isPending
          ? _value.isPending
          : isPending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ControlProp implements _ControlProp {
  const _$_ControlProp(
      {required this.type,
      required this.currentValue,
      required final List<String> allowedValues,
      this.isPending = false})
      : _allowedValues = allowedValues;

  @override
  final ControlPropType type;
  @override
  final String currentValue;
  final List<String> _allowedValues;
  @override
  List<String> get allowedValues {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allowedValues);
  }

  @override
  @JsonKey()
  final bool isPending;

  @override
  String toString() {
    return 'ControlProp(type: $type, currentValue: $currentValue, allowedValues: $allowedValues, isPending: $isPending)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ControlProp &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            const DeepCollectionEquality()
                .equals(other._allowedValues, _allowedValues) &&
            (identical(other.isPending, isPending) ||
                other.isPending == isPending));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, currentValue,
      const DeepCollectionEquality().hash(_allowedValues), isPending);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ControlPropCopyWith<_$_ControlProp> get copyWith =>
      __$$_ControlPropCopyWithImpl<_$_ControlProp>(this, _$identity);
}

abstract class _ControlProp implements ControlProp {
  const factory _ControlProp(
      {required final ControlPropType type,
      required final String currentValue,
      required final List<String> allowedValues,
      final bool isPending}) = _$_ControlProp;

  @override
  ControlPropType get type;
  @override
  String get currentValue;
  @override
  List<String> get allowedValues;
  @override
  bool get isPending;
  @override
  @JsonKey(ignore: true)
  _$$_ControlPropCopyWith<_$_ControlProp> get copyWith =>
      throw _privateConstructorUsedError;
}
