import 'package:flutter/material.dart';
import '../core/const/constant_var.dart';

class CustomTxtField extends StatelessWidget {
  const CustomTxtField({
    super.key,
    this.hintTxt,
    this.textInputType,
    this.controller,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    this.iconButton,
    this.iconButton02,
    this.obscureText = false,
    this.borderColor = AppConst.kBorderButtonColor,
    this.fillColor = AppConst.kPrimaryColor,
    this.textDirection = TextDirection.ltr,
    this.filled = false,
    this.readOnly = false,
    this.onTap,
  });
  final String? hintTxt;
  final int? maxLines;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final Widget? iconButton, iconButton02;
  final bool obscureText, filled;
  final Color borderColor, fillColor;
  final TextDirection textDirection;
  final bool readOnly;
  final void Function()? onTap;
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      onTap: onTap,
      textDirection: textDirection,
      obscureText: obscureText,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This Field is Requaired';
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      cursorColor: AppConst.kThirdTextColor,
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled:filled,
          suffixIcon: iconButton,
          prefixIcon: iconButton02,
          hintText: ' $hintTxt',
          hintStyle: const TextStyle(color: Color.fromARGB(134, 145, 145, 145)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: borderColor),
          )),
    );
  }
}
