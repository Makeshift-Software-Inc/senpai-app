import 'package:flutter/material.dart';
import 'package:senpai/utils/constants.dart';

class EventDetailsPartisipantsList extends StatelessWidget {
  const EventDetailsPartisipantsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: $constants.insets.md,
            vertical: $constants.insets.lg,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildCirleMember(),
              Padding(
                padding: EdgeInsets.only(bottom: $constants.insets.lg),
                child: _buildCirleMember(),
              ),
              _buildCirleMember(),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildCirleMember(),
            _buildCirleMember(),
          ],
        ),
        SizedBox(height: $constants.insets.lg),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildCirleMember(),
            _buildCirleMember(),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: $constants.insets.md,
            vertical: $constants.insets.lg,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCirleMember(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: $constants.insets.lg),
                  child: _buildCirleMember(),
                ),
              ),
              //change on real date
              _buildCirleMember(
                image:
                    'https://d2dafkwzq2hfgj.cloudfront.net/stage/noshoftktsasyebgiw2gvqpf1vvn',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCirleMember({String? image}) {
    return Container(
      width: $constants.carousel.marginAmount,
      height: $constants.carousel.marginAmount,
      alignment: Alignment.topCenter,
      decoration: ShapeDecoration(
        color: $constants.palette.lightBlue.withOpacity(0.5),
        shape: StadiumBorder(
          side: BorderSide(
            color: image != null
                ? $constants.palette.white
                : $constants.palette.blue,
            width: 1,
            strokeAlign: 4,
          ),
        ),
      ),
      child: Container(
        width: $constants.carousel.marginAmount,
        height: $constants.carousel.marginAmount,
        decoration: ShapeDecoration(
          shape: StadiumBorder(
            side: BorderSide(
              color: image != null
                  ? $constants.palette.blue
                  : $constants.palette.white,
              width: 1,
            ),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular($constants.insets.offset),
          child: image != null
              ? Image.network(
                  image,
                  height: $constants.carousel.marginAmount,
                  width: $constants.carousel.marginAmount,
                  fit: BoxFit.cover,
                )
              : Icon(
                  Icons.add,
                  color: $constants.palette.white,
                ),

          //Vika delete after test
          // : BackdropFilter(
          //     filter: ImageFilter.blur(
          //       sigmaX: $constants.events.eventMembersBlur,
          //       sigmaY: $constants.events.eventMembersBlur,
          //     ),
          //     child: Icon(
          //       Icons.add,
          //       color: $constants.palette.white,
          //     ),
          //   ),
        ),
      ),
    );
  }
}
