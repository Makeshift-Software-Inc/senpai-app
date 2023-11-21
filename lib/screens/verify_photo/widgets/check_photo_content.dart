import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:senpai/core/user/blocs/verify_photo_user/verify_photo_user_bloc.dart';
import 'package:senpai/core/widgets/icon_button.dart';
import 'package:senpai/core/widgets/primary_button.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/data/text_constants.dart';
import 'package:senpai/routes/app_router.dart';
import 'package:senpai/screens/profile_fill/bloc/profile_fill_bloc.dart';
import 'package:senpai/screens/verify_photo/bloc/verify_photo_bloc.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class CheckPhotoContent extends StatelessWidget {
  const CheckPhotoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildBackButton(context),
          SizedBox(
            height: $constants.insets.md,
          ),
          _buildPhotos(context),
          SizedBox(height: $constants.insets.md),
          ..._buildTitle(context),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildRetakeButton(context),
                SizedBox(height: $constants.insets.xs),
                _buildVerifyByPhotoButton(context),
              ],
            ),
          ),
          SizedBox(height: $constants.insets.sm),
        ],
      ),
    );
  }

  List<Widget> _buildTitle(BuildContext context) {
    return [
      Text(
        TextConstants.happyWithPhotoText,
        style: getTextTheme(context)
            .headlineLarge
            ?.copyWith(color: $constants.palette.white),
        textAlign: TextAlign.center,
      ),
      Text(
        TextConstants.weWillScanYourPhotoText,
        style: getTextTheme(context).bodySmall?.copyWith(
              color: $constants.palette.grey,
              letterSpacing: 0,
            ),
        textAlign: TextAlign.center,
      ),
    ];
  }

  Widget _buildPhotos(BuildContext context) {
    return BlocBuilder<VerifyPhotoBloc, VerifyPhotoState>(
        builder: (context, state) {
      final bloc = BlocProvider.of<VerifyPhotoBloc>(context);
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: ((getSize(context).width - $constants.insets.xl) / 2),
            child: AspectRatio(
              aspectRatio: 7 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(
                  image: FileImage(bloc.photo!),
                  width: ((getSize(context).width - $constants.insets.xl) / 2),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Image.asset(
            PathConstants.verifyUserPhoto,
            width: ((getSize(context).width - $constants.insets.xl) / 2),
            fit: BoxFit.contain,
          ),
        ],
      );
    });
  }

  Widget _buildBackButton(BuildContext context) {
    final blocProfileFill = BlocProvider.of<ProfileFillBloc>(context);

    return BlocBuilder<VerifyPhotoBloc, VerifyPhotoState>(
        builder: (context, state) {
      final bloc = BlocProvider.of<VerifyPhotoBloc>(context);
      return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(
            top: $constants.insets.xl,
          ),
          child: SenpaiIconButton(
            onPressed: () {
              blocProfileFill
                  .add(OnVerifyPhotoSaveEvent(verifyPhoto: bloc.photo));
            },
            iconPath: PathConstants.backIcon,
          ),
        ),
      );
    });
  }

  Widget _buildRetakeButton(BuildContext context) {
    return TextButton(
      child: Text(
        TextConstants.retakeButton,
        style: getTextTheme(context).bodyMedium,
      ),
      onPressed: () {
        context.router.push(
          VerifyCameraRoute(
            bloc: BlocProvider.of<VerifyPhotoBloc>(context),
          ),
        );
      },
    );
  }

  Widget _buildVerifyByPhotoButton(BuildContext context) {
    final serviceBloc = BlocProvider.of<VerifyPhotoUserBloc>(context);
    final bloc = BlocProvider.of<VerifyPhotoBloc>(context);

    return PrimaryButton(
      text: TextConstants.agreeAndSubmitButton,
      onPressed: () async {
        await MultipartFile.fromPath('image', bloc.photo!.path).then((value) {
          serviceBloc.submitVerifyRequest(userId: 190, image: value);
        });
      },
    );
  }
}
