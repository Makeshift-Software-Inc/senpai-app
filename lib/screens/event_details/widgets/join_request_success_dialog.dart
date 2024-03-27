import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:senpai/core/widgets/primary_button.dart';

import 'package:senpai/l10n/resources.dart';
import 'package:senpai/screens/profile_fill/widgets/custom_close_button.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class JoinRequestSuccessDialog extends StatelessWidget {
  const JoinRequestSuccessDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: $constants.corners.sm,
            horizontal: $constants.insets.md,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: $constants.insets.sm,
          ),
          decoration: BoxDecoration(
            color: $constants.palette.appBackground,
            borderRadius: BorderRadius.circular($constants.insets.sm),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: $constants.insets.lg),
              Text(
                R.strings.attendSuccessTitle,
                style: getTextTheme(context).bodyMedium!.copyWith(
                      color: $constants.palette.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(height: $constants.insets.md),
              Container(
                padding: EdgeInsets.all($constants.insets.sm),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: $constants.palette.green,
                  ),
                ),
                child: Icon(
                  Icons.done,
                  color: $constants.palette.white,
                ),
              ),
              SizedBox(height: $constants.insets.sm),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
                child: Text(
                  R.strings.attendSuccessfulDescription,
                  style: getTextTheme(context).bodyMedium!.copyWith(
                        color: $constants.palette.grey,
                        fontSize: 14,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: $constants.insets.lg),
              Padding(
                padding: EdgeInsets.symmetric(vertical: $constants.insets.sm),
                child: PrimaryButton(
                  text: R.strings.okText.toUpperCase(),
                  onPressed: () {
                    context.router.pop();
                  },
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: $constants.insets.sm,
          child: CustomCloseButton(
            borderColor: $constants.palette.black.withOpacity(0.6),
            backgroundColor: $constants.palette.appBackground,
            onTapButton: () {
              context.router.pop();
            },
          ),
        ),
      ],
    );
  }
}
