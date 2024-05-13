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
import '../../../../shared/custom_stepper_widget.dart';

class AddLocationPage extends StatelessWidget {
  const AddLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.build(
        context,
        titleText: 'تابع إتمام الطلب',
        // removeBack: false,
      ),
      backgroundColor: AppConst.kPrimaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Row(children: [
                CustomStepper(),
                CustomStepper(),
                CustomStepper(),
                CustomStepper(),
              ]),
              Gap(32.h),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                const Text(
                  'تفاصيل الشحن',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
                ),
                Gap(8.w),
                SvgPicture.asset('assets/images/svg/map_icon.svg'),
              ]),
              Gap(32.h),
              const Text(
                'المنطقة ',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
              ),
              Gap(4.h),
              const CustomInputField(
                hint: 'المنصورة',
              ),
              Gap(32.h),
              const Text(
                'الشارع',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
              ),
              Gap(4.h),
              const CustomInputField(
                hint: 'الجمهورية',
              ),
              Gap(32.h),
              const Text(
                'اسم أو رقم البناية',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
              ),
              Gap(4.h),
              const CustomInputField(
                hint: '20',
              ),
              Gap(32.h),
              const Text(
                'علامة مميزة',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
              ),
              Gap(4.h),
              const CustomInputField(
                hint: 'امام مستشفي الجامعة ',
              ),
              Gap(32.h),
              const Text(
                'رقم الجوال',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
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
                    context, const RecipientInfoPage(),
                    // replacment: true
                  );
                },
                title: '  حفظ ',
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
