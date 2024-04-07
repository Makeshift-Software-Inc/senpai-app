// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'party_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PartyModelImpl _$$PartyModelImplFromJson(Map<String, dynamic> json) =>
    _$PartyModelImpl(
      id: json['id'] as int,
      hostId: json['hostId'] as int,
      disbanded: json['disbanded'] as bool?,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$PartyModelImplToJson(_$PartyModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hostId': instance.hostId,
      'disbanded': instance.disbanded,
      'status': instance.status,
    };
