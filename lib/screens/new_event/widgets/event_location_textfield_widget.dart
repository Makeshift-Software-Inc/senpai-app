import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/screens/new_event/bloc/new_event_bloc.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class EventLocationTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focus;
  final bool isError;

  const EventLocationTextFieldWidget({
    Key? key,
    required this.controller,
    required this.focus,
    required this.isError,
  }) : super(key: key);

  void _itemClick(BuildContext context, Prediction prediction) {
    controller.text = prediction.description ?? '';
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: prediction.description?.length ?? 0),
    );
    focus.unfocus();
    final bloc = BlocProvider.of<NewEventBloc>(context);
    bloc.add(
      OnChangeEventLocationEvent(
        prediction.description ?? '',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isError) _createError(context),
        Container(
          padding: EdgeInsets.all($constants.insets.sm),
          decoration: _locationBoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                R.strings.locationTitle,
                style: getTextTheme(context).bodyMedium?.copyWith(
                    color: $constants.palette.white,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: $constants.insets.xs),
              GooglePlaceAutoCompleteTextField(
                textEditingController: controller,
                googleAPIKey: $constants.apiKeys.placesApiKey,
                inputDecoration: InputDecoration.collapsed(
                  hintText: R.strings.locationTitle,
                  hintStyle: getTextTheme(context)
                      .bodyMedium!
                      .copyWith(color: $constants.palette.darkGrey),
                ),
                textStyle: getTextTheme(context)
                    .bodyMedium!
                    .copyWith(color: $constants.palette.grey),
                focusNode: focus,
                boxDecoration: BoxDecoration(
                  border: Border.all(
                    color: $constants.palette.lightBlue,
                    width: 1.0,
                  ),
                ),
                debounceTime: $constants.times.fast.inMilliseconds,
                isLatLngRequired: true,
                getPlaceDetailWithLatLng: (Prediction prediction) {},
                itemClick: (Prediction prediction) {
                  _itemClick(context, prediction);
                },
                itemBuilder: (context, index, Prediction prediction) {
                  return _buildItem(prediction);
                },
                seperatedBuilder: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: $constants.insets.sm),
                  child: const Divider(),
                ),
                isCrossBtnShown: true,
                containerHorizontalPadding: 0,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildItem(Prediction prediction) {
    return Padding(
      padding: EdgeInsets.all($constants.insets.xs),
      child: Row(
        children: [
          const Icon(Icons.location_on),
          SizedBox(
            width: $constants.insets.xs,
          ),
          Expanded(child: Text(prediction.description ?? ''))
        ],
      ),
    );
  }

  Widget _createError(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 2),
      child: Text(
        'Invalid location. Please try again', //R.strings.invalidLocationError,
        style: getTextTheme(context)
            .labelMedium
            ?.copyWith(color: $constants.palette.red),
      ),
    );
  }

  BoxDecoration _locationBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular($constants.corners.md),
      shape: BoxShape.rectangle,
      color: $constants.palette.lightBlue,
      border: Border.all(
        color: isError ? $constants.palette.red : $constants.palette.lightBlue,
        width: 1.0,
      ),
    );
  }
}
