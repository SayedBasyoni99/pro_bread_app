import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pro_bread_app/core/const/constant_var.dart';
import 'package:pro_bread_app/shared/custom_input_field.dart';
import 'package:pro_bread_app/shared/text_button.dart';

import '../../../../shared/custom_app_bar.dart';

class ChangePassword02Page extends StatelessWidget {
  const ChangePassword02Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.build(
        context,
        titleText: 'تغيير كلمة المرور',
        iconAppBar: SvgPicture.asset(
          'assets/images/svg/cart_icon.svg',
          height: 20,
          width: 20,
        ),
      ),
      backgroundColor: AppConst.kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Gap(80.h),
                  const Text(
                    'كلمة المرور الجديدة ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                  ),
                  const Gap(16),
                  CustomInputField(
                    isPassword: true,
                    hint: 'أدخل كلمة المرور الجديدة',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        'assets/images/svg/security lock.svg',
                      ),
                    ),
                  ),
                  const Gap(24),
                  const Text(
                    'تأكيد كلمة المرور الجديدة',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                  ),
                  const Gap(16),
                  CustomInputField(
                    isPassword: true,
                    hint: 'أدخل كلمة المرور الجديدة',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        'assets/images/svg/security lock.svg',
                      ),
                    ),
                  ),
                  Gap(200.h),
                  CustomTextButton(
                    onTap: () {},
                    title: 'ارسال',
                    fontSize: 18.sp,
                  ),
                ],
              ),
            ),
            Gap(10.h),
          ],
        ),
      ),
    );
  }
}
