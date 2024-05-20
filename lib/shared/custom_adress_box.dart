import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../core/const/constant_var.dart';

class CustomAdressBox extends StatelessWidget {
  const CustomAdressBox({super.key, required this.picInfo, required this.boxTitle});
  final String picInfo, boxTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Container(
        height: 100.h,
        width: 150.w,
        decoration: BoxDecoration(
          color: AppConst.kPrimaryColor,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: const [
            BoxShadow(
              color: AppConst.kBottomBarColor,
              spreadRadius: .01,
              blurRadius: 15,
              offset: Offset(0, .1),

              // changes position of shadow
            ),
            BoxShadow(color: AppConst.kPrimaryColor, spreadRadius: 4.5, blurRadius: 10)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/svg/$picInfo.svg'),
            Gap(16.h),
            Text(
              boxTitle,
              style:  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
