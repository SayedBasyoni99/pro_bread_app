import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../core/const/constant_var.dart';
import '../core/utils/utils.dart';
import '../features/auth/presentation/screens/log_in_page.dart';
import 'custom_txt_bottom.dart';

class ChangePasswordDialog extends StatelessWidget {
  const ChangePasswordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppConst.kPrimaryColor,
      ),
      child: Wrap(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 32.w),
            child: Column(
              children: [
                SvgPicture.asset('assets/images/svg/lock_icon.svg'),
                Gap(16.h),
                const Text(
                  'تم تغيير كلمة المرور بنجاح',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppConst.kScondaryTextColor),
                ),
                Gap(32.h),
                CustomButton(
                    btnTitle: 'تسجيل الدخول',
                    onTap: () {
                      Utils.openScreen(context, LogInPage(), replacment: true);
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
