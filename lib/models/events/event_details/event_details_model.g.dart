// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventDetailsModelImpl _$$EventDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EventDetailsModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      startDate: DateTime.parse(json['startDate'] as String),
      coverImageUrl: json['coverImageUrl'] as String,
      fullAddress: json['fullAddress'] as String?,
      venue: json['venue'] as String?,
      displayCity: json['displayCity'] as String?,
      displayState: json['displayState'] as String?,
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      lonlat: json['lonlat'] as String?,
      country: json['country'] as String?,
      paymentRequired: json['paymentRequired'] as bool?,
      cosplayRequired: json['cosplayRequired'] as int?,
      conventionId: json['conventionId'] as int?,
      party: json['party'] == null
          ? null
          : PartyModel.fromJson(json['party'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EventDetailsModelImplToJson(
        _$EventDetailsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'startDate': instance.startDate.toIso8601String(),
      'coverImageUrl': instance.coverImageUrl,
      'fullAddress': instance.fullAddress,
      'venue': instance.venue,
      'displayCity': instance.displayCity,
      'displayState': instance.displayState,
      'endDate': instance.endDate?.toIso8601String(),
      'lonlat': instance.lonlat,
      'country': instance.country,
      'paymentRequired': instance.paymentRequired,
      'cosplayRequired': instance.cosplayRequired,
      'conventionId': instance.conventionId,
      'party': instance.party,
    };
