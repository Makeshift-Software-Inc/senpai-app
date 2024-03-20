import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_model.freezed.dart';

part 'event_model.g.dart';

@freezed
class EventModel with _$EventModel {
  const factory EventModel({
    required String id,
    required String title,
    required DateTime startDate,
    required String coverImageUrl,
    String? fullAddress,
    String? displayCity,
    String? displayState,
    DateTime? endDate,
    String? lonlat,
    String? country,
    bool? paymentRequired,
    String? cosplayRequired,
  }) = _EventModel;

  factory EventModel.initial() => EventModel(
        id: '',
        title: '',
        startDate: DateTime.now(),
        coverImageUrl: '',
        endDate: null,
        lonlat: '',
        fullAddress: '',
        displayCity: '',
        displayState: '',
        country: '',
        paymentRequired: false,
        cosplayRequired: '',
      );

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);
}
