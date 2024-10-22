import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:senpai/core/widgets/loading.dart';
import 'package:senpai/screens/profile_fill/email/bloc/email_bloc.dart';
import 'package:senpai/screens/profile_fill/email/widgets/email_content.dart';

class EmailPage extends StatelessWidget {
  final String? email;

  const EmailPage({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EmailBloc>(
      create: (context) => EmailBloc()
        ..add(OnEmailInitEvent(
          email: email ?? '',
        )),
      child: Stack(
        children: [
          const EmailContent(),
          _buildCreateUserListeners(),
        ],
      ),
    );
  }

  Widget _buildCreateUserListeners() {
    return BlocBuilder<EmailBloc, EmailState>(
      builder: (context, state) {
        return state is LoadingState
            ? const SenpaiLoading()
            : const SizedBox.shrink();
      },
    );
  }
}
