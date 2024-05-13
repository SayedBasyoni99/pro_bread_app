import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import '../core/const/constant_var.dart';

class PinCodeWidget extends StatelessWidget {
  final Function(String) textSubmit;
  final TextEditingController? controller;
  final int? pinLength;
  final FocusNode? focus;
  final double? pinBoxWidth;

  const PinCodeWidget({
    super.key,
    this.controller,
    this.pinLength,
    this.focus,
    this.pinBoxWidth,
    required this.textSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PinCodeTextField(
        autofocus: true,
        highlight: true,
        focusNode: focus,
        controller: controller,
        maxLength: pinLength ?? 6,
        pinBoxHeight: 50.w,
        pinBoxWidth: 50.w,
        pinBoxRadius: 16.r,
        pinBoxBorderWidth: 1.w,
        wrapAlignment: WrapAlignment.center,
        pinTextAnimatedSwitcherDuration: const Duration(milliseconds: 300),
        keyboardType: TextInputType.number,
        pinTextStyle: TextStyle(
          fontSize: 20.sp,
          color: AppConst.kBorderButtonColor,
        ),
        onTextChanged: (text) {},
        highlightPinBoxColor: AppConst.kBorderBoxColor,
        pinBoxColor: AppConst.kBorderBoxColor,
        defaultBorderColor: Colors.transparent,
        hasTextBorderColor: Colors.transparent,
        highlightColor: AppConst.kBorderButtonColor,
        
        pinBoxDecoration: ProvidedPinBoxDecoration.defaultPinBoxDecoration,
        onDone: (text) => textSubmit(text),
      ),
    );
  }
}
