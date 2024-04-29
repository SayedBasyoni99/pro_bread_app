import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class PinCodeWidget extends StatelessWidget {
  final Function(String) textSubmit;
  final TextEditingController? controller;
  final int? pinLength;
  final FocusNode? focus;
  final double? pinBoxWidth;

  const PinCodeWidget({
    Key? key,
    this.controller,
    this.pinLength,
    this.focus,
    this.pinBoxWidth,
    required this.textSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PinCodeTextField(
        autofocus: true,
        highlight: true,
        focusNode: focus,
        controller: controller,
        maxLength: pinLength ?? 6,
        pinBoxHeight: 60.r,
        pinBoxWidth: 60.r,
        pinBoxRadius: 16.r,
        pinBoxBorderWidth: 1.w,
        wrapAlignment: WrapAlignment.center,
        pinTextAnimatedSwitcherDuration: const Duration(milliseconds: 300),
        keyboardType: TextInputType.number,
        pinTextStyle: TextStyle(
          fontSize: 20.sp,
          color: Colors.black,
        ),
        onTextChanged: (text) {},
        highlightPinBoxColor: Colors.transparent,
        pinBoxColor: Colors.transparent,
        defaultBorderColor: Colors.green,
        hasTextBorderColor: Colors.red,
        highlightColor: Colors.red,
        pinBoxDecoration: ProvidedPinBoxDecoration.defaultPinBoxDecoration,
        onDone: (text) => textSubmit(text),
      ),
    );
  }
}
