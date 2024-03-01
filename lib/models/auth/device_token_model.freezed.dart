// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeviceTokenModel _$DeviceTokenModelFromJson(Map<String, dynamic> json) {
  return _DeviceTokenModel.fromJson(json);
}

/// @nodoc
mixin _$DeviceTokenModel {
  String get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceTokenModelCopyWith<DeviceTokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceTokenModelCopyWith<$Res> {
  factory $DeviceTokenModelCopyWith(
          DeviceTokenModel value, $Res Function(DeviceTokenModel) then) =
      _$DeviceTokenModelCopyWithImpl<$Res, DeviceTokenModel>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class _$DeviceTokenModelCopyWithImpl<$Res, $Val extends DeviceTokenModel>
    implements $DeviceTokenModelCopyWith<$Res> {
  _$DeviceTokenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeviceTokenModelCopyWith<$Res>
    implements $DeviceTokenModelCopyWith<$Res> {
  factory _$$_DeviceTokenModelCopyWith(
          _$_DeviceTokenModel value, $Res Function(_$_DeviceTokenModel) then) =
      __$$_DeviceTokenModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$_DeviceTokenModelCopyWithImpl<$Res>
    extends _$DeviceTokenModelCopyWithImpl<$Res, _$_DeviceTokenModel>
    implements _$$_DeviceTokenModelCopyWith<$Res> {
  __$$_DeviceTokenModelCopyWithImpl(
      _$_DeviceTokenModel _value, $Res Function(_$_DeviceTokenModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$_DeviceTokenModel(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeviceTokenModel implements _DeviceTokenModel {
  const _$_DeviceTokenModel({required this.token});

  factory _$_DeviceTokenModel.fromJson(Map<String, dynamic> json) =>
      _$$_DeviceTokenModelFromJson(json);

  @override
  final String token;

  @override
  String toString() {
    return 'DeviceTokenModel(token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviceTokenModel &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeviceTokenModelCopyWith<_$_DeviceTokenModel> get copyWith =>
      __$$_DeviceTokenModelCopyWithImpl<_$_DeviceTokenModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeviceTokenModelToJson(
      this,
    );
  }
}

abstract class _DeviceTokenModel implements DeviceTokenModel {
  const factory _DeviceTokenModel({required final String token}) =
      _$_DeviceTokenModel;

  factory _DeviceTokenModel.fromJson(Map<String, dynamic> json) =
      _$_DeviceTokenModel.fromJson;

  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceTokenModelCopyWith<_$_DeviceTokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}
