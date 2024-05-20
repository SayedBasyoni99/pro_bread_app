import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/resources/assets.gen.dart';
import '../../../home/presentation/screens/main_page.dart';
import 'create_acc_page.dart';
import 'log_in_page.dart';
import '../../../../shared/custom_txt_bottom.dart';
import '../../../../core/utils/utils.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Assets.images.png.logInBg.image(width: double.infinity, height: 510.h, fit: BoxFit.fill),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 32.h),
                child: Text(
                  'welcome_message'.tr(),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
                ),
              ),
              Align(
                heightFactor: 2.55,
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
                          'gift_services_description'.tr(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: AppConst.kScondaryTextColor, fontWeight: FontWeight.bold),
                        ),
                      ),
                      CustomButton(
                        btnColor: AppConst.kScondaryTextColor,
                        btnTitle: 'login'.tr(),
                        btntxtColor: AppConst.kPrimaryColor,
                        onTap: () {
                          Utils.openScreen(context, LogInPage());
                        },
                      ),
                      Gap(10.h),
                      CustomButton(
                          btnTitle: ' ${'create_new_account'.tr()} ',
                          onTap: () {
                            Utils.openScreen(context, CreateAccPage());
                          }),
                      Gap(10.h),
                      Text(
                        'or'.tr(),
                        style: const TextStyle(color: AppConst.kPrimaryTextColor, fontWeight: FontWeight.bold),
                      ),
                      Gap(10.h),
                      CustomButton(
                        btnTitle: 'enter_as_a_guest'.tr(),
                        onTap: () {
                          Utils.openScreen(
                            context,
                            const MainPage(),
                          );
                        },
                        btnColor: AppConst.kPrimaryColor,
                        borderButtonColor: AppConst.kBorderButtonColor,
                      ),
                      Gap(16.h),
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
