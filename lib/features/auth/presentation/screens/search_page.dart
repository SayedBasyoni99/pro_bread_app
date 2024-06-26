import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../shared/custom_app_bar.dart';
import '../../../../shared/custom_text_field.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConst.kPrimaryColor,
        appBar: CustomAppBar.build(
          context,
          titleText: 'search'.tr(),
          iconAppBar: SvgPicture.asset('assets/images/svg/cart_icon.svg'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
              child: Column(
                children: [
                  CustomTxtField(
                    borderColor: AppConst.kBorderBoxColor,
                    // filled: true,
                    // fillColor: AppConst.kPrimaryColor,
                    hintTxt: 'what_are_you_looking_for'.tr(),
                    iconButton02: Padding(
                      padding: EdgeInsets.all(18.h),
                      child: SvgPicture.asset(
                        'assets/images/svg/search_icon.svg',
                      ),
                    ),
                  ),
                  Gap(60.h),
                  SvgPicture.asset('assets/images/svg/notFoundProducts_icon.svg'),
                  Gap(16.h),
                  Text(
                    'no_search_results'.tr(),
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppConst.kPrimaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
