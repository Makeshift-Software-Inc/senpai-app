import 'package:freezed_annotation/freezed_annotation.dart';
part 'member_model.freezed.dart';
part 'member_model.g.dart';

@freezed
class Member with _$Member {
  const factory Member({
    required String id,
    required Gallery gallery,
  }) = _Member;

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}

@freezed
class Gallery with _$Gallery {
  const factory Gallery({
    required List<Photo> photos,
  }) = _Gallery;

  factory Gallery.fromJson(Map<String, dynamic> json) =>
      _$GalleryFromJson(json);
}

@freezed
class Photo with _$Photo {
  const factory Photo({
    required int order,
    required String url,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}
