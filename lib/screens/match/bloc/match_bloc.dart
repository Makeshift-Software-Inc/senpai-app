import 'dart:math';

import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_graphql/fresh_graphql.dart';
import 'package:senpai/dependency_injection/injection.dart';
import 'package:senpai/models/auth/auth_model.dart';
import 'package:senpai/models/profile_fill/photos/upload_photo_model.dart';
import 'package:senpai/models/user_profile/gallery_user/gallery_user_model.dart';
import 'package:senpai/models/user_profile/user_profile_model.dart';
import 'package:senpai/screens/match/enums/match_enums.dart';
import 'package:swipable_stack/swipable_stack.dart';

part 'match_state.dart';
part 'match_event.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  String userID = '';

  List<UserProfileModel> users = [];
  UserProfileModel userNow = UserProfileModel.initial();
  Swipe swipeUser = Swipe.none;

  SwipableStackController cardSwipeController = SwipableStackController();
  List<FlipCardController> flipCardController = [];

  int page = 1;

  generateList() {
    // for(var i=0; i<=40; i++) {
    //   users.add(
    //     UserProfileModel(
    //         id: i.toString(),
    //         phone: Random().nextInt(100).toString(),
    //         verified: i.isEven ? true : false,
    //       gallery: GalleryUserModel(photos: [
    //         UploadPhotoModel(id: '$i', url: 'https://images.pexels.com/photos/19562326/pexels-photo-19562326/free-photo-of-a-woman-in-a-sweater-and-skirt-posing-for-a-photo.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load'),
    //       ])
    //     ),
    //   );
    //   flipCardController.add(FlipCardController());
    // }

    for(var i=0; i<=users.length; i++) {
      flipCardController.add(FlipCardController());
    }
  }

  MatchBloc() : super(MatchInitial()) {
    on<OnInitUserID>((event, emit) async {
      emit(LoadingState());
      generateList();
      final storage = getIt<TokenStorage<AuthModel>>();
      await storage.read().then((data) {
        //TODO: maybe if id is null we need to logout user
        if (data != null) {
          userID = data.user.id;
        }
        emit(ValidUserIdState());
      });
    });

    on<OnMatchInitEvent>((event, emit) {
      emit(LoadingState());
      if (page == 1) {
        users = event.users;
      } else {
        users.addAll(event.users);
      }
      if (event.users.isNotEmpty) {
        userNow = event.users.last;
      }
      emit(ValidState());
    });

    on<OnChangeViewUserEvent>((event, emit) {
      emit(LoadingState());
      if (event.index != 0) {
        // userNow = users[event.index - 1];
        userNow = users.last;
      }
      // users = users..removeAt(event.index);
      users = users..removeWhere((element) => element.id == users.last.id);
      emit(ValidState());
    });

    on<OnCancelUserEvent>((event, emit) {
      emit(LoadingState());
      final selectedUserId = int.parse(userNow.id);
      // users = users..remove(userNow);
      // if (users.isNotEmpty) {
      //   userNow = users.last;
      // }
      // if (users.length == 2) {
      //   page += 1;
      // }
      emit(NextUserState(swipe: Swipe.left, selectedUserId: selectedUserId));
    });

    on<OnLikeUserEvent>((event, emit) {
      emit(LoadingState());
      // cardSwipeController.next(swipeDirection: SwipeDirection.right);
      final selectedUserId = int.parse(userNow.id);
      // users = users..remove(userNow);
      // if (users.isNotEmpty) {
      //   userNow = users.last;
      // }
      // if (users.length == 2) {
      //   page += 1;
      // }
      emit(NextUserState(swipe: Swipe.right, selectedUserId: selectedUserId));
    });


    on<OnSuperLikeUserEvent>((event, emit) {
      emit(LoadingState());
      // flipCardController.toggleCard().whenComplete(() {
      //   Future.delayed(Duration(milliseconds: 1500), () {
      //     cardSwipeController.next(swipeDirection: SwipeDirection.up);
      //   });
      // });
      // cardSwipeController.next(swipeDirection: SwipeDirection.up);
      final selectedUserId = int.parse(userNow.id);
      // users = users..remove(userNow);
      // if (users.isNotEmpty) {
      //   userNow = users.last;
      // }
      // if (users.length == 2) {
      //   page += 1;
      // }
      emit(NextUserState(swipe: Swipe.up, selectedUserId: selectedUserId));
    });

    on<OnChangeSwipeUserEvent>((event, emit) {
      swipeUser = event.swipe;
      emit(ValidSwipeState());
    });

    on<OnChangePageEvent>((event, emit) {
      emit(LoadingState());
      if (event.isRefresh) {
        page = 1;
      } else {
        page += 1;
      }
      emit(ValidChangePageState());
    });
  }
}
