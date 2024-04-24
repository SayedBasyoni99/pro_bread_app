import 'package:flutter/material.dart';

import '../core/const/constant_var.dart';

class CustomAppBar {
  static AppBar build(
    BuildContext context, {
    String? titleText,
    Widget? title,
    bottom,
    iconAppBar,
    leading,
    List<Widget>? actions,
    bool removeBack = false,
    centerTitle = true,
    reverseColor = false,
    showNotification = false,
    Color? backgroundColor = Colors.transparent,
  }) {
    return AppBar(
      backgroundColor: AppConst.kPrimaryColor,
      elevation: 0,
      title: Text(
        titleText ?? 'Pro Bread',
        style: const TextStyle(color: AppConst.kScondaryTextColor, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading: Ink(
        padding: const EdgeInsets.all(1),
       
        child: Container(
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsetsDirectional.only(start: 16.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: AppConst.kBorderBoxColor),
            child: iconAppBar),
      ),
      leadingWidth: 72.0,

      // actions: const [
      //   Icon(Icons.search),
      //   Gap(10.0),
      //   Icon(Icons.notifications),
      // ],
    );
  }
}
