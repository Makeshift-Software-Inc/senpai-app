import 'package:flutter/material.dart';
import 'package:senpai/core/widgets/events/folder_clipper.dart';
import 'package:senpai/utils/constants.dart';

class FolderBackground extends StatelessWidget {
  final Widget? child;
  final Widget header;
  const FolderBackground({super.key, this.child, required this.header});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: $constants.palette.aboutEventGradient,
        borderRadius: BorderRadius.circular($constants.corners.xlg),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: ClipPath(
              clipper: FolderClipper(),
              child: Container(
                  padding: EdgeInsets.all($constants.insets.sm),
                  decoration: BoxDecoration(
                    color: $constants.palette.darkBlue,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: $constants.insets.md,
                        bottom: $constants.insets.sm),
                    child: header,
                  )),
            ),
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}
