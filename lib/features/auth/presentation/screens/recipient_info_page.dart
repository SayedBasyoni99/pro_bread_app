import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:pro_bread_app/features/auth/presentation/screens/con_recipient_info_page.dart';
import 'package:pro_bread_app/shared/custom_stepper_widget.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/utils/utils.dart';
import '../../../../shared/custom_app_bar.dart';
import '../../../../shared/custom_input_field.dart';
import '../../../../shared/text_button.dart';

class RecipientInfoPage extends StatelessWidget {
  const RecipientInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.build(
        context,
        titleText: ' تابع إتمام الطلب',
        iconAppBar: SvgPicture.asset(
          'assets/images/svg/cart_icon.svg',
          height: 20,
          width: 20,
        ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'معلومات المرسل اليه',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
                  ),
                  const Gap(16),
                  SvgPicture.asset('assets/images/svg/gift_icon.svg'),
                ],
              ),
              Gap(32.h),
              const Text(
                'اسم المرسل اليه',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
              ),
              const Gap(16),
              CustomInputField(
                hint: 'السيد جابر',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    'assets/images/svg/person.svg',
                  ),
                ),
              ),
              const Gap(32),
              const Text(
                'رقم الجوال',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
              ),
              const Gap(16),
              CustomInputField(
                keyboardType: TextInputType.phone,
                hint: 'ادخل رقم الجوال',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    'assets/images/svg/phone_icon.svg',
                  ),
                ),
              ),
              const Gap(32),
              const Text(
                ' ارسل ملاحظة',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
              ),
              const Gap(16),
              CustomInputField(
                hint: ' اكتب الملاحظة',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    'assets/images/svg/note_icon.svg',
                  ),
                ),
              ),
              Gap(80.h),
              CustomTextButton(
                icon: Icons.arrow_forward,
                onTap: () {
                  Utils.openScreen(
                    context, const ConRecipientInfoPage(),
                    // replacment: true
                  );
                },
                title: 'التالي',
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
