import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../core/const/constant_var.dart';
import 'text_widget.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: SvgPicture.asset(
                          'assets/images/svg/backArrow_icon.svg'),
                    ),
                    TextWidget(
                      title: 'تفاصيل الطلب',
                      color: AppConst.kThirdTextColor,
                      fontSize: 12.sp,
                      // fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              TextWidget(
                title: 'طلب رقم12345',
                color: AppConst.kScondaryTextColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          Gap(8.w),
          TextWidget(
            title: ' تاريخ الطلب : 22/10/2022',
            color: AppConst.kThirdTextColor,
            fontSize: 12.sp,
            // fontWeight: FontWeight.bold,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextWidget(
                    title: 'كيكة ليمون بلوبيري ',
                    color: AppConst.kPrimaryTextColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  Gap(4.w),
                  TextWidget(
                    title: 'تم الاستلام',
                    color: const Color(0xff43CA8A),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 16.0),
                child: SizedBox(
                  height: 50.h,
                  width: 50.w,
                  child: Image.asset('assets/images/png/cake00.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    
  }
}
