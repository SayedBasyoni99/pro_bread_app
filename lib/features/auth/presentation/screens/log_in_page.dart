import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pro_bread_app/core/const/constant_var.dart';
import 'package:pro_bread_app/core/resources/assets.gen.dart';
import 'package:pro_bread_app/features/auth/presentation/screens/create_acc_page.dart';
import 'package:pro_bread_app/shared/custom_txt_bottom.dart';
import 'package:pro_bread_app/shared/text_button.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Assets.images.png.logInBg.image(width: double.infinity, height: 534, fit: BoxFit.fill),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'مرحبا بك في تطبيق ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'assets/images/svg/PBLogo.svg',
                    height: 102.16,
                    width: 194.86,
                  ),
                ),
              ),
              Stack(
                children: [
                  SvgPicture.asset(
                    'assets/images/svg/buttomSheet.svg',
                    fit: BoxFit.fitWidth,
                    width: 1.sw,
                    height: 357,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'نقدم لك خدمات إهداء متميزة وغير تقليدية تساعدك على إرسال هديتك لمن تُحب',
                        style: TextStyle(color: AppConst.kPrimaryTextColor),
                      ),
                      CustomButton(
                        btnColor: AppConst.kScondaryTextColor,
                        btnTitle: 'تسجيل دخول',
                        btntxtColor: AppConst.kPrimaryColor,
                        onTap: () {},
                      ),
                      Gap(10.h),
                      CustomButton(
                          btnTitle: 'إنشاء حساب جديد',
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateAccPage()));
                          }),
                      Gap(10.h),
                      const Text(
                        'أو  ',
                        style: TextStyle(color: AppConst.kPrimaryTextColor, fontWeight: FontWeight.bold),
                      ),
                      Gap(10.h),
                      CustomButton(
                        btnTitle: 'ادخل كزائر',
                        onTap: () {},
                        btnColor: AppConst.kPrimaryColor,
                        borderButtonColor: AppConst.kBorderButtonColor,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
