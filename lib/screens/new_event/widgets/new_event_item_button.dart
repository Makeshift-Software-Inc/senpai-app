import 'package:flutter/material.dart';

import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class NewEventItemButton extends StatelessWidget {
  final String title;
  final String description;

  final VoidCallback? onTap;
  final Widget customWidget;

  const NewEventItemButton({
    super.key,
    required this.title,
    this.description = '',
    this.onTap,
    required this.customWidget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.all($constants.insets.sm),
        decoration: profileBoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: getTextTheme(context).bodyMedium?.copyWith(
                  color: $constants.palette.white, fontWeight: FontWeight.w600),
            ),
            _tryBuildingDescripionWidget(context),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: customWidget,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tryBuildingDescripionWidget(BuildContext context) {
    if (description.isEmpty) {
      return const SizedBox.shrink();
    }
    return Text(
      ' ($description)',
      style: getTextTheme(context).bodyMedium?.copyWith(
            fontSize: 14,
            color: $constants.palette.white,
          ),
    );
  }
}
