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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConventionModel _$ConventionModelFromJson(Map<String, dynamic> json) {
  return _ConventionModel.fromJson(json);
}

/// @nodoc
mixin _$ConventionModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  String? get fullAddress => throw _privateConstructorUsedError;
  String? get displayCity => throw _privateConstructorUsedError;
  String? get displayState => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  String? get lonlat => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;

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
      String? fullAddress,
      String? displayCity,
      String? displayState,
      DateTime? endDate,
      String? lonlat,
      String? website});
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
    Object? fullAddress = freezed,
    Object? displayCity = freezed,
    Object? displayState = freezed,
    Object? endDate = freezed,
    Object? lonlat = freezed,
    Object? website = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConventionModelCopyWith<$Res>
    implements $ConventionModelCopyWith<$Res> {
  factory _$$_ConventionModelCopyWith(
          _$_ConventionModel value, $Res Function(_$_ConventionModel) then) =
      __$$_ConventionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      DateTime startDate,
      String? fullAddress,
      String? displayCity,
      String? displayState,
      DateTime? endDate,
      String? lonlat,
      String? website});
}

/// @nodoc
class __$$_ConventionModelCopyWithImpl<$Res>
    extends _$ConventionModelCopyWithImpl<$Res, _$_ConventionModel>
    implements _$$_ConventionModelCopyWith<$Res> {
  __$$_ConventionModelCopyWithImpl(
      _$_ConventionModel _value, $Res Function(_$_ConventionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? startDate = null,
    Object? fullAddress = freezed,
    Object? displayCity = freezed,
    Object? displayState = freezed,
    Object? endDate = freezed,
    Object? lonlat = freezed,
    Object? website = freezed,
  }) {
    return _then(_$_ConventionModel(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConventionModel implements _ConventionModel {
  const _$_ConventionModel(
      {required this.id,
      required this.title,
      required this.startDate,
      this.fullAddress,
      this.displayCity,
      this.displayState,
      this.endDate,
      this.lonlat,
      this.website});

  factory _$_ConventionModel.fromJson(Map<String, dynamic> json) =>
      _$$_ConventionModelFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final DateTime startDate;
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
  String toString() {
    return 'ConventionModel(id: $id, title: $title, startDate: $startDate, fullAddress: $fullAddress, displayCity: $displayCity, displayState: $displayState, endDate: $endDate, lonlat: $lonlat, website: $website)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConventionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.fullAddress, fullAddress) ||
                other.fullAddress == fullAddress) &&
            (identical(other.displayCity, displayCity) ||
                other.displayCity == displayCity) &&
            (identical(other.displayState, displayState) ||
                other.displayState == displayState) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.lonlat, lonlat) || other.lonlat == lonlat) &&
            (identical(other.website, website) || other.website == website));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, startDate,
      fullAddress, displayCity, displayState, endDate, lonlat, website);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConventionModelCopyWith<_$_ConventionModel> get copyWith =>
      __$$_ConventionModelCopyWithImpl<_$_ConventionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConventionModelToJson(
      this,
    );
  }
}

abstract class _ConventionModel implements ConventionModel {
  const factory _ConventionModel(
      {required final String id,
      required final String title,
      required final DateTime startDate,
      final String? fullAddress,
      final String? displayCity,
      final String? displayState,
      final DateTime? endDate,
      final String? lonlat,
      final String? website}) = _$_ConventionModel;

  factory _ConventionModel.fromJson(Map<String, dynamic> json) =
      _$_ConventionModel.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  DateTime get startDate;
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
  @JsonKey(ignore: true)
  _$$_ConventionModelCopyWith<_$_ConventionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
