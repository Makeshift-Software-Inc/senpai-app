import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:senpai/models/events/member/member_model.dart';

part 'party_model.freezed.dart';

part 'party_model.g.dart';

@freezed
class PartyModel with _$PartyModel {
  const factory PartyModel({
    required String id,
    required bool disbanded,
    int? hostId,
    required int eventId,
    required String status,
    required List<Member> members,

    //partyChat
  }) = _PartyModel;

  factory PartyModel.initial() => const PartyModel(
        id: '',
        disbanded: false,
        hostId: null,
        eventId: 0,
        status: '',
        members: [],
      );

  factory PartyModel.fromJson(Map<String, dynamic> json) =>
      _$PartyModelFromJson(json);
}
