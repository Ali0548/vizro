
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_color.dart';
import 'app_size.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  // final FocusNode focusNode;
  // final FocusNode nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPassword;
  // final Function onChanged;
  // final Function onSubmit;
  final bool isEnabled;
  final bool isVerification;
  final bool isUserName;
  final int maxLines;
  final TextCapitalization capitalization;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final bool divider;

  CustomTextField(
      {this.hintText = 'Write something...',
        required this.controller,
        this.isVerification=false,
        this.isUserName=false,
        // this.focusNode,
        // this.nextFocus,
        this.isEnabled = true,
        this.inputType = TextInputType.text,
        this.inputAction = TextInputAction.next,
        this.maxLines = 1,
        // required this.onSubmit,
        // this.onChanged,
        required this.prefixIcon,
        required this.suffixIcon,
        this.capitalization = TextCapitalization.none,
        this.isPassword = false,
        this.divider = false, }
      );

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText =true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          maxLines: widget.maxLines,
          controller: widget.controller,
          // focusNode: widget.focusNode,
          // style: robotoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE),
          textInputAction: widget.inputAction,
          keyboardType: widget.inputType,
          // cursorColor: Theme.of(context).primaryColor,
          // textCapitalization: widget.capitalization,
          enabled: widget.isEnabled,
          autofocus: false,
          autofillHints: widget.inputType == TextInputType.name ? [AutofillHints.name]
              : widget.inputType == TextInputType.emailAddress ? [AutofillHints.email]
              : widget.inputType == TextInputType.phone ? [AutofillHints.telephoneNumber]
              : widget.inputType == TextInputType.streetAddress ? [AutofillHints.fullStreetAddress]
              : widget.inputType == TextInputType.url ? [AutofillHints.url]
              : widget.inputType == TextInputType.visiblePassword ? [AutofillHints.password] : null,

          obscureText: widget.isPassword ? _obscureText : false,
          inputFormatters: widget.inputType == TextInputType.phone ?!widget.isVerification?
          <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp('[0-9+]'))]: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp('[0-6+]'))]: null,
          decoration: InputDecoration(
              // focusedBorder :Border(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.kPrimary, width: 1),
            ),
            border: OutlineInputBorder(
              // borderRadius: BorderRadius.circular(AppSizes.appHorizontalSm),
              borderSide: BorderSide(style: BorderStyle.solid, width: 0),
            ),
            isDense: true,
            hintText: widget.hintText,
            fillColor: AppColors.kWhite,
            // fillColor: Theme.of(context).cardColor,
            // hintStyle: robotoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE, color: Theme.of(context).hintColor),
            filled: true,
            prefixIcon: widget.prefixIcon != null ?
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.appHorizontalSm),
              child: (widget.prefixIcon ),
            ) : null,

            suffixIcon: (widget.isPassword || widget.isUserName) ? IconButton(
              icon: Icon(widget.isUserName?!_obscureText ? Icons.visibility_off : Icons.visibility:_obscureText ? Icons.visibility_off : Icons.visibility, color: Theme.of(context).hintColor.withOpacity(0.3)),
              onPressed: _toggle,
            ) :!widget.isVerification?
            widget.suffixIcon:null,
          ),
          // onSubmitted: (text) => widget.nextFocus != null ? FocusScope.of(context).requestFocus(widget.nextFocus)
          //     : widget.onSubmit != null ? widget.onSubmit(text) : null,
          // onChanged: widget.onChanged,
        ),

        widget.divider ? Padding(padding: EdgeInsets.symmetric(horizontal: AppSizes.appHorizontalLg), child: Divider()) : SizedBox(),
      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
