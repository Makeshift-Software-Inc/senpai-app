import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/core/events/blocs/create_event/create_event_bloc.dart';
import 'package:senpai/core/widgets/primary_button.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/screens/edit_profile/widgets/edit_profile_content/edit_profile_input_widget.dart';
import 'package:senpai/screens/new_event/widgets/event_location_textfield_widget.dart';
import 'package:senpai/screens/new_event/bloc/new_event_bloc.dart';
import 'package:senpai/screens/new_event/enums/new_event_enums.dart';
import 'package:senpai/screens/new_event/new_event_convention_content/new_event_convention_content.dart';
import 'package:senpai/screens/new_event/widgets/new_event_cosplay_widget.dart';
import 'package:senpai/screens/new_event/widgets/new_event_date_picker.dart';
import 'package:senpai/screens/new_event/widgets/new_event_image_widget.dart';
import 'package:senpai/screens/new_event/widgets/new_event_item_button.dart';
import 'package:senpai/core/widgets/senpai_toogle_buttons.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class NewEventContent extends StatelessWidget {
  const NewEventContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewEventBloc, NewEventState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<NewEventBloc>(context);
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: $constants.insets.sm,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NewEventImageWidget(),
                SizedBox(height: $constants.insets.sm),
                _buildNameWidget(context, state),
                SizedBox(height: $constants.insets.sm),
                _buildDescriptionWidget(context, state),
                SizedBox(height: $constants.insets.sm),
                EventLocationTextFieldWidget(
                  controller: bloc.locationController,
                  focus: FocusNode(),
                  isError: state is ErrorNewEventState &&
                      state.isEnable &&
                      bloc.locationController.text.isEmpty,
                ),
                SizedBox(height: $constants.insets.sm),
                _buildVenueWidget(context, state),
                const NewEventDatePicker(),
                _buildPartySizeWidget(context, state),
                SizedBox(height: $constants.insets.sm),
                _buildPaymentLayer(context),
                SizedBox(height: $constants.insets.sm),
                NewEventCosplayWidget(
                  cosplayRequiredIndex: bloc.cosplayRequiredIndex,
                ),
                SizedBox(height: $constants.insets.sm),
                NewEventConventionContent(startData: bloc.startTimeEvent),
                SizedBox(height: $constants.insets.sm),
                _buildSaveButton(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNameWidget(BuildContext context, NewEventState state) {
    final bloc = BlocProvider.of<NewEventBloc>(context);
    return EditProfileInputWidget(
      placeholder: R.strings.eventNameText,
      controller: bloc.eventNameController,
      onTextChanged: (String eventName) {
        bloc.add(OnChangeEventNameEvent(eventName));
      },
      errorText: R.strings.invalidEventNameError,
      isError: state is ErrorNewEventState &&
          state.isEnable &&
          bloc.eventNameController.text.isEmpty,
    );
  }

  Widget _buildDescriptionWidget(BuildContext context, NewEventState state) {
    final bloc = BlocProvider.of<NewEventBloc>(context);
    return EditProfileInputWidget(
      placeholder: R.strings.aboutEventText,
      controller: bloc.eventDescriptionController,
      onTextChanged: (String description) =>
          bloc.add(OnChangeEventDescriptionEvent(description)),
      maxLines: 4,
      errorText: R.strings.invalidDescriptionError,
      isError: state is ErrorNewEventState &&
          state.isEnable &&
          bloc.eventDescriptionController.text.isEmpty,
    );
  }

  Widget _buildVenueWidget(BuildContext context, NewEventState state) {
    final bloc = BlocProvider.of<NewEventBloc>(context);
    return EditProfileInputWidget(
      placeholder: R.strings.venueText,
      controller: bloc.eventVenueController,
      onTextChanged: (String venue) => bloc.add(OnChangeEventVenueEvent(venue)),
      errorText: R.strings.invalidVenueError,
      isError: state is ErrorNewEventState &&
          state.isEnable &&
          bloc.eventVenueController.text.isEmpty,
    );
  }

  Widget _buildPartySizeWidget(BuildContext context, NewEventState state) {
    final bloc = BlocProvider.of<NewEventBloc>(context);
    final isValidPartySize = isValidMaxPartySize(bloc.eventSizeController.text);
    return EditProfileInputWidget(
      placeholder: R.strings.maxPartySizeText,
      description: R.strings.availableSlotsText,
      controller: bloc.eventSizeController,
      showHintText: false,
      keyboardType: TextInputType.number,
      onTextChanged: (String size) => bloc.add(OnChangeEventSizeEvent(size)),
      errorText: R.strings.invalidMaxPartySizeError,
      isError:
          state is ErrorNewEventState && state.isEnable && !isValidPartySize,
    );
  }

  Widget _buildPaymentLayer(BuildContext context) {
    final bloc = BlocProvider.of<NewEventBloc>(context);
    return NewEventItemButton(
      title: R.strings.requiresPaymentText,
      customWidget: SenpaiToggleButtons(
        items: PaymentRequired.values
            .map((item) => paymentToString(item))
            .toList(),
        onTapItem: (index) {
          bloc.add(OnChangeRequiredPaymentEvent(index));
        },
        selectedIndex: bloc.paymentRequiredIndex,
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    final bloc = BlocProvider.of<NewEventBloc>(context);
    final serverBloc = BlocProvider.of<CreateEventBloc>(context);
    return BlocListener<NewEventBloc, NewEventState>(
      listenWhen: (_, currState) => currState is ValidEventSucssesfulState,
      listener: (context, state) async {
        serverBloc.createEvent(image: bloc.eventImage!, model: bloc.newEvent);
      },
      child: PrimaryButton(
        text: R.strings.createEventTitle,
        onPressed: () {
          bloc.add(OnSaveNewEvent());
        },
      ),
    );
  }
}
