import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class FolderContainer extends StatelessWidget {
  final Widget child;
  final Widget header;
  final String image;

  const FolderContainer({
    super.key,
    required this.child,
    required this.header,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform.translate(
          offset: const Offset(0.0, 1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              header,
              Expanded(
                child: ClipRect(
                  child: SvgPicture.asset(
                    image,
                    height: $constants.insets.xl,
                    fit: BoxFit.fill,
                    alignment: Alignment.centerRight,
                    colorFilter: ColorFilter.mode(
                      $constants.palette.folderBackground,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all($constants.insets.sm),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular($constants.insets.md),
              bottomLeft: Radius.circular($constants.insets.md),
              bottomRight: Radius.circular($constants.insets.md),
            ),
            shape: BoxShape.rectangle,
            gradient: $constants.palette.aboutEventGradient,
          ),
          width: getSize(context).width - $constants.insets.lg,
          child: child,
        ),
      ],
    );
  }
}
