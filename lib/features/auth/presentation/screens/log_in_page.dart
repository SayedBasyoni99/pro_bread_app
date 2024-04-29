import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
import 'package:pro_bread_app/core/const/constant_var.dart';
import 'package:pro_bread_app/core/resources/assets.gen.dart';
import 'package:pro_bread_app/core/uitls/utils.dart';
import 'package:pro_bread_app/features/auth/presentation/screens/forget_password.dart';
import 'package:pro_bread_app/features/home/presentation/screens/home_page.dart';
import 'package:pro_bread_app/features/auth/presentation/screens/new_acc_page.dart';
import 'package:pro_bread_app/shared/custom_input_field.dart';
import 'package:pro_bread_app/shared/custom_text_field.dart';
import 'package:pro_bread_app/shared/pin_code_widget.dart';
import 'package:pro_bread_app/shared/text_button.dart';

import '../../../../shared/custom_txt_bottom.dart';
import '../../../../shared/show_dialog.dart';
import '../../../home/presentation/screens/main_page.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  final textController = TextEditingController();

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
                    'تسجيل دخول',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppConst.kScondaryTextColor),
                  ),
                  const Gap(24),
                  const Text(
                    ' البريد الالكتروني',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppConst.kThirdTextColor),
                  ),
                  const Gap(16),
                  CustomInputField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                    hint: 'ادخل بريدك الإلكتروني',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        'assets/images/svg/email.svg',
                      ),
                    ),
                  ),
                  const Gap(24),
                  const Text(
                    'كلمة المرور ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppConst.kThirdTextColor),
                  ),
                  const Gap(16),
                  CustomInputField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                    isPassword: true,
                    hint: 'ادخل كلمة المرور',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        'assets/images/svg/security lock.svg',
                      ),
                    ),
                  ),
                  const Gap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Utils.openScreen(context, const ForgetPasswordPage());
                        },
                        child: const Text('هل نسيت كلمة المرور ؟',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppConst.kButtonColor)),
                      ),
                    ],
                  ),
                  Gap(40.h),
                  const Gap(12),
                  Gap(40.h),
                  CustomTextButton(
                    onTap: () {
                      // Utils.openScreen(context, const MainPage(), replacment: true);
                      showAppDialog(
                        context: context,
                        child: Wrap(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 40.h, horizontal: 32.w),
                              child: Column(
                                children: [
                                  PinCodeWidget(
                                    controller: textController,
                                    pinLength: 4,
                                    textSubmit: (value) {
                                      Utils.openScreen(
                                          context, const NewAccPage());
                                    },
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  CustomButton(
                                      btnTitle: 'تأكيد ',
                                      onTap: () {
                                      
                                        Utils.openScreen(
                                            context, const NewAccPage());
                                      }),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    title: 'تسجيل دخول',
                    fontSize: 18.sp,
                  ),
                ],
              ),
            ),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Utils.openScreen(context, const NewAccPage(),
                        replacment: true);
                  },
                  child: const Text('انشاء حساب جديد',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppConst.kButtonColor)),
                ),
                const Gap(12),
                const Text('ليس لديك حساب ؟',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppConst.kThirdTextColor)),
              ],
            ),
            Gap(20.h),
          ],
        ),
      ),
    );
  }
}
