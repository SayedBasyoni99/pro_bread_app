import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pro_bread_app/core/resources/assets.gen.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    this.hintTextStyle,
    this.labelStyle,
    this.borderColor,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.isPassword = false,
    this.enabled = true,
    this.autoFocus = false,
    this.error = false,
    this.smallSuffixIcon = false,
    this.borderRadius,
    this.maxLines = 1,
    this.minLines,
    this.hintColor,
    this.width,
    this.height,
    this.label,
    this.fillColor,
    this.hint,
    this.onSubmitted,
    this.controller,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.contentPadding,
    this.textAlign = TextAlign.start,
    this.hasDropDown = false,
    this.hintSize,
    this.readOnly = false,
    this.text,
    this.hasPoint = false,
    this.onTap,
    this.textStyle,
    this.maxLength,
  });

  final bool? hasDropDown;
  final String? text;
  final TextInputAction textInputAction;
  final Color? borderColor;
  final double? width;
  final Function(String)? onSubmitted;
  final double? height;
  final String? hint;
  final Color? hintColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool enabled, readOnly;
  final bool autoFocus;
  final bool smallSuffixIcon;
  final bool error;
  final int maxLines;
  final int? minLines;
  final BorderRadius? borderRadius;
  final Color? fillColor;
  final Function(String)? onChanged;
  final String? label;
  final AutovalidateMode? autovalidateMode;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign textAlign;
  final TextStyle? hintTextStyle;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final double? hintSize;
  final bool hasPoint;
  final void Function()? onTap;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> obscure = ValueNotifier(true);

    return ValueListenableBuilder(
      valueListenable: obscure,
      builder: (context, obscuredValue, _) {
        return TextFormField(
            controller: controller,
            validator: validator,
            // style: context.textTheme.titleLarge?.copyWith(fontSize: FontSize.s16),
            style: textStyle,
            onFieldSubmitted: onSubmitted,
            textInputAction: textInputAction,
            cursorColor: Colors.white,
            enabled: enabled,
            readOnly: readOnly,
            inputFormatters: keyboardType == TextInputType.number
                ? !hasPoint
                    ? [FilteringTextInputFormatter.digitsOnly]
                    : [
                        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                      ]
                : null,
            keyboardType: keyboardType,
            maxLines: maxLines,
            onChanged: onChanged,
            autofocus: autoFocus,
            obscureText: isPassword && obscuredValue,
            enableSuggestions: isPassword,
            autocorrect: isPassword,
            autovalidateMode: autovalidateMode ?? AutovalidateMode.always,
            textAlign: textAlign,
            onTap: () {
              if (controller != null && controller!.text.isEmpty) {
                final lastSelectionPosition = TextSelection.fromPosition(
                  TextPosition(offset: controller!.text.length - 1),
                );

                final afterLastSelectionPosition = TextSelection.fromPosition(
                  TextPosition(offset: controller!.text.length),
                );

                if (controller!.selection == lastSelectionPosition) {
                  controller!.selection = afterLastSelectionPosition;
                }
              }
              onTap?.call();
            },
            maxLength: maxLength,
            minLines: minLines,
            decoration: InputDecoration(
              errorMaxLines: 2,
              contentPadding: contentPadding,
              hintText: hint,
              prefixIcon: prefixIcon,
              prefixIconConstraints: smallSuffixIcon ? const BoxConstraints(maxWidth: .15) : null,
              // suffixIcon:
              // isPassword
              //     ? obscuredValue
              //         ? Assets.icons.eyeOff.path.toSvg().onTap(() {
              //             obscure.value = !obscuredValue;
              //           })
              //         : Assets.icons.eye.path.toSvg().onTap(() {
              //             obscure.value = !obscuredValue;
              //           })
              //     : suffixIcon,
              //       suffixIconConstraints: smallSuffixIcon ? const BoxConstraints(maxWidth: .15) : null),
              // ).setTitleText(
              //   context,
              //   title: label,
              //   titleStyle: labelStyle ?? context.textTheme.bodyMedium!.copyWith(fontSize: FontSize.s16),
            ));
      },
    );
  }
}
