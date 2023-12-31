import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/core/feed/blocs/fetch_feed_bloc.dart';
import 'package:senpai/core/feed/blocs/like_user_bloc.dart';
import 'package:senpai/core/graphql/blocs/mutation/mutation_bloc.dart';
import 'package:senpai/core/graphql/blocs/query/query_bloc.dart';
import 'package:senpai/core/widgets/loading.dart';
import 'package:senpai/data/text_constants.dart';
import 'package:senpai/dependency_injection/injection.dart';
import 'package:senpai/models/user_profile/user_profile_model.dart';
import 'package:senpai/screens/home/bloc/home_storage_bloc.dart';
import 'package:senpai/screens/match/bloc/match_bloc.dart';
import 'package:senpai/screens/match/widgets/match_content.dart';
import 'package:senpai/screens/profile/bloc/profile_bloc.dart' as user;
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/helpers/snack_bar_helpers.dart';
import 'package:senpai/utils/methods/aliases.dart';

@RoutePage()
class MatchPage extends StatelessWidget {
  const MatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<HomeStorageBloc>()),
        BlocProvider(create: (_) => MatchBloc()..add(OnInitUserID())),
        BlocProvider(
            create: (_) => user.ProfileBloc()..add(user.OnInitUserID())),
        BlocProvider(create: (_) => getIt<FetchFeedBloc>()),
        BlocProvider(create: (_) => getIt<LikeUserBloc>()),
      ],
      child: Scaffold(
        backgroundColor: $constants.palette.darkBlue,
        body: SafeArea(
          child: Stack(
            children: [
              BlocListener<MatchBloc, MatchState>(
                listenWhen: (_, currState) => currState is ValidUserIdState,
                listener: (context, state) {
                  final bloc = BlocProvider.of<MatchBloc>(context);
                  final storageBloc = BlocProvider.of<HomeStorageBloc>(context);
                  final serverBloc = BlocProvider.of<FetchFeedBloc>(context);
                  serverBloc.fetchFeed(
                    userId: bloc.userID,
                    profileFilter: storageBloc.filters,
                  );
                },
                child: const MatchContent(),
              ),
              _buildFetchFeedListeners(),
              _buildLikeUserListeners(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFetchFeedListeners() {
    return BlocBuilder<FetchFeedBloc, QueryState>(
      builder: (context, state) {
        return state.maybeWhen<Widget>(
            loading: (result) {
              return const SenpaiLoading();
            },
            loaded: (data, result) {
              if (result.data == null) {
                showSnackBarError(context, TextConstants.nullUser);
                logIt.error("A successful empty response just got recorded");
                return const SizedBox.shrink();
              } else {
                final bloc = BlocProvider.of<MatchBloc>(context);

                List<dynamic>? users = result.data!["fetchFeed"];
                final userList =
                    users!.map((e) => UserProfileModel.fromJson(e)).toList();
                bloc.add(OnMatchInitEvent(users: userList));
                return const SizedBox.shrink();
              }
            },
            error: (error, result) {
              showSnackBarError(context, TextConstants.serverError);
              return const SizedBox.shrink();
            },
            orElse: () => const SizedBox.shrink());
      },
    );
  }

  Widget _buildLikeUserListeners() {
    return BlocBuilder<LikeUserBloc, MutationState>(
      builder: (context, state) {
        return state.maybeWhen<Widget>(
            loading: () => const SenpaiLoading(),
            failed: (error, result) {
              showSnackBarError(context, TextConstants.serverError);
              return const SizedBox.shrink();
            },
            succeeded: (data, result) {
              final response = result.data;

              if (response == null) {
                // handle this fatal error
                logIt.wtf("A successful empty response just got set user");
                return const SizedBox.shrink();
              }
              final model = response["likeUser"]["like"];
              if (model == null) {
                showSnackBarError(context, TextConstants.nullUser);
                logIt.error("A user with error");
                return const SizedBox.shrink();
              }

              // LikeUserModel likeUserModel = LikeUserModel.fromJson(model);
              // //Todo: update it after pull conversation model
              // if (response["likeUser"]["match"] != null) {
              //   context.router
              //       .push(MatchUsersRoute(likeUserModel: likeUserModel))
              //       .then((value) {
              //     final bloc = BlocProvider.of<MatchBloc>(context);
              //     final storageBloc = BlocProvider.of<HomeStorageBloc>(context);
              //     final serverBloc = BlocProvider.of<FetchFeedBloc>(context);
              //     serverBloc.fetchFeed(
              //       userId: bloc.userID,
              //       profileFilter: storageBloc.filters,
              //     );
              //   });
              // }
              return const SizedBox.shrink();
            },
            orElse: () => const SizedBox.shrink());
      },
    );
  }
}
