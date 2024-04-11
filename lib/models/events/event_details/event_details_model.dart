import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:senpai/models/events/event_details/party_model.dart';

part 'event_details_model.freezed.dart';

part 'event_details_model.g.dart';

@freezed
class EventDetailsModel with _$EventDetailsModel {
  const factory EventDetailsModel({
    required String id,
    required String title,
    int? hostId,
    String? description,
    required DateTime startDate,
    required String coverImageUrl,
    String? fullAddress,
    String? venue,
    String? displayCity,
    String? displayState,
    DateTime? endDate,
    String? lonlat,
    String? country,
    bool? paymentRequired,
    String? cosplayRequired,
    int? conventionId,
    PartyModel? party,
  }) = _EventDetailsModel;

  factory EventDetailsModel.initial() => EventDetailsModel(
        id: '',
        title: '',
        hostId: null,
        description: '',
        startDate: DateTime.now(),
        coverImageUrl: '',
        endDate: null,
        lonlat: '',
        fullAddress: '',
        displayCity: '',
        displayState: '',
        country: '',
        venue: '',
        paymentRequired: false,
        cosplayRequired: '',
        party: null,
      );

  factory EventDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$EventDetailsModelFromJson(json);
}
