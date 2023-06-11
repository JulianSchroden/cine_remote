// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cached_property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CachedProperty {
  int get propCode => throw _privateConstructorUsedError;
  ControlPropType? get type => throw _privateConstructorUsedError;
  ControlPropValue? get currentValue => throw _privateConstructorUsedError;
  List<ControlPropValue>? get allowedValues =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CachedPropertyCopyWith<CachedProperty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CachedPropertyCopyWith<$Res> {
  factory $CachedPropertyCopyWith(
          CachedProperty value, $Res Function(CachedProperty) then) =
      _$CachedPropertyCopyWithImpl<$Res, CachedProperty>;
  @useResult
  $Res call(
      {int propCode,
      ControlPropType? type,
      ControlPropValue? currentValue,
      List<ControlPropValue>? allowedValues});
}

/// @nodoc
class _$CachedPropertyCopyWithImpl<$Res, $Val extends CachedProperty>
    implements $CachedPropertyCopyWith<$Res> {
  _$CachedPropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propCode = null,
    Object? type = freezed,
    Object? currentValue = freezed,
    Object? allowedValues = freezed,
  }) {
    return _then(_value.copyWith(
      propCode: null == propCode
          ? _value.propCode
          : propCode // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ControlPropType?,
      currentValue: freezed == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as ControlPropValue?,
      allowedValues: freezed == allowedValues
          ? _value.allowedValues
          : allowedValues // ignore: cast_nullable_to_non_nullable
              as List<ControlPropValue>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CachedPropertyCopyWith<$Res>
    implements $CachedPropertyCopyWith<$Res> {
  factory _$$_CachedPropertyCopyWith(
          _$_CachedProperty value, $Res Function(_$_CachedProperty) then) =
      __$$_CachedPropertyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int propCode,
      ControlPropType? type,
      ControlPropValue? currentValue,
      List<ControlPropValue>? allowedValues});
}

/// @nodoc
class __$$_CachedPropertyCopyWithImpl<$Res>
    extends _$CachedPropertyCopyWithImpl<$Res, _$_CachedProperty>
    implements _$$_CachedPropertyCopyWith<$Res> {
  __$$_CachedPropertyCopyWithImpl(
      _$_CachedProperty _value, $Res Function(_$_CachedProperty) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propCode = null,
    Object? type = freezed,
    Object? currentValue = freezed,
    Object? allowedValues = freezed,
  }) {
    return _then(_$_CachedProperty(
      propCode: null == propCode
          ? _value.propCode
          : propCode // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ControlPropType?,
      currentValue: freezed == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as ControlPropValue?,
      allowedValues: freezed == allowedValues
          ? _value._allowedValues
          : allowedValues // ignore: cast_nullable_to_non_nullable
              as List<ControlPropValue>?,
    ));
  }
}

/// @nodoc

class _$_CachedProperty extends _CachedProperty {
  const _$_CachedProperty(
      {required this.propCode,
      this.type,
      this.currentValue,
      final List<ControlPropValue>? allowedValues})
      : _allowedValues = allowedValues,
        super._();

  @override
  final int propCode;
  @override
  final ControlPropType? type;
  @override
  final ControlPropValue? currentValue;
  final List<ControlPropValue>? _allowedValues;
  @override
  List<ControlPropValue>? get allowedValues {
    final value = _allowedValues;
    if (value == null) return null;
    if (_allowedValues is EqualUnmodifiableListView) return _allowedValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CachedProperty(propCode: $propCode, type: $type, currentValue: $currentValue, allowedValues: $allowedValues)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CachedProperty &&
            (identical(other.propCode, propCode) ||
                other.propCode == propCode) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            const DeepCollectionEquality()
                .equals(other._allowedValues, _allowedValues));
  }

  @override
  int get hashCode => Object.hash(runtimeType, propCode, type, currentValue,
      const DeepCollectionEquality().hash(_allowedValues));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CachedPropertyCopyWith<_$_CachedProperty> get copyWith =>
      __$$_CachedPropertyCopyWithImpl<_$_CachedProperty>(this, _$identity);
}

abstract class _CachedProperty extends CachedProperty {
  const factory _CachedProperty(
      {required final int propCode,
      final ControlPropType? type,
      final ControlPropValue? currentValue,
      final List<ControlPropValue>? allowedValues}) = _$_CachedProperty;
  const _CachedProperty._() : super._();

  @override
  int get propCode;
  @override
  ControlPropType? get type;
  @override
  ControlPropValue? get currentValue;
  @override
  List<ControlPropValue>? get allowedValues;
  @override
  @JsonKey(ignore: true)
  _$$_CachedPropertyCopyWith<_$_CachedProperty> get copyWith =>
      throw _privateConstructorUsedError;
}
