import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pro_bread_app/core/const/constant_var.dart';
import 'package:pro_bread_app/core/resources/assets.gen.dart';
import 'package:pro_bread_app/features/auth/presentation/screens/log_in_page.dart';
import 'package:pro_bread_app/shared/custom_text_field.dart';
import 'package:pro_bread_app/shared/text_button.dart';

class NewAccPage extends StatelessWidget {
  const NewAccPage({super.key});

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
                    'إنشاء حساب جديد',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppConst.kScondaryTextColor),
                  ),
                  const Gap(32),
                  const Text(
                    'الاسم ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                  ),
                  const Gap(16),
                  CustomTxtField(
                    hintTxt: 'ادخل اسم الحساب',
                    iconButton: SizedBox(
                      height: 12.0,
                      width: 16.0,
                      child: SvgPicture.asset(
                        'assets/images/svg/person.svg',
                      ),
                    ),
                  ),
                  const Gap(32),
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
                  const Gap(32),
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
                  Gap(40.h),
                  CustomTextButton(
                    onTap: () {},
                    title: '  انشاء حساب جديد',
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LogInPage()));
                  },
                  child: const Text('تسجيل الدخول',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kButtonColor)),
                ),
                const Gap(12),
                const Text('هل لديك حساب بالفعل ؟ ',
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
