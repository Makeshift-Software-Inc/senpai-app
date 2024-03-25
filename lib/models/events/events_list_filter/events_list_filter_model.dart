import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:senpai/screens/new_event/enums/new_event_enums.dart';

part 'events_list_filter_model.freezed.dart';
part 'events_list_filter_model.g.dart';

@freezed
class EventsListFilterModel with _$EventsListFilterModel {
  const factory EventsListFilterModel({
    required int milesAway,
    required DateTime startDate,
    DateTime? endDate,
    String? userId,
    bool? isFree,
    bool? isPaid,
    CosplayStatus? cosplayStatus,
    double? hostRating,
    bool? paymentRequired,
  }) = _EventsListFilterModel;

  factory EventsListFilterModel.initial() => EventsListFilterModel(
        milesAway: 200,
        startDate: DateTime.now(),
        endDate: null,
        userId: null,
        isFree: false,
        isPaid: false,
        cosplayStatus: null,
        hostRating: null,
        paymentRequired: null,
      );

  factory EventsListFilterModel.fromJson(Map<String, dynamic> json) =>
      _$EventsListFilterModelFromJson(json);
}
