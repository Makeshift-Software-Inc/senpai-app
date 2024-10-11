import 'package:flutter/material.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class OnboardingTile extends StatelessWidget {
  const OnboardingTile({
    super.key,
    required this.imagePath,
    required this.title,
  });
  final String title, imagePath;

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
              Text(
                title,
                style: getTextTheme(context)
                    .displayLarge
                    ?.copyWith(fontSize: 28, height: 1.5),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: $constants.insets.lg,
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
