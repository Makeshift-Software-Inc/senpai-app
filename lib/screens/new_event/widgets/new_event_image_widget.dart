import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/routes/app_router.dart';
import 'package:senpai/screens/new_event/bloc/new_event_bloc.dart';

import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class NewEventImageWidget extends StatelessWidget {
  const NewEventImageWidget({super.key});

  void _onSelectImage(BuildContext context) {
    context.router.push(
      NewEventPhotoManagerRoute(
        bloc: BlocProvider.of<NewEventBloc>(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewEventBloc, NewEventState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<NewEventBloc>(context);
        return bloc.image != null
            ? _buildImage(context)
            : GestureDetector(
                onTap: () => _onSelectImage(context),
                child: _buildAddImageWidget(context, state),
              );
      },
    );
  }

  Widget _buildImage(BuildContext context) {
    final bloc = BlocProvider.of<NewEventBloc>(context);
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular($constants.insets.sm),
          child: Image(
            image: FileImage(bloc.image!),
            width: getSize(context).width - $constants.insets.lg,
            height: $constants.events.newEventImageHeight,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: $constants.insets.xs,
          right: $constants.insets.xs,
          child: _buildUpdateImageButton(context),
        ),
      ],
    );
  }

  Widget _buildAddImageWidget(BuildContext context, NewEventState state) {
    return Container(
      height: $constants.events.newEventImageHeight,
      padding: EdgeInsets.all($constants.insets.sm),
      decoration: profileBoxDecoration().copyWith(
        border: Border.all(
          color: state is ErrorNewEventState && state.isEnable
              ? $constants.palette.red
              : Colors.transparent,
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              R.strings.addPromoImageText,
              style: getTextTheme(context).bodyMedium?.copyWith(
                    color: $constants.palette.white,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          SizedBox(width: $constants.insets.sm),
          _buildImageIcon(),
        ],
      ),
    );
  }

  Widget _buildUpdateImageButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _onSelectImage(context),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: $constants.match.blur,
            sigmaY: $constants.match.blur,
          ),
          child: Container(
            padding: EdgeInsets.only(
              left: $constants.insets.sm,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular($constants.corners.xl),
              color: $constants.palette.lightBlue.withOpacity(0.8),
            ),
            alignment: Alignment.center,
            height: $constants.insets.xl,
            child: Row(
              children: [
                Text(
                  R.strings.editPromoImage,
                  style: getTextTheme(context).bodyMedium?.copyWith(
                      color: $constants.palette.white,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(width: $constants.insets.xs),
                _buildImageIcon(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageIcon() {
    return Container(
      padding: EdgeInsets.all($constants.insets.xs),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: $constants.palette.darkGrey,
          width: 1.0,
        ),
      ),
      child: SvgPicture.asset(
        PathConstants.newEventImage,
        width: $constants.insets.md,
        height: $constants.insets.md,
      ),
    );
  }
}
