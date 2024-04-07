import 'package:freezed_annotation/freezed_annotation.dart';

part 'party_model.freezed.dart';

part 'party_model.g.dart';

@freezed
class PartyModel with _$PartyModel {
  const factory PartyModel({
    required int id,
    required int hostId,
    bool? disbanded,
    required String status,
  }) = _PartyModel;

  factory PartyModel.fromJson(Map<String, dynamic> json) =>
      _$PartyModelFromJson(json);
}
