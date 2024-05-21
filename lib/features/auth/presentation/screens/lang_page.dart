import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../home/presentation/controllers/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import '../../../language/presentation/cubit/locale_cubit/locale_cubit.dart';
import '../../../../shared/custom_app_bar.dart';
import '../../../../shared/text_button.dart';
import '../../../../core/const/constant_var.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String? currentLang;

  @override
  void initState() {
    super.initState();
    currentLang = context.read<LocaleCubit>().currentLangCode;
  }

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
            GestureDetector(
              onTap: () {
                setState(() {
                  currentLang = 'ar';
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'اللغة العربية',
                    style: TextStyle(color: AppConst.kPrimaryTextColor),
                  ),
                  Gap(8.w),
                  SvgPicture.asset(
                    currentLang == 'ar'
                        ? 'assets/images/svg/choose_icon.svg'
                        : 'assets/images/svg/un select_icon.svg',
                  ),
                ],
              ),
            ),
            Gap(24.h),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentLang = 'en';
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'English',
                    style: TextStyle(color: AppConst.kPrimaryTextColor),
                  ),
                  Gap(8.w),
                  SvgPicture.asset(
                    currentLang == 'en'
                        ? 'assets/images/svg/choose_icon.svg'
                        : 'assets/images/svg/un select_icon.svg',
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 32.0.h),
              child: CustomTextButton(
                title: 'save'.tr(),
                fontSize: 18.sp,
                onTap: () {
                  context.read<LocaleCubit>().changeLanguage(
                        context: context,
                        langCode: currentLang?? 'ar',
                      );
                  context.read<BottomNavBarCubit>().changeCurrentScreen(index: 0);
                  Navigator.pushNamedAndRemoveUntil(context, Routes.initialRoute, (route) => false);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
