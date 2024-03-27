// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'applicant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApplicantModel _$ApplicantModelFromJson(Map<String, dynamic> json) {
  return _ApplicantModel.fromJson(json);
}

/// @nodoc
mixin _$ApplicantModel {
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplicantModelCopyWith<ApplicantModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicantModelCopyWith<$Res> {
  factory $ApplicantModelCopyWith(
          ApplicantModel value, $Res Function(ApplicantModel) then) =
      _$ApplicantModelCopyWithImpl<$Res, ApplicantModel>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$ApplicantModelCopyWithImpl<$Res, $Val extends ApplicantModel>
    implements $ApplicantModelCopyWith<$Res> {
  _$ApplicantModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApplicantModelImplCopyWith<$Res>
    implements $ApplicantModelCopyWith<$Res> {
  factory _$$ApplicantModelImplCopyWith(_$ApplicantModelImpl value,
          $Res Function(_$ApplicantModelImpl) then) =
      __$$ApplicantModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$ApplicantModelImplCopyWithImpl<$Res>
    extends _$ApplicantModelCopyWithImpl<$Res, _$ApplicantModelImpl>
    implements _$$ApplicantModelImplCopyWith<$Res> {
  __$$ApplicantModelImplCopyWithImpl(
      _$ApplicantModelImpl _value, $Res Function(_$ApplicantModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$ApplicantModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApplicantModelImpl implements _ApplicantModel {
  const _$ApplicantModelImpl({required this.id});

  factory _$ApplicantModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplicantModelImplFromJson(json);

  @override
  final String id;

  @override
  String toString() {
    return 'ApplicantModel(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicantModelImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicantModelImplCopyWith<_$ApplicantModelImpl> get copyWith =>
      __$$ApplicantModelImplCopyWithImpl<_$ApplicantModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplicantModelImplToJson(
      this,
    );
  }
}

abstract class _ApplicantModel implements ApplicantModel {
  const factory _ApplicantModel({required final String id}) =
      _$ApplicantModelImpl;

  factory _ApplicantModel.fromJson(Map<String, dynamic> json) =
      _$ApplicantModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$ApplicantModelImplCopyWith<_$ApplicantModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
