import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:senpai/core/widgets/loading.dart';
import 'package:senpai/screens/profile_fill/username/bloc/username_bloc.dart';
import 'package:senpai/screens/profile_fill/username/widgets/username_content.dart';

class UsernamePage extends StatelessWidget {
  final String? username;
  final String? fullName;

  const UsernamePage({super.key, this.username, this.fullName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UsernameBloc>(
      create: (context) => UsernameBloc()
        ..add(OnUsernameInitEvent(
          username: username ?? '',
          fullName: fullName ?? '',
        )),
      child: Stack(
        children: [
          const UsernameContent(),
          _buildCreateUserListeners(),
        ],
      ),
    );
  }

  Widget _buildCreateUserListeners() {
    return BlocBuilder<UsernameBloc, UsernameState>(
      builder: (context, state) {
        return state is LoadingState
            ? const SenpaiLoading()
            : const SizedBox.shrink();
      },
    );
  }
}
