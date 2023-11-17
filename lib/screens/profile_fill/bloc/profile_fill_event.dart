part of 'profile_fill_bloc.dart';

@immutable
abstract class ProfileFillEvent {}

class OnChangeStepEvent extends ProfileFillEvent {
  final ProfileFillStep step;

  OnChangeStepEvent({required this.step});
}

class OnFirstNameSaveEvent extends ProfileFillEvent {
  final String firstName;

  OnFirstNameSaveEvent({required this.firstName});
}

class OnBirthdaySaveEvent extends ProfileFillEvent {
  final DateTime? birthday;

  OnBirthdaySaveEvent({required this.birthday});
}

class OnUserGenderSaveEvent extends ProfileFillEvent {
  final int gender;

  OnUserGenderSaveEvent({required this.gender});
}

class OnDesiredGenderSaveEvent extends ProfileFillEvent {
  final int gender;

  OnDesiredGenderSaveEvent({required this.gender});
}

class OnOccupationSaveEvent extends ProfileFillEvent {
  final String university;
  final String? jobTitle;

  OnOccupationSaveEvent({required this.university, this.jobTitle});
}

class OnBiographySaveEvent extends ProfileFillEvent {
  final String biography;

  OnBiographySaveEvent({required this.biography});
}

class OnPhotosListSaveEvent extends ProfileFillEvent {
  final List<UploadPhotoModel> photos;

  OnPhotosListSaveEvent({required this.photos});
}

class OnLocationSaveEvent extends ProfileFillEvent {
  final LocationUserModel location;

  OnLocationSaveEvent({required this.location});
}

class OnFavoriteAnimeSaveEvent extends ProfileFillEvent {
  final List<AnimeModel> animeList;

  OnFavoriteAnimeSaveEvent({required this.animeList});
}

class OnVerifyPhotoSaveEvent extends ProfileFillEvent {
  final File? verifyPhoto;

  OnVerifyPhotoSaveEvent({this.verifyPhoto});
}
