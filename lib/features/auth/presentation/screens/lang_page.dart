import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'acc_info_page.dart';
import '../../../../shared/custom_app_bar.dart';
import '../../../../shared/text_button.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/utils/utils.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kPrimaryColor,
      appBar: CustomAppBar.build(
        context,
        titleText: 'language'.tr(),
        iconAppBar: SvgPicture.asset(
          'assets/images/svg/cart_icon.svg',
          height: 20,
          width: 20,
        ),
      ),
      // bottomNavigationBar: const CustomNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'اللغة العربية',
                  style: TextStyle(color: AppConst.kPrimaryTextColor),
                ),
                Gap(4.w),
                SvgPicture.asset(
                  'assets/images/svg/choose_icon.svg',
                )
              ],
            ),
            Gap(24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'ُEnglish ',
                  style: TextStyle(color: AppConst.kPrimaryTextColor),
                ),
                Gap(4.w),
                SvgPicture.asset(
                  'assets/images/svg/un select_icon.svg',
                )
              ],
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 32.0.h),
              child: CustomTextButton(
                title: 'save'.tr(),
                fontSize: 18.sp,
                onTap: () {
                  Utils.openScreen(context, const AccountInfoPage());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
