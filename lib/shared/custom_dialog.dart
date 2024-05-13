import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../core/const/constant_var.dart';
import 'text_widget.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConst.kBorderBoxColor,
      child: Column(
        children: [
          const Gap(16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset('assets/images/svg/desert_icon.svg'),
          ),
          const Gap(16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextWidget(
              title: 'الحلا'.tr(),
              color: AppConst.kPrimaryTextColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
