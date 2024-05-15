import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../core/const/constant_var.dart';
import 'text_widget.dart';

class CustomDetailsContainer extends StatelessWidget {
  const CustomDetailsContainer(
      {super.key, required this.picInfo, this.message01, this.message02, this.message03, this.message04});

  final String picInfo;
  final String? message01, message02, message03, message04;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: AppConst.kPrimaryColor,
        boxShadow: const [
          BoxShadow(
            color: AppConst.kBottomBarColor,
            spreadRadius: .2,
            blurRadius: 12,
            offset: Offset(0, .1),
            // changes position of shadow
          ),
          BoxShadow(color: AppConst.kPrimaryColor, spreadRadius: 4.0)
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SvgPicture.asset('assets/images/svg/$picInfo.svg'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (message01 != null)
                    TextWidget(
                      title: message01,
                      color: AppConst.kBorderButtonColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  if (message01 != null) Gap(16.h),
                  TextWidget(
                    title: message02,
                    color: AppConst.kPrimaryTextColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  Gap(12.h),
                ],
              ),
            ],
          ),
          Gap(12.h),
          TextWidget(
            title: message03,
            color: AppConst.kThirdTextColor,
            fontSize: 14.sp,
            // fontWeight: FontWeight.bold,
          ),
          Gap(12.h),
          TextWidget(
            title: message04,
            color: AppConst.kThirdTextColor,
            fontSize: 14.sp,
            // fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}