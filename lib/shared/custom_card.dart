import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'text_widget.dart';

import '../core/const/constant_var.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    this.color = AppConst.kPrimaryColor,
  });

  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: color,
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: .06.sh,
            width: 24.w,
            child: SvgPicture.asset('assets/images/svg/cold_drinks_icon.svg'),
          ),
          const Spacer(),
          TextWidget(
            title: 'اسم المنتج ',
            color: AppConst.kScondaryTextColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
