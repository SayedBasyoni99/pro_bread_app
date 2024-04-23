
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Utils {
  // static String lang =CacheHelper.getData(key: "lang") ;

  static void openScreen(BuildContext context, Widget screen, {bool replacment = false, bool remove = false}) {
    if (remove) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => screen),
        (route) => false,
      );
    } else if (replacment) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => screen));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
    }
  }

  // static Future<String?> getToken() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userValue = prefs.getString(Statics.user);
  //   if (userValue != null && userValue.isNotEmpty) {
  //     final jsonUser = jsonDecode(userValue);
  //     LoginResponse loginResponse = LoginResponse.fromJson(jsonUser);
  //     return loginResponse.data?.token;
  //   } else {
  //     return null;
  //   }
  // }

  static Widget notiWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Utils.openScreen(context, const NotificationsScreen());
      },
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Image.asset(
          "assets/images/ic_noti_black.png",
          width: 30.w,
          height: 30.w,
        ),
      ),
    );
  }

  static void showrDialog(
      {required BuildContext context,
      required String msg,
      required String title,
      required String buttonText,
      VoidCallback? onTap}) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: GestureDetector(onTap: () => Navigator.pop(context), child: const Icon(Icons.clear))),
                    SizedBox(height: 16.h),
                    // TextWidget(title: title, fontSize: 20.sp, fontWeight: FontWeight.bold),
                    // SizedBox(height: 8.h),
                    // TextWidget(
                    //   title: msg,
                    //   fontSize: 16.sp,
                    //   maxLines: 8,
                    // ),
                    SizedBox(
                      height: 64.h,
                    ),
                    // ButtonWidget(
                    //   title: buttonText,
                    //   height: 0.13.sw,
                    //   onTap: onTap,
                    // )
                  ],
                ),
              ),
            ));
  }

  static Widget backWidget(BuildContext context, {VoidCallback? onBack, bool arabicLang = false}) {
    return GestureDetector(
        onTap: () {
          if (onBack != null) {
            onBack.call();
          }
          Navigator.pop(context);
        },
        child: Card(
            child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            Icons.arrow_back_ios_outlined,
            // color: mainColor,
            size: 18.w,
          ),
        )));
  }

  // static void showMsg(String msg, {bool error = false}) {
  //   Fluttertoast.showToast(
  //       msg: msg,
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: error ? Colors.red : Colors.green,
  //       textColor: Colors.white,
  //       fontSize: 16.0);
  // }

  static isArabic(text) {
    RegExp arabicRegex = RegExp(r'[\u0600-\u06FF\u0750-\u077F]');
    return arabicRegex.hasMatch(text);
  }

  // static Future<ImageSource?> showImageSource(BuildContext context) async {
  //   if (Platform.isIOS) {
  //     return showCupertinoModalPopup<ImageSource>(
  //         context: context,
  //         builder: (context) => CupertinoActionSheet(
  //               actions: [
  //                 CupertinoActionSheetAction(
  //                   child: const Text('Camera'),
  //                   onPressed: () => Navigator.of(context).pop(ImageSource.camera),
  //                 ), // CupertinoActionSheetAction
  //                 CupertinoActionSheetAction(
  //                   child: const Text('Gallery'),
  //                   onPressed: () => Navigator.of(context).pop(ImageSource.gallery),
  //                 ), // CupertinoActionSheetAction
  //               ],
  //             ));
  //   } else {
  //     return showModalBottomSheet(
  //         context: context,
  //         builder: (context) => Column(mainAxisSize: MainAxisSize.min, children: [
  //               ListTile(
  //                 leading: const Icon(Icons.camera_alt),
  //                 title: const Text('Camera'),
  //                 onTap: () => Navigator.of(context).pop(ImageSource.camera),
  //               ), // ListTile
  //               ListTile(
  //                 leading: const Icon(Icons.image),
  //                 title: const Text('Gallery'),
  //                 onTap: () => Navigator.of(context).pop(ImageSource.gallery),
  //               ) // ListTile
  //             ]));
  //   }
  // }
}

extension MySLiverBox on Widget {
  SliverToBoxAdapter get SliverBox => SliverToBoxAdapter(
        child: this,
      );
  SliverToBoxAdapter get SliverPadding => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: this,
        ),
      );
}

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(
        height: toDouble().h,
      );
  SizedBox get pw => SizedBox(
        width: toDouble().w,
      );
}
