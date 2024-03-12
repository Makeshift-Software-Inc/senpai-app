// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewEventModel _$$_NewEventModelFromJson(Map<String, dynamic> json) =>
    _$_NewEventModel(
      title: json['title'] as String,
      userId: json['userId'] as String,
      venue: json['venue'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      description: json['description'] as String,
      fullAddress: json['fullAddress'] as String,
      memberLimit: json['memberLimit'] as int,
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      cosplayRequired: json['cosplayRequired'] as String?,
      paymentRequired: json['paymentRequired'] as bool?,
      conventionId: json['conventionId'] as int?,
    );

Map<String, dynamic> _$$_NewEventModelToJson(_$_NewEventModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'userId': instance.userId,
      'venue': instance.venue,
      'startDate': instance.startDate.toIso8601String(),
      'description': instance.description,
      'fullAddress': instance.fullAddress,
      'memberLimit': instance.memberLimit,
      'endDate': instance.endDate?.toIso8601String(),
      'cosplayRequired': instance.cosplayRequired,
      'paymentRequired': instance.paymentRequired,
      'conventionId': instance.conventionId,
    };
