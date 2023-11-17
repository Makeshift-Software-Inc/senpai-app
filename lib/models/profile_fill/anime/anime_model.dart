import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_model.freezed.dart';
part 'anime_model.g.dart';

@freezed
class AnimeModel with _$AnimeModel {
  const factory AnimeModel({
    required String id,
    String? title,
    String? genres,
    String? cover,
    int? episodes,
    int? popularity,
    int? averageScore,
    String? startDate,
    String? endDate,
    String? studios,
    int? year,
    String? status,
  }) = _AnimeModel;

  factory AnimeModel.initial() => const AnimeModel(
        id: '',
        title: '',
        genres: '',
        cover: '',
        episodes: 0,
        popularity: 0,
        averageScore: 0,
        startDate: '',
        endDate: '',
        studios: '',
        year: 0,
        status: '',
      );

  factory AnimeModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeModelFromJson(json);
}
