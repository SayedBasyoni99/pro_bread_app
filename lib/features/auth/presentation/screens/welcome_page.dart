import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/resources/assets.gen.dart';
import '../../../home/presentation/screens/home_page.dart';
import 'create_acc_page.dart';
import 'log_in_page.dart';
import '../../../../shared/custom_txt_bottom.dart';

import '../../../../core/utils/utils.dart';
import 'my_acc_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Assets.images.png.logInBg.image(width: double.infinity, height: 510.h, fit: BoxFit.fill),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 32.h),
                child: Text(
                  'مرحبا بك في تطبيق '.tr(),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
                ),
              ),
              Align(
                heightFactor: 2.8,
                alignment: Alignment.topCenter,
                child: SvgPicture.asset(
                  'assets/images/svg/PBLogo.svg',
                  height: 102.16.h,
                  width: 194.86.w,
                ),
              ),
              Stack(
                children: [
                  Container(
                      height: 370.h,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        color: AppConst.kPrimaryColor,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(80.r), topRight: Radius.circular(80.r)),
                      )),
                  // SvgPicture.asset(
                  //   'assets/images/svg/buttomSheet.svg',
                  //   fit: BoxFit.fitWidth,
                  //   width: 1.sw,
                  //   height: 357,
                  // ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                        child: Text(
                          'نقدم لك خدمات إهداء متميزة وغير تقليدية تساعدك   على إرسال هديتك لمن تُحب'.tr(),
                          style: const TextStyle(color: AppConst.kScondaryTextColor, fontWeight: FontWeight.bold),
                        ),
                      ),
                      CustomButton(
                        btnColor: AppConst.kScondaryTextColor,
                        btnTitle: 'تسجيل دخول'.tr(),
                        btntxtColor: AppConst.kPrimaryColor,
                        onTap: () {
                          Utils.openScreen(context, LogInPage());
                        },
                      ),
                      Gap(10.h),
                      CustomButton(
                          btnTitle: 'إنشاء حساب جديد'.tr(),
                          onTap: () {
                            Utils.openScreen(context, CreateAccPage());
                          }),
                      Gap(10.h),
                      const Text(
                        'أو  ',
                        style: TextStyle(color: AppConst.kPrimaryTextColor, fontWeight: FontWeight.bold),
                      ),
                      Gap(10.h),
                      CustomButton(
                        btnTitle: 'ادخل كزائر'.tr(),
                        onTap: () {
                          Utils.openScreen(
                            context,
                            const HomePage(),
                          );
                        },
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
