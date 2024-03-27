// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JoinRequestModelImpl _$$JoinRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$JoinRequestModelImpl(
      id: json['id'] as String,
      eventId: json['eventId'] as int,
      conversation: json['conversation'] == null
          ? null
          : MatchesUsersConversationModel.fromJson(
              json['conversation'] as Map<String, dynamic>),
      applicant: json['applicant'] == null
          ? null
          : ApplicantModel.fromJson(json['applicant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$JoinRequestModelImplToJson(
        _$JoinRequestModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventId': instance.eventId,
      'conversation': instance.conversation,
      'applicant': instance.applicant,
    };
