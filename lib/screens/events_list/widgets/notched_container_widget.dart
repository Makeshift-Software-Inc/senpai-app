import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class NotchedContainerWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const NotchedContainerWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(),
      child: Container(
        width: MediaQuery.of(context).size.width - $constants.insets.lg * 2,
        height: 63,
        padding: EdgeInsets.symmetric(
            horizontal: $constants.insets.md, vertical: $constants.insets.xs),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular($constants.corners.xlg),
          color: $constants.palette.darkGrey2.withOpacity(0.8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Text(
                  title,
                  style: getTextTheme(context).headlineSmall!,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_pin,
                      size: 8,
                      color: $constants.palette.white,
                    ),
                    SizedBox(
                      width: $constants.insets.xxs,
                    ),
                    Text(
                      subtitle,
                      style: getTextTheme(context).labelMedium!,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: $constants.insets.xl,
            ),
            SvgPicture.asset(
              PathConstants.arrowsForward,
              width: 10,
              height: 10,
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: $constants.insets.sm,
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  MyCustomClipper();

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(20, 0.0)
      ..arcToPoint(
        const Offset(80, 0),
        clockwise: false,
        radius: const Radius.circular(4),
      )
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(130, size.height);

    path.lineTo(0.0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(MyCustomClipper oldClipper) => true;
}
