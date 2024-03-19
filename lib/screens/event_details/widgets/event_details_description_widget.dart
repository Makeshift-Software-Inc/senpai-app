import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/models/events/convention/convention_model.dart';
import 'package:senpai/screens/event_details/widgets/folder_container.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class EventDetailsDescriptionWidget extends StatelessWidget {
  final String description;
  final ConventionModel? convention;

  const EventDetailsDescriptionWidget({
    super.key,
    required this.description,
    this.convention,
  });

  @override
  Widget build(BuildContext context) {
    return FolderContainer(
      image: PathConstants.aboutEventElement,
      header: SizedBox(
        height: $constants.corners.xxl,
        child: Text(
          R.strings.aboutEventText,
          style: getTextTheme(context).headlineSmall,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            description,
            style: getTextTheme(context).labelMedium?.copyWith(
                  fontSize: 14,
                ),
          ),
          SizedBox(height: $constants.insets.sm),
          if (convention != null) ...{
            Text(
              R.strings.associationWithConvention,
              style: getTextTheme(context).labelMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SizedBox(height: $constants.insets.xs),
            _buildAssociationConvention(
              context,
              convention!.coverImageUrl,
              convention!.title,
            ),
          }
        ],
      ),
    );
  }

  Widget _buildAssociationConvention(
    BuildContext context,
    String image,
    String title,
  ) {
    return Container(
      padding: EdgeInsets.all($constants.insets.xxs),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular($constants.insets.xl),
        border: Border.all(
          color: $constants.palette.buttonBorder,
        ),
        color: $constants.palette.buttonBorder.withOpacity(0.3),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular($constants.insets.offset),
            child: Image.network(
              image,
              height: $constants.insets.xxl,
              width: $constants.insets.xxl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: $constants.insets.xs),
          Expanded(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: getTextTheme(context).headlineSmall!,
            ),
          ),
          SizedBox(width: $constants.insets.xs),
          SvgPicture.asset(
            PathConstants.arrowsForward,
            width: $constants.corners.sm,
            height: $constants.corners.sm,
            fit: BoxFit.contain,
          ),
          SizedBox(width: $constants.insets.lg),
        ],
      ),
    );
  }
}
