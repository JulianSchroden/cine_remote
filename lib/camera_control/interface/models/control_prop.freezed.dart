// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  ControlPropValue get currentValue => throw _privateConstructorUsedError;
  List<ControlPropValue> get allowedValues =>
      throw _privateConstructorUsedError;
  DateTime? get pendingSince => throw _privateConstructorUsedError;

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
      ControlPropValue currentValue,
      List<ControlPropValue> allowedValues,
      DateTime? pendingSince});
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
    Object? pendingSince = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ControlPropType,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as ControlPropValue,
      allowedValues: null == allowedValues
          ? _value.allowedValues
          : allowedValues // ignore: cast_nullable_to_non_nullable
              as List<ControlPropValue>,
      pendingSince: freezed == pendingSince
          ? _value.pendingSince
          : pendingSince // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      ControlPropValue currentValue,
      List<ControlPropValue> allowedValues,
      DateTime? pendingSince});
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
    Object? pendingSince = freezed,
  }) {
    return _then(_$_ControlProp(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ControlPropType,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as ControlPropValue,
      allowedValues: null == allowedValues
          ? _value._allowedValues
          : allowedValues // ignore: cast_nullable_to_non_nullable
              as List<ControlPropValue>,
      pendingSince: freezed == pendingSince
          ? _value.pendingSince
          : pendingSince // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_ControlProp extends _ControlProp {
  const _$_ControlProp(
      {required this.type,
      required this.currentValue,
      required final List<ControlPropValue> allowedValues,
      this.pendingSince})
      : _allowedValues = allowedValues,
        super._();

  @override
  final ControlPropType type;
  @override
  final ControlPropValue currentValue;
  final List<ControlPropValue> _allowedValues;
  @override
  List<ControlPropValue> get allowedValues {
    if (_allowedValues is EqualUnmodifiableListView) return _allowedValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allowedValues);
  }

  @override
  final DateTime? pendingSince;

  @override
  String toString() {
    return 'ControlProp(type: $type, currentValue: $currentValue, allowedValues: $allowedValues, pendingSince: $pendingSince)';
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
            (identical(other.pendingSince, pendingSince) ||
                other.pendingSince == pendingSince));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, currentValue,
      const DeepCollectionEquality().hash(_allowedValues), pendingSince);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ControlPropCopyWith<_$_ControlProp> get copyWith =>
      __$$_ControlPropCopyWithImpl<_$_ControlProp>(this, _$identity);
}

abstract class _ControlProp extends ControlProp {
  const factory _ControlProp(
      {required final ControlPropType type,
      required final ControlPropValue currentValue,
      required final List<ControlPropValue> allowedValues,
      final DateTime? pendingSince}) = _$_ControlProp;
  const _ControlProp._() : super._();

  @override
  ControlPropType get type;
  @override
  ControlPropValue get currentValue;
  @override
  List<ControlPropValue> get allowedValues;
  @override
  DateTime? get pendingSince;
  @override
  @JsonKey(ignore: true)
  _$$_ControlPropCopyWith<_$_ControlProp> get copyWith =>
      throw _privateConstructorUsedError;
}
