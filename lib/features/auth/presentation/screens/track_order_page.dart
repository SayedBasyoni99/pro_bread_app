import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/const/constant_var.dart';
import '../../../../shared/custom_app_bar.dart';
import '../../../../shared/text_widget.dart';

class TrackOrderPage extends StatelessWidget {
  const TrackOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.build(
        context,
        titleText: 'تتبع الطلب',
      ),
      backgroundColor: AppConst.kPrimaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: AppConst.kPrimaryColor,
              ),
              height: 200.h,
              width: double.infinity,
              child: Text(
                'تتبع الطلب',
                style: TextStyle(
                    color: AppConst.kThirdTextColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Gap(16.h),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: AppConst.kPrimaryColor,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextWidget(
                        title: 'ملخص الدفع',
                        color: AppConst.kScondaryTextColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  Gap(16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        title: '220 ر.س',
                        color: AppConst.kPrimaryTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      Gap(16.h),
                      TextWidget(
                        title: 'مجموع الطلب',
                        color: AppConst.kThirdTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  Gap(16.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        title: ' 220 ر.س',
                        color: AppConst.kPrimaryTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      Gap(16.h),
                      TextWidget(
                        title: 'رسوم التوصيل ',
                        color: AppConst.kThirdTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  Gap(16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        title: '220 ر.س',
                        color: AppConst.kPrimaryTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      Gap(16.h),
                      TextWidget(
                        title: ' كود الخصم',
                        color: AppConst.kThirdTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  Gap(16.h),
                  Divider(
                    color: AppConst.kBorderBoxColor,
                    thickness: 1.h,
                    height: 1.h,
                  ),
                  Gap(16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        title: '220 ر.س',
                        color: AppConst.kScondaryTextColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      Gap(16.h),
                      TextWidget(
                        title: 'المجموع',
                        color: AppConst.kThirdTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Gap(24.h),
          ],
        ),
      ),
    );
  }
}
