// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventModel _$EventModelFromJson(Map<String, dynamic> json) {
  return _EventModel.fromJson(json);
}

/// @nodoc
mixin _$EventModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  String get coverImageUrl => throw _privateConstructorUsedError;
  String? get fullAddress => throw _privateConstructorUsedError;
  String? get displayCity => throw _privateConstructorUsedError;
  String? get displayState => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  String? get lonlat => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  bool? get paymentRequired => throw _privateConstructorUsedError;
  String? get cosplayRequired => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get venue => throw _privateConstructorUsedError;
  PartyModel? get party => throw _privateConstructorUsedError;
  int? get hostId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventModelCopyWith<EventModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventModelCopyWith<$Res> {
  factory $EventModelCopyWith(
          EventModel value, $Res Function(EventModel) then) =
      _$EventModelCopyWithImpl<$Res, EventModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      DateTime startDate,
      String coverImageUrl,
      String? fullAddress,
      String? displayCity,
      String? displayState,
      DateTime? endDate,
      String? lonlat,
      String? country,
      bool? paymentRequired,
      String? cosplayRequired,
      String? description,
      String? venue,
      PartyModel? party,
      int? hostId});

  $PartyModelCopyWith<$Res>? get party;
}

/// @nodoc
class _$EventModelCopyWithImpl<$Res, $Val extends EventModel>
    implements $EventModelCopyWith<$Res> {
  _$EventModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? startDate = null,
    Object? coverImageUrl = null,
    Object? fullAddress = freezed,
    Object? displayCity = freezed,
    Object? displayState = freezed,
    Object? endDate = freezed,
    Object? lonlat = freezed,
    Object? country = freezed,
    Object? paymentRequired = freezed,
    Object? cosplayRequired = freezed,
    Object? description = freezed,
    Object? venue = freezed,
    Object? party = freezed,
    Object? hostId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      coverImageUrl: null == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fullAddress: freezed == fullAddress
          ? _value.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      displayCity: freezed == displayCity
          ? _value.displayCity
          : displayCity // ignore: cast_nullable_to_non_nullable
              as String?,
      displayState: freezed == displayState
          ? _value.displayState
          : displayState // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lonlat: freezed == lonlat
          ? _value.lonlat
          : lonlat // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentRequired: freezed == paymentRequired
          ? _value.paymentRequired
          : paymentRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      cosplayRequired: freezed == cosplayRequired
          ? _value.cosplayRequired
          : cosplayRequired // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      venue: freezed == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as String?,
      party: freezed == party
          ? _value.party
          : party // ignore: cast_nullable_to_non_nullable
              as PartyModel?,
      hostId: freezed == hostId
          ? _value.hostId
          : hostId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PartyModelCopyWith<$Res>? get party {
    if (_value.party == null) {
      return null;
    }

    return $PartyModelCopyWith<$Res>(_value.party!, (value) {
      return _then(_value.copyWith(party: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventModelImplCopyWith<$Res>
    implements $EventModelCopyWith<$Res> {
  factory _$$EventModelImplCopyWith(
          _$EventModelImpl value, $Res Function(_$EventModelImpl) then) =
      __$$EventModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      DateTime startDate,
      String coverImageUrl,
      String? fullAddress,
      String? displayCity,
      String? displayState,
      DateTime? endDate,
      String? lonlat,
      String? country,
      bool? paymentRequired,
      String? cosplayRequired,
      String? description,
      String? venue,
      PartyModel? party,
      int? hostId});

  @override
  $PartyModelCopyWith<$Res>? get party;
}

/// @nodoc
class __$$EventModelImplCopyWithImpl<$Res>
    extends _$EventModelCopyWithImpl<$Res, _$EventModelImpl>
    implements _$$EventModelImplCopyWith<$Res> {
  __$$EventModelImplCopyWithImpl(
      _$EventModelImpl _value, $Res Function(_$EventModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? startDate = null,
    Object? coverImageUrl = null,
    Object? fullAddress = freezed,
    Object? displayCity = freezed,
    Object? displayState = freezed,
    Object? endDate = freezed,
    Object? lonlat = freezed,
    Object? country = freezed,
    Object? paymentRequired = freezed,
    Object? cosplayRequired = freezed,
    Object? description = freezed,
    Object? venue = freezed,
    Object? party = freezed,
    Object? hostId = freezed,
  }) {
    return _then(_$EventModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      coverImageUrl: null == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fullAddress: freezed == fullAddress
          ? _value.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      displayCity: freezed == displayCity
          ? _value.displayCity
          : displayCity // ignore: cast_nullable_to_non_nullable
              as String?,
      displayState: freezed == displayState
          ? _value.displayState
          : displayState // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lonlat: freezed == lonlat
          ? _value.lonlat
          : lonlat // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentRequired: freezed == paymentRequired
          ? _value.paymentRequired
          : paymentRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      cosplayRequired: freezed == cosplayRequired
          ? _value.cosplayRequired
          : cosplayRequired // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      venue: freezed == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as String?,
      party: freezed == party
          ? _value.party
          : party // ignore: cast_nullable_to_non_nullable
              as PartyModel?,
      hostId: freezed == hostId
          ? _value.hostId
          : hostId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventModelImpl implements _EventModel {
  const _$EventModelImpl(
      {required this.id,
      required this.title,
      required this.startDate,
      required this.coverImageUrl,
      this.fullAddress,
      this.displayCity,
      this.displayState,
      this.endDate,
      this.lonlat,
      this.country,
      this.paymentRequired,
      this.cosplayRequired,
      this.description,
      this.venue,
      this.party,
      this.hostId});

  factory _$EventModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final DateTime startDate;
  @override
  final String coverImageUrl;
  @override
  final String? fullAddress;
  @override
  final String? displayCity;
  @override
  final String? displayState;
  @override
  final DateTime? endDate;
  @override
  final String? lonlat;
  @override
  final String? country;
  @override
  final bool? paymentRequired;
  @override
  final String? cosplayRequired;
  @override
  final String? description;
  @override
  final String? venue;
  @override
  final PartyModel? party;
  @override
  final int? hostId;

  @override
  String toString() {
    return 'EventModel(id: $id, title: $title, startDate: $startDate, coverImageUrl: $coverImageUrl, fullAddress: $fullAddress, displayCity: $displayCity, displayState: $displayState, endDate: $endDate, lonlat: $lonlat, country: $country, paymentRequired: $paymentRequired, cosplayRequired: $cosplayRequired, description: $description, venue: $venue, party: $party, hostId: $hostId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                other.coverImageUrl == coverImageUrl) &&
            (identical(other.fullAddress, fullAddress) ||
                other.fullAddress == fullAddress) &&
            (identical(other.displayCity, displayCity) ||
                other.displayCity == displayCity) &&
            (identical(other.displayState, displayState) ||
                other.displayState == displayState) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.lonlat, lonlat) || other.lonlat == lonlat) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.paymentRequired, paymentRequired) ||
                other.paymentRequired == paymentRequired) &&
            (identical(other.cosplayRequired, cosplayRequired) ||
                other.cosplayRequired == cosplayRequired) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.venue, venue) || other.venue == venue) &&
            (identical(other.party, party) || other.party == party) &&
            (identical(other.hostId, hostId) || other.hostId == hostId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      startDate,
      coverImageUrl,
      fullAddress,
      displayCity,
      displayState,
      endDate,
      lonlat,
      country,
      paymentRequired,
      cosplayRequired,
      description,
      venue,
      party,
      hostId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventModelImplCopyWith<_$EventModelImpl> get copyWith =>
      __$$EventModelImplCopyWithImpl<_$EventModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventModelImplToJson(
      this,
    );
  }
}

abstract class _EventModel implements EventModel {
  const factory _EventModel(
      {required final String id,
      required final String title,
      required final DateTime startDate,
      required final String coverImageUrl,
      final String? fullAddress,
      final String? displayCity,
      final String? displayState,
      final DateTime? endDate,
      final String? lonlat,
      final String? country,
      final bool? paymentRequired,
      final String? cosplayRequired,
      final String? description,
      final String? venue,
      final PartyModel? party,
      final int? hostId}) = _$EventModelImpl;

  factory _EventModel.fromJson(Map<String, dynamic> json) =
      _$EventModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  DateTime get startDate;
  @override
  String get coverImageUrl;
  @override
  String? get fullAddress;
  @override
  String? get displayCity;
  @override
  String? get displayState;
  @override
  DateTime? get endDate;
  @override
  String? get lonlat;
  @override
  String? get country;
  @override
  bool? get paymentRequired;
  @override
  String? get cosplayRequired;
  @override
  String? get description;
  @override
  String? get venue;
  @override
  PartyModel? get party;
  @override
  int? get hostId;
  @override
  @JsonKey(ignore: true)
  _$$EventModelImplCopyWith<_$EventModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
