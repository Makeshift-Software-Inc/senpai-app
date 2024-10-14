import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:senpai/data/data_constants.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/screens/onboarding/bloc/onboarding_bloc.dart';
import 'package:senpai/screens/onboarding/widgets/circle_progress_bar.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<OnboardingBloc>(context);
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            height: getSize(context).height,
            width: getSize(context).width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    PathConstants.onboardingBackground,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: getWidthSize(
                context, 1.0827), // Setting the height from the bottom
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0x00141414),
                  Color(0xFF141414)
                ], // Both 0% and 100% use #141414
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Expanded(
              child: _createPageView(context, bloc.pageController, bloc),
            ),
            _createStatic(bloc),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
        // _buildSkipButton(context),
      ],
    );
  }

  Widget _createPageView(
      BuildContext context, PageController controller, OnboardingBloc bloc) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: controller,
            children: DataConstants.getOnboardingTiles(context),
            onPageChanged: (index) {
              bloc.add(PageSwipedEvent(index: index));
            },
          ),
        ),
        SizedBox(height: getWidthSize(context, 0.085)),
        SmoothPageIndicator(
          controller: controller, // The PageController
          count: DataConstants.getOnboardingTiles(context)
              .length, // Number of pages
          effect: const ExpandingDotsEffect(
            activeDotColor: Colors.white, // Color of active dot
            dotColor: Colors.grey, // Color of inactive dots
            dotHeight: 12, // Size of dots
            dotWidth: 12,
          ),
        ),
      ],
    );
  }

  Widget _createStatic(OnboardingBloc bloc) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        BlocBuilder<OnboardingBloc, OnboardingState>(
          buildWhen: (_, currState) => currState is PageChangedState,
          builder: (context, state) {
            final percent = _getPercent(bloc.pageIndex);
            return Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: getWidthSize(context, 0.2347),
                  height: getWidthSize(context, 0.2347),
                  child: CircleProgressBar(
                    backgroundColor: $constants.palette.progressBackground,
                    value: percent,
                  ),
                ),
                Material(
                  shape: const CircleBorder(),
                  color: $constants.palette.buttonBackground,
                  child: RawMaterialButton(
                    shape: const CircleBorder(),
                    onPressed: () {
                      bloc.add(PageChangedEvent());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: SvgPicture.asset(
                        PathConstants.arrowNext,
                        width: getWidthSize(context, 0.088),
                        height: getWidthSize(context, 0.088),
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  double _getPercent(int pageIndex) {
    return (pageIndex + 1) / 4;
    // switch (pageIndex) {
    //   case 0:
    //     return 0.25;
    //   case 1:
    //     return 0.65;
    //   case 2:
    //     return 1;
    //   default:
    //     return 0;
    // }
  }

  Widget _buildSkipButton(BuildContext context) {
    final bloc = BlocProvider.of<OnboardingBloc>(context);
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: SizedBox(
        height: 40,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: $constants.insets.lg),
          child: Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              child: Text(
                R.strings.onboardingButtonText,
                style: getTextTheme(context).displaySmall,
              ),
              onPressed: () {
                bloc.add(PageChangedEvent(pageIndex: 3));
              },
            ),
          ),
        ),
      ),
    );
  }
}
