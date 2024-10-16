import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class SenpaiIconRoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconPath;
  final Color? bgColor;

  const SenpaiIconRoundedButton({
    super.key,
    required this.onPressed,
    required this.iconPath,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidthSize(context, 0.086),
      height: getWidthSize(context, 0.086),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: bgColor ?? $constants.palette.bgButton,
          elevation: 0,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(0),
          side: BorderSide.none,
        ),
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            width: 32,
            height: 32,
            fit: BoxFit.contain,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
