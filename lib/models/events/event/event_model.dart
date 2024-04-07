import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:senpai/models/events/event_details/party_model.dart';

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
    String? description,
    String? venue,
    PartyModel? party,
    int? hostId,
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
        description: '',
        venue: '',
        party: null,
        hostId: 0,
      );

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);
}
