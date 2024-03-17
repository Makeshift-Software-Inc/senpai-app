// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'convention_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConventionModelImpl _$$ConventionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ConventionModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      coverImageUrl: json['coverImageUrl'] as String,
      fullAddress: json['fullAddress'] as String?,
      displayCity: json['displayCity'] as String?,
      displayState: json['displayState'] as String?,
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      lonlat: json['lonlat'] as String?,
      website: json['website'] as String?,
      paymentRequired: json['paymentRequired'] as bool?,
    );

Map<String, dynamic> _$$ConventionModelImplToJson(
        _$ConventionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'startDate': instance.startDate.toIso8601String(),
      'coverImageUrl': instance.coverImageUrl,
      'fullAddress': instance.fullAddress,
      'displayCity': instance.displayCity,
      'displayState': instance.displayState,
      'endDate': instance.endDate?.toIso8601String(),
      'lonlat': instance.lonlat,
      'website': instance.website,
      'paymentRequired': instance.paymentRequired,
    };
