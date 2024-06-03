import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../core/const/constant_var.dart';
import 'text_widget.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: AppConst.kPrimaryColor,
        boxShadow: const [
          BoxShadow(
            color: AppConst.kBottomBarColor,
            spreadRadius: .2,
            blurRadius: 8,
            offset: Offset(0, .1),
            // changes position of shadow
          ),
          BoxShadow(color: AppConst.kPrimaryColor, spreadRadius: 4.0)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                title: '${'order_number'.tr()} 1234',
                color: AppConst.kScondaryTextColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: TextWidget(
                      title: 'order_details'.tr(),
                      color: AppConst.kThirdTextColor,
                      fontSize: 12.sp,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: AppConst.kThirdTextColor,
                    size: 12.sp,
                  ),
                ],
              ),
            ],
          ),
          Gap(8.w),
          TextWidget(
            title: '${'order_date'.tr()} :  22/10/2022',
            color: AppConst.kThirdTextColor,
            fontSize: 12.sp,
            // fontWeight: FontWeight.bold,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 16.0),
                child: SizedBox(
                  height: 50.h,
                  width: 50.w,
                  child: Image.asset('assets/images/png/cake00.png'),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    title: 'كيكة ليمون بلوبيري ',
                    color: AppConst.kPrimaryTextColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  Gap(4.w),
                  TextWidget(
                    title: 'order_received'.tr(),
                    color: const Color(0xff43CA8A),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
