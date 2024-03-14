import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/models/events/convention/convention_model.dart';
import 'package:senpai/screens/new_event/bloc/new_event_convention_bloc/new_event_convention_bloc.dart';

import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class DropDownMenuWidget extends StatelessWidget {
  final List<ConventionModel> conventionsList;
  final ConventionModel? selectedConvention;

  const DropDownMenuWidget({
    super.key,
    required this.conventionsList,
    this.selectedConvention,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<ConventionModel>(
      initialSelection: selectedConvention,
      requestFocusOnTap: false,
      enableSearch: false,
      onSelected: (ConventionModel? convention) {
        final bloc = BlocProvider.of<NewEventConventionBloc>(context);
        bloc.add(OnSelectConvention(convention));
      },
      width: getSize(context).width - 64,
      menuHeight: 300,
      inputDecorationTheme: _inputDecorationTheme(context),
      hintText: R.strings.selectConventionText,
      menuStyle: _menuStyle(),
      dropdownMenuEntries:
          conventionsList.map<DropdownMenuEntry<ConventionModel>>(
        (ConventionModel item) {
          return DropdownMenuEntry<ConventionModel>(
            value: item,
            label: item.title,
            labelWidget: _buildItem(context, item),
            style: _buttonStyle(),
          );
        },
      ).toList(),
    );
  }

  Widget _buildItem(BuildContext context, ConventionModel item) {
    final startDate = DateFormat('MMMM dd').format(item.startDate);
    final endDate = DateFormat('MMMM dd, yyyy').format(item.endDate!);

    return Container(
      padding: EdgeInsets.all($constants.insets.sm),
      margin: EdgeInsets.symmetric(
        vertical: $constants.insets.xxs,
        horizontal: $constants.insets.sm,
      ),
      decoration: profileBoxDecoration(),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular($constants.corners.sm),
            child: Image.network(
              item.coverImageUrl,
              height: $constants.insets.xxl,
              width: $constants.insets.xxl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: $constants.corners.sm),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: getTextTheme(context).bodySmall?.copyWith(
                        color: $constants.palette.white,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  '$startDate - $endDate',
                  style: getTextTheme(context).labelMedium?.copyWith(
                        color: $constants.palette.white,
                      ),
                ),
                Text(
                  '${item.displayCity}, ${item.displayState}',
                  style: getTextTheme(context).labelMedium?.copyWith(
                        color: $constants.palette.white,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  MenuStyle _menuStyle() {
    return MenuStyle(
      backgroundColor: MaterialStateProperty.all($constants.palette.darkBlue),
      surfaceTintColor: MaterialStateProperty.all(
        $constants.palette.darkBlue,
      ),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: $constants.insets.sm),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular($constants.corners.xl),
          side: BorderSide(
            width: 1.0,
            color: $constants.palette.buttonBorder,
          ),
        ),
      ),
    );
  }

  InputDecorationTheme _inputDecorationTheme(BuildContext context) {
    return InputDecorationTheme(
      filled: true,
      isCollapsed: true,
      fillColor: $constants.palette.buttonBackground,
      contentPadding: EdgeInsets.only(left: $constants.insets.md),
      hintStyle: getTextTheme(context).bodyMedium!.copyWith(
            color: $constants.palette.darkGrey,
          ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.0,
          color: $constants.palette.buttonBorder,
        ),
        borderRadius: BorderRadius.all(Radius.circular(
          $constants.corners.xxl,
        )),
      ),
    );
  }

  ButtonStyle _buttonStyle() {
    return ButtonStyle(
      overlayColor: MaterialStateProperty.all($constants.palette.darkBlue),
      foregroundColor: MaterialStateProperty.all($constants.palette.darkBlue),
      backgroundColor: MaterialStateProperty.all($constants.palette.darkBlue),
    );
  }
}
