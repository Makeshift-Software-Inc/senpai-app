// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfileFilterModel _$$_ProfileFilterModelFromJson(
        Map<String, dynamic> json) =>
    _$_ProfileFilterModel(
      milesAway: json['milesAway'] as int,
      minAge: json['minAge'] as int,
      maxAge: json['maxAge'] as int,
      hasBio: json['hasBio'] as bool,
      verified: json['verified'] as bool,
      animeIds:
          (json['animeIds'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_ProfileFilterModelToJson(
        _$_ProfileFilterModel instance) =>
    <String, dynamic>{
      'milesAway': instance.milesAway,
      'minAge': instance.minAge,
      'maxAge': instance.maxAge,
      'hasBio': instance.hasBio,
      'verified': instance.verified,
      'animeIds': instance.animeIds,
    };
