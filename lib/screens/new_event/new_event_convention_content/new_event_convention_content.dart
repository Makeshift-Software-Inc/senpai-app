import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:senpai/core/events/blocs/fetch_conventions/fetch_conventions_bloc.dart';
import 'package:senpai/core/widgets/icon_input.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/screens/new_event/bloc/new_event_bloc.dart';
import 'package:senpai/screens/new_event/bloc/new_event_convention_bloc/new_event_convention_bloc.dart';
import 'package:senpai/screens/new_event/new_event_convention_content/dropdown_menu_widget.dart';

import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class NewEventConventionContent extends StatelessWidget {
  final DateTime startData;
  const NewEventConventionContent({
    super.key,
    required this.startData,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewEventConventionBloc, NewEventConventionState>(
      listener: (context, state) {
        if (state is SelectConventionSucssesfulState) {
          final bloc = BlocProvider.of<NewEventConventionBloc>(context);
          final eventBloc = BlocProvider.of<NewEventBloc>(context);

          eventBloc.add(
            OnChangeConventionEvent(
              int.tryParse(bloc.selectedConvention!.id),
            ),
          );
        }
      },
      builder: (context, state) {
        final bloc = BlocProvider.of<NewEventConventionBloc>(context);

        return Container(
          padding: EdgeInsets.all($constants.insets.sm),
          decoration: profileBoxDecoration(),
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                R.strings.eventAssociatedWithConventionText,
                style: getTextTheme(context).bodyMedium?.copyWith(
                      color: $constants.palette.white,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(height: $constants.insets.sm),
              Row(
                children: [
                  Expanded(child: _buildSearch(context)),
                  SizedBox(width: $constants.insets.sm),
                  _buildImageIcon(context),
                ],
              ),
              SizedBox(height: $constants.insets.sm),
              DropDownMenuWidget(
                conventionsList: bloc.conventionsList,
                selectedConvention: bloc.selectedConvention,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSearch(BuildContext context) {
    final bloc = BlocProvider.of<NewEventConventionBloc>(context);
    return SenpaiIconInput(
      hintText: R.strings.findConventionText,
      borderRadius: $constants.corners.xxl,
      controller: bloc.searchController,
      onChange: (String search) {
        bloc.add(OnChangeSearchConventionEvent(search));
      },
      iconPath: PathConstants.searchIcon,
      focusNode: FocusNode(),
    );
  }

  Widget _buildImageIcon(BuildContext context) {
    final bloc = BlocProvider.of<NewEventConventionBloc>(context);
    final serverBloc = BlocProvider.of<FetchConventionsBloc>(context);

    return GestureDetector(
      onTap: () {
        serverBloc.fetchConventions(
          startDate: startData,
          searchText: bloc.searchText,
        );
      },
      child: Container(
        padding: EdgeInsets.all($constants.insets.sm),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: $constants.palette.darkGrey,
            width: 1.0,
          ),
        ),
        child: SvgPicture.asset(
          PathConstants.searchIcon,
          width: $constants.corners.lg,
          height: $constants.corners.lg,
        ),
      ),
    );
  }
}
