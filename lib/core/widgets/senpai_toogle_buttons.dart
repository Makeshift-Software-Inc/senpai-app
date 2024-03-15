import 'package:flutter/material.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class SenpaiToggleButtons extends StatelessWidget {
  final List<String> items;
  final ValueChanged<int> onTapItem;
  final int? selectedIndex;

  const SenpaiToggleButtons({
    super.key,
    required this.items,
    required this.onTapItem,
    this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: $constants.corners.xxl,
      padding: EdgeInsets.all($constants.insets.xxs),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular($constants.corners.xxl),
        shape: BoxShape.rectangle,
        color: $constants.palette.darkBlue,
      ),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onTapItem(index),
            child: _biuldItem(context, items[index], isSelected),
          );
        },
        separatorBuilder: (context, index) {
          if (index < items.length) {
            return _buildVerticalDivider();
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _biuldItem(
    BuildContext context,
    String title,
    bool isSelected,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: $constants.insets.xxs,
        horizontal: $constants.insets.sm,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular($constants.corners.lg),
        shape: BoxShape.rectangle,
        color: isSelected ? $constants.palette.lightBlue : null,
      ),
      child: Text(
        title,
        style: getTextTheme(context).headlineSmall?.copyWith(
              color: isSelected
                  ? $constants.palette.white
                  : $constants.palette.disabledTextButton,
            ),
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return VerticalDivider(
      width: $constants.insets.sm,
      thickness: 1,
      indent: $constants.insets.xs,
      endIndent: $constants.insets.xs,
      color: $constants.palette.lightBlue,
    );
  }
}
