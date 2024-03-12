import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_event_model.freezed.dart';
part 'new_event_model.g.dart';

@freezed
class NewEventModel with _$NewEventModel {
  const factory NewEventModel({
    required String title,
    required String userId,
    required String venue,
    required DateTime startDate,
    required String description,
    required String fullAddress,
    required int memberLimit,
    DateTime? endDate,
    String? cosplayRequired,
    bool? paymentRequired,
    int? conventionId,
  }) = _NewEventModel;

  factory NewEventModel.initial() => NewEventModel(
        title: '',
        userId: '',
        venue: '',
        startDate: DateTime.now(),
        endDate: null,
        description: '',
        fullAddress: '',
        cosplayRequired: '',
        conventionId: null,
        paymentRequired: null,
        memberLimit: 10,
      );

  factory NewEventModel.fromJson(Map<String, dynamic> json) =>
      _$NewEventModelFromJson(json);
}
