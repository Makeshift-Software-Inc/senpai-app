import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:senpai/models/events/join_request/applicant_model.dart';
import 'package:senpai/models/match/matches_users_model/matches_users_model.dart';

part 'join_request_model.freezed.dart';
part 'join_request_model.g.dart';

@freezed
class JoinRequestModel with _$JoinRequestModel {
  const factory JoinRequestModel({
    required String id,
    required int eventId,
    MatchesUsersConversationModel? conversation,
    ApplicantModel? applicant,
  }) = _JoinRequestModel;

  factory JoinRequestModel.initial() => const JoinRequestModel(
        id: '',
        eventId: 0,
        conversation: null,
        applicant: null,
      );

  factory JoinRequestModel.fromJson(Map<String, dynamic> json) =>
      _$JoinRequestModelFromJson(json);
}
