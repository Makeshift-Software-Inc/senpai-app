import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class SenpaiPhoneInput extends StatefulWidget {
  final String placeholder;
  final String errorText;
  final bool isError;
  final bool isValid;
  final TextEditingController controller;
  final Function(PhoneNumber) onTextChanged;
  final TextInputType? keyboardType;

  const SenpaiPhoneInput({
    super.key,
    required this.placeholder,
    this.isError = false,
    this.isValid = false,
    required this.controller,
    required this.onTextChanged,
    required this.errorText,
    this.keyboardType = TextInputType.number,
  });

  @override
  State<SenpaiPhoneInput> createState() => _SenpaiPhoneInputState();
}

class _SenpaiPhoneInputState extends State<SenpaiPhoneInput> {
  final focusNode = FocusNode();

  PhoneNumber number = PhoneNumber(isoCode: $constants.specials.defaultCountry);
  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        hasFocus = focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _createError(context),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: $constants.palette.bgInput,
                  borderRadius: BorderRadius.circular($constants.corners.md),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                      color: widget.isError
                          ? $constants.palette.red
                          : widget.isValid
                              ? $constants.palette.pink
                              : $constants.palette.buttonBorder,
                      width: 1.0),
                  boxShadow: hasFocus
                      ? [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.2),
                            blurRadius: 8.0,
                            spreadRadius: 1.0,
                            offset: const Offset(0, 0),
                          ),
                        ]
                      : [],
                  // Separator
                ),
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber phoneNumber) {
                    widget.onTextChanged(phoneNumber);
                  },
                  inputBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none, // No border for inner input
                  ),
                  hintText: widget.placeholder,
                  focusNode: focusNode,
                  countries: $constants.specials.allowedCountries,
                  initialValue: number,
                  formatInput: true,
                  textFieldController: widget.controller,
                  keyboardType: widget.keyboardType!,
                  autoValidateMode: AutovalidateMode.disabled,
                  textStyle: getTextTheme(context)
                      .bodyMedium
                      ?.copyWith(color: $constants.palette.white),
                  selectorTextStyle: getTextTheme(context)
                      .bodyMedium
                      ?.copyWith(color: $constants.palette.white),
                  searchBoxDecoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: $constants.palette.buttonBorder),
                    ),
                  ),
                  spaceBetweenSelectorAndTextField: 0,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _createError(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 2),
      child: Text(
        widget.isError ? widget.errorText : '',
        style: getTextTheme(context)
            .labelMedium
            ?.copyWith(color: $constants.palette.red),
      ),
    );
  }
}
