import 'package:flutter/material.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class OnboardingTile extends StatelessWidget {
  const OnboardingTile({
    super.key,
    required this.imagePath,
    this.title,
    this.titleWidget,
  });
  final String? title;
  final String imagePath;
  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final maxHeight = constraints.maxHeight;
        return Container(
          height: maxHeight,
          padding: EdgeInsets.symmetric(horizontal: $constants.insets.lg),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildImage(),
              // SizedBox(
              //   height: $constants.insets.sm,
              // ),
              if (titleWidget != null) titleWidget!,
              if (title != null)
                Text(
                  title ?? "",
                  style: TextStyle(
                    fontSize: getWidthSize(context, 0.06),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              // Text(
              //   subTitle,
              //   style: getTextTheme(context).displayLarge,
              // )
            ],
          ),
        );
      },
    );
  }

  Widget _buildImage() {
    return Expanded(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final maxHeight = constraints.maxHeight;
          return Image.asset(
            imagePath,
            height: maxHeight,
            fit: BoxFit.contain,
          );
        },
      ),
    );
  }
}
