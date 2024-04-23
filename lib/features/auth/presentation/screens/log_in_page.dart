import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pro_bread_app/core/const/constant_var.dart';
import 'package:pro_bread_app/core/resources/assets.gen.dart';
import 'package:pro_bread_app/core/uitls/utils.dart';
import 'package:pro_bread_app/features/auth/presentation/screens/forget_password.dart';
import 'package:pro_bread_app/features/auth/presentation/screens/home_page.dart';
import 'package:pro_bread_app/features/auth/presentation/screens/new_acc_page.dart';
import 'package:pro_bread_app/shared/custom_text_field.dart';
import 'package:pro_bread_app/shared/text_button.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppConst.kScondaryTextColor),
                  ),
                  const Gap(24),
                  const Text(
                    ' البريد الالكتروني',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                  ),
                  const Gap(16),
                  CustomTxtField(
                    hintTxt: 'ادخل بريدك الإلكتروني',
                    iconButton: SizedBox(
                      height: 12.0,
                      width: 16.0,
                      child: SvgPicture.asset(
                        'assets/images/svg/email.svg',
                      ),
                    ),
                  ),
                  const Gap(24),
                  const Text(
                    'كلمة المرور ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                  ),
                  const Gap(16),
                  CustomTxtField(
                    obscureText: true,
                    hintTxt: 'ادخل كلمة المرور',
                    iconButton: SizedBox(
                      height: 12.0,
                      width: 16.0,
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
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => const ForgetPasswordPage()));
                        },
                        child: const Text('هل نسيت كلمة المرور ؟',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kButtonColor)),
                      ),
                    ],
                  ),
                  const Gap(12),
                  Gap(40.h),
                  CustomTextButton(
                    onTap: () {
                      print('SAYEDDDDDDDDDDDDD');
                      Utils.openScreen(context, const HomePage(), replacment: true);
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
                    Utils.openScreen(context, const NewAccPage(), replacment: true);
                  },
                  child: const Text('انشاء حساب جديد',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kButtonColor)),
                ),
                const Gap(12),
                const Text('ليس لديك حساب ؟',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor)),
              ],
            ),
            Gap(20.h),
          ],
        ),
      ),
    );
  }
}
