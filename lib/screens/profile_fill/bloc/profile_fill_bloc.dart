import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/data/text_constants.dart';
import 'package:senpai/models/profile_fill/photos/upload_photo_model.dart';

import '../../../models/profile_fill/update_user_model.dart';

part 'profile_fill_event.dart';
part 'profile_fill_state.dart';

enum ProfileFillStep {
  welcome,
  firstName,
  birthday,
  gender,
  desiredGender,
  occupation,
  biography,
  photos,
  location,
  spotify,
  animes,
  verify
}

class ProfileFillBloc extends Bloc<ProfileFillEvent, ProfileFillState> {
  ProfileFillStep step = ProfileFillStep.welcome;
  UpdateUserModel user = const UpdateUserModel(
    id: '',
  );
  List<UploadPhotoModel> uploadedPhotos = [];

  ProfileFillBloc() : super(ProfileFillInitial()) {
    on<OnChangeStepEvent>((event, emit) {
      step = event.step;
      emit(ChangedStepSucssesfulState());
    });

    on<OnFirstNameSaveEvent>((event, emit) {
      if (event.firstName.isNotEmpty) {
        user = user.copyWith(firstName: event.firstName);
        step = ProfileFillStep.birthday;
        emit(LoadingProfileFillState());
        emit(ChangedStepSucssesfulState());
      } else {
        emit(
          ErrorProfileFillState(
            message: TextConstants.serverError,
            isEnabled: true,
          ),
        );
      }
    });

    on<OnBirthdaySaveEvent>((event, emit) {
      if (event.birthday != null) {
        user = user.copyWith(birthday: event.birthday.toString());
        step = ProfileFillStep.gender;
        emit(LoadingProfileFillState());
        emit(ChangedStepSucssesfulState());
      } else {
        emit(
          ErrorProfileFillState(
            message: TextConstants.serverError,
            isEnabled: true,
          ),
        );
      }
    });

    on<OnUserGenderSaveEvent>((event, emit) {
      user = user.copyWith(gender: event.gender);
      step = ProfileFillStep.desiredGender;
      emit(LoadingProfileFillState());
      emit(ChangedStepSucssesfulState());
    });

    on<OnDesiredGenderSaveEvent>((event, emit) {
      user = user.copyWith(desiredGender: event.gender);
      step = ProfileFillStep.occupation;
      emit(LoadingProfileFillState());
      emit(ChangedStepSucssesfulState());
    });

    on<OnOccupationSaveEvent>((event, emit) {
      user = user.copyWith(
        school: event.university,
        occupation: event.jobTitle ?? '',
      );
      step = ProfileFillStep.biography;
      emit(LoadingProfileFillState());
      emit(ChangedStepSucssesfulState());
    });

    on<OnBiographySaveEvent>((event, emit) {
      user = user.copyWith(bio: event.biography);
      step = ProfileFillStep.photos;
      emit(LoadingProfileFillState());
      emit(ChangedStepSucssesfulState());
    });

    on<OnPhotosListSaveEvent>((event, emit) {
      uploadedPhotos = event.photos;
      step = ProfileFillStep.welcome;
      emit(LoadingProfileFillState());
      emit(ChangedStepSucssesfulState());
    });
  }
}
