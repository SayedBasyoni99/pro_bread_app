import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
import 'package:pro_bread_app/core/const/constant_var.dart';
import 'package:pro_bread_app/core/resources/assets.gen.dart';
import 'package:pro_bread_app/features/auth/presentation/screens/change_password_page.dart';
import 'package:pro_bread_app/shared/aleart.dart';
import 'package:pro_bread_app/shared/custom_text_field.dart';
import 'package:pro_bread_app/shared/custom_txt_bottom.dart';
import 'package:pro_bread_app/shared/text_button.dart';

import '../../../../shared/custom_input_field.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Assets.images.png.primaryBg.image(fit: BoxFit.fill),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Gap(25.h),
                  const Text(
                    'هل نسيت كلمة المرور',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppConst.kScondaryTextColor),
                  ),
                  Gap(25.h),
                  const Text(
                    'يرجي إدخال رقم الجوال الخاص بك ليتم إرسال الكود',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppConst.kThirdTextColor),
                  ),
                  const Gap(32),
                  const Text(
                    'رقم الجوال',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppConst.kThirdTextColor),
                  ),
                  const Gap(16),
                  CustomInputField(
                    keyboardType: TextInputType.number,
                    hint: 'ادخل رقم الجوال',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        'assets/images/svg/phone_icon.svg',
                      ),
                    ),
                  ),
                  Gap(90.h),
                  CustomTextButton(
                    onTap: () {
                      Alerts.dialog(
                        context,
                        // insetPadding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 32.w),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 40.h, horizontal: 32.w),
                          child: Column(
                            children: [
                              Container(
                                color: AppConst.kPrimaryColor,
                                child: const Pinput(
                                  autofocus: true,
                                  length: 4,
                                  animationCurve: Curves.easeIn,
                                  // animationDuration: Duration(milliseconds: 300),
                                ),
                              ),
                              CustomButton(
                                  btnTitle: 'تأكيد ',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ChangePasswordPage()));
                                  }),
                            ],
                          ),
                        ),
                      );
                    },
                    title: 'ارسل ',
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
