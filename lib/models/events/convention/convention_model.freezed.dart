// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'convention_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConventionModel _$ConventionModelFromJson(Map<String, dynamic> json) {
  return _ConventionModel.fromJson(json);
}

/// @nodoc
mixin _$ConventionModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  String get coverImageUrl => throw _privateConstructorUsedError;
  String? get fullAddress => throw _privateConstructorUsedError;
  String? get displayCity => throw _privateConstructorUsedError;
  String? get displayState => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  String? get lonlat => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  bool? get paymentRequired => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<EventModel> get events => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConventionModelCopyWith<ConventionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConventionModelCopyWith<$Res> {
  factory $ConventionModelCopyWith(
          ConventionModel value, $Res Function(ConventionModel) then) =
      _$ConventionModelCopyWithImpl<$Res, ConventionModel>;
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
      String? website,
      bool? paymentRequired,
      String? description,
      List<EventModel> events});
}

/// @nodoc
class _$ConventionModelCopyWithImpl<$Res, $Val extends ConventionModel>
    implements $ConventionModelCopyWith<$Res> {
  _$ConventionModelCopyWithImpl(this._value, this._then);

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
    Object? website = freezed,
    Object? paymentRequired = freezed,
    Object? description = freezed,
    Object? events = null,
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
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentRequired: freezed == paymentRequired
          ? _value.paymentRequired
          : paymentRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConventionModelImplCopyWith<$Res>
    implements $ConventionModelCopyWith<$Res> {
  factory _$$ConventionModelImplCopyWith(_$ConventionModelImpl value,
          $Res Function(_$ConventionModelImpl) then) =
      __$$ConventionModelImplCopyWithImpl<$Res>;
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
      String? website,
      bool? paymentRequired,
      String? description,
      List<EventModel> events});
}

/// @nodoc
class __$$ConventionModelImplCopyWithImpl<$Res>
    extends _$ConventionModelCopyWithImpl<$Res, _$ConventionModelImpl>
    implements _$$ConventionModelImplCopyWith<$Res> {
  __$$ConventionModelImplCopyWithImpl(
      _$ConventionModelImpl _value, $Res Function(_$ConventionModelImpl) _then)
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
    Object? website = freezed,
    Object? paymentRequired = freezed,
    Object? description = freezed,
    Object? events = null,
  }) {
    return _then(_$ConventionModelImpl(
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
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentRequired: freezed == paymentRequired
          ? _value.paymentRequired
          : paymentRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConventionModelImpl implements _ConventionModel {
  const _$ConventionModelImpl(
      {required this.id,
      required this.title,
      required this.startDate,
      required this.coverImageUrl,
      this.fullAddress,
      this.displayCity,
      this.displayState,
      this.endDate,
      this.lonlat,
      this.website,
      this.paymentRequired,
      this.description,
      required final List<EventModel> events})
      : _events = events;

  factory _$ConventionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConventionModelImplFromJson(json);

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
  final String? website;
  @override
  final bool? paymentRequired;
  @override
  final String? description;
  final List<EventModel> _events;
  @override
  List<EventModel> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  String toString() {
    return 'ConventionModel(id: $id, title: $title, startDate: $startDate, coverImageUrl: $coverImageUrl, fullAddress: $fullAddress, displayCity: $displayCity, displayState: $displayState, endDate: $endDate, lonlat: $lonlat, website: $website, paymentRequired: $paymentRequired, description: $description, events: $events)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConventionModelImpl &&
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
            (identical(other.website, website) || other.website == website) &&
            (identical(other.paymentRequired, paymentRequired) ||
                other.paymentRequired == paymentRequired) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._events, _events));
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
      website,
      paymentRequired,
      description,
      const DeepCollectionEquality().hash(_events));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConventionModelImplCopyWith<_$ConventionModelImpl> get copyWith =>
      __$$ConventionModelImplCopyWithImpl<_$ConventionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConventionModelImplToJson(
      this,
    );
  }
}

abstract class _ConventionModel implements ConventionModel {
  const factory _ConventionModel(
      {required final String id,
      required final String title,
      required final DateTime startDate,
      required final String coverImageUrl,
      final String? fullAddress,
      final String? displayCity,
      final String? displayState,
      final DateTime? endDate,
      final String? lonlat,
      final String? website,
      final bool? paymentRequired,
      final String? description,
      required final List<EventModel> events}) = _$ConventionModelImpl;

  factory _ConventionModel.fromJson(Map<String, dynamic> json) =
      _$ConventionModelImpl.fromJson;

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
  String? get website;
  @override
  bool? get paymentRequired;
  @override
  String? get description;
  @override
  List<EventModel> get events;
  @override
  @JsonKey(ignore: true)
  _$$ConventionModelImplCopyWith<_$ConventionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
