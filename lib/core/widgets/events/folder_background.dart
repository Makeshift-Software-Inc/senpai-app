import 'package:flutter/material.dart';
import 'package:senpai/core/widgets/events/folder_clipper.dart';
import 'package:senpai/utils/constants.dart';

class FolderBackground extends StatelessWidget {
  final double width;
  final double height;
  const FolderBackground(
      {super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: FolderClipper(),
      child: SizedBox(
        width: width,
        height: height,
        child: Container(
          decoration: BoxDecoration(
            color: $constants.palette.darkBlue,
          ),
        ),
      ),
    );
  }
}
