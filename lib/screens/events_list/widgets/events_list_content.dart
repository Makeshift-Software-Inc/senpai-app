import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:senpai/core/widgets/loading.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/routes/app_router.dart';
import 'package:senpai/screens/events_list/widgets/empty_events_widget.dart';
import 'package:senpai/screens/events_list/widgets/notched_container_widget.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class EventsListContent extends StatelessWidget {
  const EventsListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Builder(builder: (context) {
      return Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    margin: EdgeInsets.only(
                      top: $constants.insets.md,
                      left: $constants.insets.sm,
                    ),
                    child: TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(right: $constants.insets.xs),
                        hintText: R.strings.searchText,
                        hintStyle: getTextTheme(context)
                            .bodySmall!
                            .apply(color: $constants.palette.darkGrey),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular($constants.corners.xxl),
                            borderSide: BorderSide(
                                color: $constants.palette.buttonBorder)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular($constants.corners.xxl),
                            borderSide: BorderSide(
                                color: $constants.palette.buttonBorder)),
                        prefixIcon: Icon(
                          Icons.search,
                          color: $constants.palette.white,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all($constants.insets.xs),
                      margin: EdgeInsets.only(
                        top: $constants.insets.md,
                        left: $constants.insets.sm,
                        right: $constants.insets.sm,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: $constants.palette.buttonBorder),
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.tune,
                        size: $constants.corners.xl,
                        color: $constants.palette.white,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: $constants.insets.sm,
                    right: $constants.insets.sm,
                    top: $constants.insets.md,
                    bottom: $constants.insets.sm),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: $constants.insets.sm,
                            vertical: $constants.insets.xs),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular($constants.corners.xlg),
                            border: Border.all(
                                color: $constants.palette.buttonBorder)),
                        child: Text(
                          R.strings.normalEvents,
                          style: getTextTheme(context).headlineSmall!.copyWith(
                              color: $constants.palette.white, fontSize: 14),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: $constants.insets.sm,
                            vertical: $constants.insets.xs),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular($constants.corners.xlg),
                            border: Border.all(
                                color: $constants.palette.buttonBorder)),
                        child: Text(
                          R.strings.conventionsText,
                          style: getTextTheme(context).headlineSmall!.copyWith(
                              color: $constants.palette.white, fontSize: 14),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: $constants.insets.sm,
                            vertical: $constants.insets.xs),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular($constants.corners.xlg),
                          border: Border.all(
                              color: $constants.palette.buttonBorder),
                          gradient: $constants.palette.mainGradient,
                        ),
                        child: Text(
                          R.strings.yourEvents,
                          style: getTextTheme(context).headlineSmall!.copyWith(
                              color: $constants.palette.white, fontSize: 14),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(bottom: $constants.insets.xl),
                    itemBuilder: (_, i) {
                      return SizedBox(
                        height: $constants.events.eventListItemHeight,
                        child: Stack(
                          children: [
                            Container(
                                height: $constants.events.eventListImageHeight,
                                margin: EdgeInsets.all($constants.insets.sm),
                                decoration: BoxDecoration(
                                  color: $constants.palette.white,
                                  borderRadius: BorderRadius.circular(
                                      $constants.corners.xlg),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://www.themarysue.com/wp-content/uploads/2023/12/One-Piece-anime.jpg',
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          $constants.corners.xlg),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => const Center(
                                    child: SenpaiLoading(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: $constants.insets.md,
                                  right: $constants.insets.lg),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.all($constants.insets.xs),
                                    margin: EdgeInsets.only(
                                        right: $constants.insets.xs),
                                    decoration: BoxDecoration(
                                        color: $constants.palette.black
                                            .withOpacity(0.4),
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      Icons.calendar_month,
                                      size: $constants.insets.sm,
                                      color: $constants.palette.white,
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: $constants.insets.xs,
                                          vertical: $constants.insets.xxs),
                                      decoration: BoxDecoration(
                                          color: $constants.palette.black,
                                          borderRadius: BorderRadius.circular(
                                              $constants.corners.xlg)),
                                      child: Text(
                                        '20-22 Oct, 9:00 AM to 9:00 PM',
                                        style: getTextTheme(context)
                                            .displaySmall!
                                            .copyWith(
                                              color: $constants.palette.white,
                                            ),
                                      ))
                                ],
                              ),
                            ),
                            const Align(
                              alignment: Alignment.bottomCenter,
                              child: NotchedContainerWidget(
                                title: ' Anime Galaxy Con 2024',
                                subtitle: 'Los Angeles, California, USA',
                              ),
                            ),
                            Positioned(
                              bottom: 35,
                              left: 57,
                              child: Container(
                                width: $constants
                                    .events.eventListRoundContainerSize,
                                height: $constants
                                    .events.eventListRoundContainerSize,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  gradient: $constants.palette.mainGradient,
                                  shape: BoxShape.circle,
                                ),
                                child: Container(
                                    width: $constants.insets.xl,
                                    height: $constants.insets.xl,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: $constants.palette.black,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(R.strings.freeTitle,
                                        style: getTextTheme(context)
                                            .headlineSmall
                                            ?.copyWith(
                                                color: $constants.palette.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w900))),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: _buildCreateEventButton(context)),
        ],
      );

      return Column(
        children: [
          const Expanded(
            child: Center(
              child: EmptyEventsWidget(),
            ),
          ),
          _buildCreateEventButton(context)
        ],
      );
    }));
  }

  Widget _buildCreateEventButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(
          const NewEventRoute(),
        );
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SvgPicture.asset(
            PathConstants.eventButtonIcon,
            height: $constants.corners.xxl,
          ),
          Text(
            R.strings.createEventTitle,
            style: getTextTheme(context).bodyMedium?.copyWith(
                color: $constants.palette.white, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
