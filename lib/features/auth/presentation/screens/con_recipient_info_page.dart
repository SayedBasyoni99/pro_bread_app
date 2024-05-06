import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:pro_bread_app/features/home/presentation/screens/home_page.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/utils/utils.dart';
import '../../../../shared/custom_app_bar.dart';
import '../../../../shared/custom_input_field.dart';
import '../../../../shared/custom_stepper_widget.dart';
import '../../../../shared/text_button.dart';

class ConRecipientInfoPage extends StatelessWidget {
  const ConRecipientInfoPage({super.key});

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
                  'عنوان المرسل اليه',
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
              Gap(60.h),
              CustomTextButton(
                icon: Icons.arrow_forward,
                onTap: () {
                  Utils.openScreen(context, const HomePage(), replacment: true);
                },
                title: 'التالي',
                fontSize: 18.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
