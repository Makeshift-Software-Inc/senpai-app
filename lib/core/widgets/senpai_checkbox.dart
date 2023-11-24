import 'package:flutter/material.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class SenpaiCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String title;
  final Widget? leading;

  const SenpaiCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    this.leading,
  });

  Color _getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.selected,
    };
    if (states.any(interactiveStates.contains)) {
      return $constants.palette.pink;
    }
    return $constants.palette.buttonBorder;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: $constants.insets.sm),
      height: $constants.insets.xxl,
      decoration: profileBoxDecoration(),
      child: Row(
        children: [
          if (leading != null)
            Padding(
              padding: EdgeInsets.only(right: $constants.corners.md),
              child: leading!,
            ),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: getTextTheme(context).bodyMedium,
            ),
          ),
          Transform.scale(
            scale: 1.2,
            child: Checkbox(
              checkColor: $constants.palette.white,
              fillColor: MaterialStateProperty.resolveWith(_getColor),
              value: value,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
