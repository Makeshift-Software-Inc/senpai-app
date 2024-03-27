import 'package:freezed_annotation/freezed_annotation.dart';

part 'applicant_model.freezed.dart';
part 'applicant_model.g.dart';

@freezed
class ApplicantModel with _$ApplicantModel {
  const factory ApplicantModel({
    required String id,
  }) = _ApplicantModel;

  factory ApplicantModel.initial() => const ApplicantModel(
        id: '',
      );

  factory ApplicantModel.fromJson(Map<String, dynamic> json) =>
      _$ApplicantModelFromJson(json);
}
