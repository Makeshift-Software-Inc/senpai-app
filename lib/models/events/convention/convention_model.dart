import 'package:freezed_annotation/freezed_annotation.dart';

part 'convention_model.freezed.dart';
part 'convention_model.g.dart';

@freezed
class ConventionModel with _$ConventionModel {
  const factory ConventionModel({
    required String id,
    required String title,
    required DateTime startDate,
    required String coverImageUrl,
    String? fullAddress,
    String? displayCity,
    String? displayState,
    DateTime? endDate,
    String? lonlat,
    String? website,
    //add another parameters
  }) = _ConventionModel;
  factory ConventionModel.initial() => ConventionModel(
        id: '',
        title: '',
        startDate: DateTime.now(),
        coverImageUrl: '',
        endDate: null,
        lonlat: '',
        fullAddress: '',
        displayCity: '',
        displayState: '',
        website: '',
      );

  factory ConventionModel.fromJson(Map<String, dynamic> json) =>
      _$ConventionModelFromJson(json);
}
