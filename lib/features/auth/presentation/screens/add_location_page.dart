import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'recipient_info_page.dart';
import '../../../../../core/const/constant_var.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../shared/custom_input_field.dart';
import '../../../../../shared/text_button.dart';
import '../../../../shared/custom_app_bar.dart';

class AddLocationPage extends StatelessWidget {
  const AddLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.build(
        context,
        titleText: 'proceed_to_checkout'.tr(),
        // removeBack: false,
      ),
      backgroundColor: AppConst.kPrimaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  'shipping_details'.tr(),
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
                ),
                Gap(8.w),
                SvgPicture.asset('assets/images/svg/map_icon.svg'),
              ]),
              Gap(32.h),
              Text(
                'area'.tr(),
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
              ),
              Gap(4.h),
              CustomInputField(
                hint: 'mansoura'.tr(),
              ),
              Gap(32.h),
              Text(
                'street'.tr(),
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
              ),
              Gap(4.h),
              CustomInputField(
                hint: 'jahan_street'.tr(),
              ),
              Gap(32.h),
              Text(
                'building_name_or_number'.tr(),
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
              ),
              Gap(4.h),
              const CustomInputField(
                hint: '20',
              ),
              Gap(32.h),
              Text(
                'landmark'.tr(),
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
              ),
              Gap(4.h),
              CustomInputField(
                hint: 'mansoura'.tr(),
              ),
              Gap(32.h),
              Text(
                'phone_number'.tr(),
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
              ),
              Gap(4.h),
              const CustomInputField(
                keyboardType: TextInputType.phone,
                hint: '+201234567890',
              ),
              Gap(80.h),
              CustomTextButton(
                onTap: () {
                  Utils.openScreen(
                    context,  RecipientInfoPage(),
                    // replacment: true
                  );
                },
                title: 'save'.tr(),
                fontSize: 18.sp,
              ),
              Gap(20.h),
            ],
          ),
        ),
      ),
    );
  }
}
