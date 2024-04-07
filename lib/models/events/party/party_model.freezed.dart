// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'party_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PartyModel _$PartyModelFromJson(Map<String, dynamic> json) {
  return _PartyModel.fromJson(json);
}

/// @nodoc
mixin _$PartyModel {
  int get id => throw _privateConstructorUsedError;
  int get hostId => throw _privateConstructorUsedError;
  bool? get disbanded => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartyModelCopyWith<PartyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartyModelCopyWith<$Res> {
  factory $PartyModelCopyWith(
          PartyModel value, $Res Function(PartyModel) then) =
      _$PartyModelCopyWithImpl<$Res, PartyModel>;
  @useResult
  $Res call({int id, int hostId, bool? disbanded, String status});
}

/// @nodoc
class _$PartyModelCopyWithImpl<$Res, $Val extends PartyModel>
    implements $PartyModelCopyWith<$Res> {
  _$PartyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hostId = null,
    Object? disbanded = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      hostId: null == hostId
          ? _value.hostId
          : hostId // ignore: cast_nullable_to_non_nullable
              as int,
      disbanded: freezed == disbanded
          ? _value.disbanded
          : disbanded // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PartyModelImplCopyWith<$Res>
    implements $PartyModelCopyWith<$Res> {
  factory _$$PartyModelImplCopyWith(
          _$PartyModelImpl value, $Res Function(_$PartyModelImpl) then) =
      __$$PartyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int hostId, bool? disbanded, String status});
}

/// @nodoc
class __$$PartyModelImplCopyWithImpl<$Res>
    extends _$PartyModelCopyWithImpl<$Res, _$PartyModelImpl>
    implements _$$PartyModelImplCopyWith<$Res> {
  __$$PartyModelImplCopyWithImpl(
      _$PartyModelImpl _value, $Res Function(_$PartyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hostId = null,
    Object? disbanded = freezed,
    Object? status = null,
  }) {
    return _then(_$PartyModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      hostId: null == hostId
          ? _value.hostId
          : hostId // ignore: cast_nullable_to_non_nullable
              as int,
      disbanded: freezed == disbanded
          ? _value.disbanded
          : disbanded // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PartyModelImpl implements _PartyModel {
  const _$PartyModelImpl(
      {required this.id,
      required this.hostId,
      this.disbanded,
      required this.status});

  factory _$PartyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartyModelImplFromJson(json);

  @override
  final int id;
  @override
  final int hostId;
  @override
  final bool? disbanded;
  @override
  final String status;

  @override
  String toString() {
    return 'PartyModel(id: $id, hostId: $hostId, disbanded: $disbanded, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartyModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hostId, hostId) || other.hostId == hostId) &&
            (identical(other.disbanded, disbanded) ||
                other.disbanded == disbanded) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, hostId, disbanded, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PartyModelImplCopyWith<_$PartyModelImpl> get copyWith =>
      __$$PartyModelImplCopyWithImpl<_$PartyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PartyModelImplToJson(
      this,
    );
  }
}

abstract class _PartyModel implements PartyModel {
  const factory _PartyModel(
      {required final int id,
      required final int hostId,
      final bool? disbanded,
      required final String status}) = _$PartyModelImpl;

  factory _PartyModel.fromJson(Map<String, dynamic> json) =
      _$PartyModelImpl.fromJson;

  @override
  int get id;
  @override
  int get hostId;
  @override
  bool? get disbanded;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$PartyModelImplCopyWith<_$PartyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
