import 'package:flutter/material.dart';
import 'package:pro_bread_app/core/const/constant_var.dart';

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
    this.obscureText = false,
    this.borderColor = AppConst.kBorderButtonColor,
  });
  final String? hintTxt;
  final int? maxLines;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final IconButton? iconButton;
  final bool obscureText;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
          suffixIcon: iconButton,
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
