// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'party_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PartyModelImpl _$$PartyModelImplFromJson(Map<String, dynamic> json) =>
    _$PartyModelImpl(
      id: json['id'] as String,
      disbanded: json['disbanded'] as bool,
      hostId: json['hostId'] as int?,
      eventId: json['eventId'] as int,
      status: json['status'] as String,
      members: (json['members'] as List<dynamic>)
          .map((e) => Member.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PartyModelImplToJson(_$PartyModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'disbanded': instance.disbanded,
      'hostId': instance.hostId,
      'eventId': instance.eventId,
      'status': instance.status,
      'members': instance.members,
    };
