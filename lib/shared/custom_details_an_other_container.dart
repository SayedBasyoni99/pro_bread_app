import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../core/const/constant_var.dart';
import 'text_widget.dart';

class CustomDetailsAnOtherContainer extends StatefulWidget {
  const CustomDetailsAnOtherContainer({super.key, this.message01, this.message02, this.message03, this.message04});

  final String? message01, message02, message03, message04;

  @override
  State<CustomDetailsAnOtherContainer> createState() => _CustomDetailsAnOtherContainerState();
}

class _CustomDetailsAnOtherContainerState extends State<CustomDetailsAnOtherContainer> {
  bool isSelected = false;
  void toggleSelected() {
    setState(() {
      isSelected = !isSelected;
    });
  }

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.message01 != null)
                      TextWidget(
                        title: widget.message01,
                        color: AppConst.kBorderButtonColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    if (widget.message01 != null) Gap(16.h),
                    TextWidget(
                      title: widget.message02,
                      color: AppConst.kPrimaryTextColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    Gap(12.h),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    toggleSelected();
                  });
                },
                child: SvgPicture.asset(
                  isSelected ? 'assets/images/svg/select_icon.svg' : 'assets/images/svg/un select_icon.svg',
                ),
              ),
              // Expanded(
            ],
          ),
          Gap(12.h),
          TextWidget(
            title: widget.message03,
            color: AppConst.kThirdTextColor,
            fontSize: 14.sp,
            // fontWeight: FontWeight.bold,
          ),
          Gap(12.h),
          TextWidget(
            title: widget.message04,
            color: AppConst.kThirdTextColor,
            fontSize: 14.sp,
            // fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
