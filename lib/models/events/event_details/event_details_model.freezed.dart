// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventDetailsModel _$EventDetailsModelFromJson(Map<String, dynamic> json) {
  return _EventDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$EventDetailsModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  String get coverImageUrl => throw _privateConstructorUsedError;
  String? get fullAddress => throw _privateConstructorUsedError;
  String? get venue => throw _privateConstructorUsedError;
  String? get displayCity => throw _privateConstructorUsedError;
  String? get displayState => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  String? get lonlat => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  bool? get paymentRequired => throw _privateConstructorUsedError;
  int? get cosplayRequired => throw _privateConstructorUsedError;
  int? get conventionId => throw _privateConstructorUsedError;
  PartyModel? get party => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventDetailsModelCopyWith<EventDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventDetailsModelCopyWith<$Res> {
  factory $EventDetailsModelCopyWith(
          EventDetailsModel value, $Res Function(EventDetailsModel) then) =
      _$EventDetailsModelCopyWithImpl<$Res, EventDetailsModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      DateTime startDate,
      String coverImageUrl,
      String? fullAddress,
      String? venue,
      String? displayCity,
      String? displayState,
      DateTime? endDate,
      String? lonlat,
      String? country,
      bool? paymentRequired,
      int? cosplayRequired,
      int? conventionId,
      PartyModel? party});

  $PartyModelCopyWith<$Res>? get party;
}

/// @nodoc
class _$EventDetailsModelCopyWithImpl<$Res, $Val extends EventDetailsModel>
    implements $EventDetailsModelCopyWith<$Res> {
  _$EventDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? startDate = null,
    Object? coverImageUrl = null,
    Object? fullAddress = freezed,
    Object? venue = freezed,
    Object? displayCity = freezed,
    Object? displayState = freezed,
    Object? endDate = freezed,
    Object? lonlat = freezed,
    Object? country = freezed,
    Object? paymentRequired = freezed,
    Object? cosplayRequired = freezed,
    Object? conventionId = freezed,
    Object? party = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
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
      venue: freezed == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
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
              as int?,
      conventionId: freezed == conventionId
          ? _value.conventionId
          : conventionId // ignore: cast_nullable_to_non_nullable
              as int?,
      party: freezed == party
          ? _value.party
          : party // ignore: cast_nullable_to_non_nullable
              as PartyModel?,
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
abstract class _$$EventDetailsModelImplCopyWith<$Res>
    implements $EventDetailsModelCopyWith<$Res> {
  factory _$$EventDetailsModelImplCopyWith(_$EventDetailsModelImpl value,
          $Res Function(_$EventDetailsModelImpl) then) =
      __$$EventDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      DateTime startDate,
      String coverImageUrl,
      String? fullAddress,
      String? venue,
      String? displayCity,
      String? displayState,
      DateTime? endDate,
      String? lonlat,
      String? country,
      bool? paymentRequired,
      int? cosplayRequired,
      int? conventionId,
      PartyModel? party});

  @override
  $PartyModelCopyWith<$Res>? get party;
}

/// @nodoc
class __$$EventDetailsModelImplCopyWithImpl<$Res>
    extends _$EventDetailsModelCopyWithImpl<$Res, _$EventDetailsModelImpl>
    implements _$$EventDetailsModelImplCopyWith<$Res> {
  __$$EventDetailsModelImplCopyWithImpl(_$EventDetailsModelImpl _value,
      $Res Function(_$EventDetailsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? startDate = null,
    Object? coverImageUrl = null,
    Object? fullAddress = freezed,
    Object? venue = freezed,
    Object? displayCity = freezed,
    Object? displayState = freezed,
    Object? endDate = freezed,
    Object? lonlat = freezed,
    Object? country = freezed,
    Object? paymentRequired = freezed,
    Object? cosplayRequired = freezed,
    Object? conventionId = freezed,
    Object? party = freezed,
  }) {
    return _then(_$EventDetailsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
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
      venue: freezed == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
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
              as int?,
      conventionId: freezed == conventionId
          ? _value.conventionId
          : conventionId // ignore: cast_nullable_to_non_nullable
              as int?,
      party: freezed == party
          ? _value.party
          : party // ignore: cast_nullable_to_non_nullable
              as PartyModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventDetailsModelImpl implements _EventDetailsModel {
  const _$EventDetailsModelImpl(
      {required this.id,
      required this.title,
      this.description,
      required this.startDate,
      required this.coverImageUrl,
      this.fullAddress,
      this.venue,
      this.displayCity,
      this.displayState,
      this.endDate,
      this.lonlat,
      this.country,
      this.paymentRequired,
      this.cosplayRequired,
      this.conventionId,
      this.party});

  factory _$EventDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventDetailsModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final DateTime startDate;
  @override
  final String coverImageUrl;
  @override
  final String? fullAddress;
  @override
  final String? venue;
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
  final int? cosplayRequired;
  @override
  final int? conventionId;
  @override
  final PartyModel? party;

  @override
  String toString() {
    return 'EventDetailsModel(id: $id, title: $title, description: $description, startDate: $startDate, coverImageUrl: $coverImageUrl, fullAddress: $fullAddress, venue: $venue, displayCity: $displayCity, displayState: $displayState, endDate: $endDate, lonlat: $lonlat, country: $country, paymentRequired: $paymentRequired, cosplayRequired: $cosplayRequired, conventionId: $conventionId, party: $party)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventDetailsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                other.coverImageUrl == coverImageUrl) &&
            (identical(other.fullAddress, fullAddress) ||
                other.fullAddress == fullAddress) &&
            (identical(other.venue, venue) || other.venue == venue) &&
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
            (identical(other.conventionId, conventionId) ||
                other.conventionId == conventionId) &&
            (identical(other.party, party) || other.party == party));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      startDate,
      coverImageUrl,
      fullAddress,
      venue,
      displayCity,
      displayState,
      endDate,
      lonlat,
      country,
      paymentRequired,
      cosplayRequired,
      conventionId,
      party);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventDetailsModelImplCopyWith<_$EventDetailsModelImpl> get copyWith =>
      __$$EventDetailsModelImplCopyWithImpl<_$EventDetailsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _EventDetailsModel implements EventDetailsModel {
  const factory _EventDetailsModel(
      {required final String id,
      required final String title,
      final String? description,
      required final DateTime startDate,
      required final String coverImageUrl,
      final String? fullAddress,
      final String? venue,
      final String? displayCity,
      final String? displayState,
      final DateTime? endDate,
      final String? lonlat,
      final String? country,
      final bool? paymentRequired,
      final int? cosplayRequired,
      final int? conventionId,
      final PartyModel? party}) = _$EventDetailsModelImpl;

  factory _EventDetailsModel.fromJson(Map<String, dynamic> json) =
      _$EventDetailsModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  DateTime get startDate;
  @override
  String get coverImageUrl;
  @override
  String? get fullAddress;
  @override
  String? get venue;
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
  int? get cosplayRequired;
  @override
  int? get conventionId;
  @override
  PartyModel? get party;
  @override
  @JsonKey(ignore: true)
  _$$EventDetailsModelImplCopyWith<_$EventDetailsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
