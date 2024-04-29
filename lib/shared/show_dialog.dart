import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<bool?> showAppDialog({
  required BuildContext context,
  required Widget child,
  double? borderRadius,
  Color? backgroundColor,
  bool isDismissible = true,
  EdgeInsets? insetPadding,
}) {
  return showDialog<bool?>(
    context: context,
    barrierDismissible: isDismissible,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: backgroundColor,
        insetPadding: insetPadding?? EdgeInsets.symmetric(horizontal: 40.w, vertical: 24.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
        ),
        child: WillPopScope(
          onWillPop: () async => isDismissible,
          child: child,
        ),
      );
    },
  );
}
