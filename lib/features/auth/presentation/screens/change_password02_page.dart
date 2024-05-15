import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/const/constant_var.dart';
import 'log_in_page.dart';
import '../../../../shared/custom_input_field.dart';
import '../../../../shared/text_button.dart';

import '../../../../core/utils/utils.dart';
import '../../../../shared/custom_app_bar.dart';
import '../../../../shared/custom_txt_bottom.dart';
import '../../../../shared/show_dialog.dart';

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
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppConst.kThirdTextColor),
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
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppConst.kThirdTextColor),
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
                    onTap: () {
                      showAppDialog(
                        context: context,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: AppConst.kPrimaryColor,
                          ),
                          child: Wrap(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 40.h, horizontal: 32.w),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/images/svg/lock_icon.svg'),
                                    Gap(16.h),
                                    const Text(
                                      'تم تغيير كلمة المرور بنجاح',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppConst.kScondaryTextColor),
                                    ),
                                    Gap(32.h),
                                    CustomButton(
                                        btnTitle: 'تسجيل الدخول',
                                        onTap: () {
                                          Utils.openScreen(context, LogInPage(),
                                              replacment: true);
                                        }),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    title: 'تغيير  ',
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
