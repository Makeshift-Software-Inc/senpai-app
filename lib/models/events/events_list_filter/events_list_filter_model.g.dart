// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_list_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventsListFilterModelImpl _$$EventsListFilterModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EventsListFilterModelImpl(
      milesAway: json['milesAway'] as int,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      userId: json['userId'] as String?,
      isFree: json['isFree'] as bool?,
      isPaid: json['isPaid'] as bool?,
      cosplayStatus:
          $enumDecodeNullable(_$CosplayStatusEnumMap, json['cosplayStatus']),
      hostRating: (json['hostRating'] as num?)?.toDouble(),
      paymentRequired: json['paymentRequired'] as bool?,
    );

Map<String, dynamic> _$$EventsListFilterModelImplToJson(
        _$EventsListFilterModelImpl instance) =>
    <String, dynamic>{
      'milesAway': instance.milesAway,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'userId': instance.userId,
      'isFree': instance.isFree,
      'isPaid': instance.isPaid,
      'cosplayStatus': _$CosplayStatusEnumMap[instance.cosplayStatus],
      'hostRating': instance.hostRating,
      'paymentRequired': instance.paymentRequired,
    };

const _$CosplayStatusEnumMap = {
  CosplayStatus.required: 'required',
  CosplayStatus.optional: 'optional',
  CosplayStatus.no: 'no',
};
