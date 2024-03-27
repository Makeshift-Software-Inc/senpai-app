// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'join_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JoinRequestModel _$JoinRequestModelFromJson(Map<String, dynamic> json) {
  return _JoinRequestModel.fromJson(json);
}

/// @nodoc
mixin _$JoinRequestModel {
  String get id => throw _privateConstructorUsedError;
  int get eventId => throw _privateConstructorUsedError;
  MatchesUsersConversationModel? get conversation =>
      throw _privateConstructorUsedError;
  ApplicantModel? get applicant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JoinRequestModelCopyWith<JoinRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinRequestModelCopyWith<$Res> {
  factory $JoinRequestModelCopyWith(
          JoinRequestModel value, $Res Function(JoinRequestModel) then) =
      _$JoinRequestModelCopyWithImpl<$Res, JoinRequestModel>;
  @useResult
  $Res call(
      {String id,
      int eventId,
      MatchesUsersConversationModel? conversation,
      ApplicantModel? applicant});

  $MatchesUsersConversationModelCopyWith<$Res>? get conversation;
  $ApplicantModelCopyWith<$Res>? get applicant;
}

/// @nodoc
class _$JoinRequestModelCopyWithImpl<$Res, $Val extends JoinRequestModel>
    implements $JoinRequestModelCopyWith<$Res> {
  _$JoinRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventId = null,
    Object? conversation = freezed,
    Object? applicant = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
      conversation: freezed == conversation
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as MatchesUsersConversationModel?,
      applicant: freezed == applicant
          ? _value.applicant
          : applicant // ignore: cast_nullable_to_non_nullable
              as ApplicantModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MatchesUsersConversationModelCopyWith<$Res>? get conversation {
    if (_value.conversation == null) {
      return null;
    }

    return $MatchesUsersConversationModelCopyWith<$Res>(_value.conversation!,
        (value) {
      return _then(_value.copyWith(conversation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ApplicantModelCopyWith<$Res>? get applicant {
    if (_value.applicant == null) {
      return null;
    }

    return $ApplicantModelCopyWith<$Res>(_value.applicant!, (value) {
      return _then(_value.copyWith(applicant: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JoinRequestModelImplCopyWith<$Res>
    implements $JoinRequestModelCopyWith<$Res> {
  factory _$$JoinRequestModelImplCopyWith(_$JoinRequestModelImpl value,
          $Res Function(_$JoinRequestModelImpl) then) =
      __$$JoinRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int eventId,
      MatchesUsersConversationModel? conversation,
      ApplicantModel? applicant});

  @override
  $MatchesUsersConversationModelCopyWith<$Res>? get conversation;
  @override
  $ApplicantModelCopyWith<$Res>? get applicant;
}

/// @nodoc
class __$$JoinRequestModelImplCopyWithImpl<$Res>
    extends _$JoinRequestModelCopyWithImpl<$Res, _$JoinRequestModelImpl>
    implements _$$JoinRequestModelImplCopyWith<$Res> {
  __$$JoinRequestModelImplCopyWithImpl(_$JoinRequestModelImpl _value,
      $Res Function(_$JoinRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventId = null,
    Object? conversation = freezed,
    Object? applicant = freezed,
  }) {
    return _then(_$JoinRequestModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
      conversation: freezed == conversation
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as MatchesUsersConversationModel?,
      applicant: freezed == applicant
          ? _value.applicant
          : applicant // ignore: cast_nullable_to_non_nullable
              as ApplicantModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JoinRequestModelImpl implements _JoinRequestModel {
  const _$JoinRequestModelImpl(
      {required this.id,
      required this.eventId,
      this.conversation,
      this.applicant});

  factory _$JoinRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JoinRequestModelImplFromJson(json);

  @override
  final String id;
  @override
  final int eventId;
  @override
  final MatchesUsersConversationModel? conversation;
  @override
  final ApplicantModel? applicant;

  @override
  String toString() {
    return 'JoinRequestModel(id: $id, eventId: $eventId, conversation: $conversation, applicant: $applicant)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinRequestModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.conversation, conversation) ||
                other.conversation == conversation) &&
            (identical(other.applicant, applicant) ||
                other.applicant == applicant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, eventId, conversation, applicant);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinRequestModelImplCopyWith<_$JoinRequestModelImpl> get copyWith =>
      __$$JoinRequestModelImplCopyWithImpl<_$JoinRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JoinRequestModelImplToJson(
      this,
    );
  }
}

abstract class _JoinRequestModel implements JoinRequestModel {
  const factory _JoinRequestModel(
      {required final String id,
      required final int eventId,
      final MatchesUsersConversationModel? conversation,
      final ApplicantModel? applicant}) = _$JoinRequestModelImpl;

  factory _JoinRequestModel.fromJson(Map<String, dynamic> json) =
      _$JoinRequestModelImpl.fromJson;

  @override
  String get id;
  @override
  int get eventId;
  @override
  MatchesUsersConversationModel? get conversation;
  @override
  ApplicantModel? get applicant;
  @override
  @JsonKey(ignore: true)
  _$$JoinRequestModelImplCopyWith<_$JoinRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
