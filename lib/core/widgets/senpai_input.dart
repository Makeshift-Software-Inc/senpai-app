import 'package:flutter/material.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class SenpaiInput extends StatefulWidget {
  final String placeholder;
  final String errorText;
  final bool isError;
  final bool isValid;
  final TextEditingController controller;
  final Function(String) onTextChanged;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final int maxLines;

  const SenpaiInput({
    super.key,
    required this.placeholder,
    this.isError = false,
    this.isValid = false,
    required this.controller,
    required this.onTextChanged,
    required this.errorText,
    this.keyboardType = TextInputType.text,
    this.onTap,
    this.maxLines = 1,
  });

  @override
  State<SenpaiInput> createState() => _SenpaiInputState();
}

class _SenpaiInputState extends State<SenpaiInput> {
  final focusNode = FocusNode();
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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
          child: Container(
            decoration: BoxDecoration(
              color: $constants.palette.bgInput,
              borderRadius: BorderRadius.circular($constants.corners.md),
              shape: BoxShape.rectangle,
              // border: Border.all(
              //   color: widget.isError
              //       ? $constants.palette.red
              //       : widget.isValid
              //           ? Colors.transparent
              //           : $constants.palette.buttonBorder,
              //   width: 1.0,
              // ),
              boxShadow: widget.isError
                  ? [
                      BoxShadow(
                        color: $constants.palette.red.withOpacity(0.8),
                        blurRadius: 8.0,
                        spreadRadius: 1.0,
                        offset: const Offset(0, 0),
                      ),
                    ]
                  : hasFocus
                      ? [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.2),
                            blurRadius: 8.0,
                            spreadRadius: 1.0,
                            offset: const Offset(0, 0),
                          ),
                        ]
                      : [],
            ),
            child: TextField(
              readOnly: widget.onTap != null,
              onTap: widget.onTap,
              onTapOutside: (_) {
                focusNode.unfocus();
              },
              onChanged: (String value) {
                widget.onTextChanged(value);
              },
              maxLines: widget.maxLines,
              focusNode: focusNode,
              decoration: _getDecoration(),
              controller: widget.controller,
              style: getTextTheme(context)
                  .bodyMedium
                  ?.copyWith(color: $constants.palette.white),
            ),
          ),
        ),
        if (widget.isError) _createError(context),
      ],
    );
  }

  InputDecoration _getDecoration() {
    return InputDecoration(
      hintText: widget.placeholder,
      hintStyle: getTextTheme(context)
          .bodyMedium!
          .copyWith(color: $constants.palette.darkGrey),
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
    );
  }

  Widget _createError(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 2, top: getWidthSize(context, 0.044)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            color: $constants.palette.red,
            size: getWidthSize(context, 0.045),
          ),
          SizedBox(width: getWidthSize(context, 0.025)),
          Text(
            widget.isError ? widget.errorText : '',
            style: TextStyle(
              color: $constants.palette.red,
              fontWeight: FontWeight.w400,
              fontSize: getWidthSize(context, 0.032),
            ),
          ),
        ],
      ),
    );
  }
}
