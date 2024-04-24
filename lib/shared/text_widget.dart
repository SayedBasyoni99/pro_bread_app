import 'package:pro_bread_app/core/uitls/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWidget extends StatelessWidget {
  final String? title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool isOffer;
  // ignore: use_key_in_widget_constructors
  const TextWidget({
    required this.title,
    this.fontSize,
    this.fontWeight,
    this.maxLines = 2,
    this.color,
    this.textAlign,
    this.isOffer = false,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      title??"",
      maxLines: maxLines,
      overflow:maxLines == null ? null : TextOverflow.ellipsis,
      textDirection:
          Utils.isArabic(title ?? "") ? TextDirection.rtl : TextDirection.ltr,
      style: TextStyle(
        fontSize: fontSize?? 14.sp,
        fontWeight: fontWeight,
        decoration: isOffer ? TextDecoration.lineThrough : null,
        height: 1.2,
        color: color ?? Theme.of(context).textTheme.bodyText1!.color,
      ),
      textAlign: textAlign,
    );
  }
}
