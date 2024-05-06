import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/utils/utils.dart';
import '../../../../shared/custom_input_field.dart';
import '../../../../shared/text_button.dart';
import '../../../home/presentation/screens/home_page.dart';

class AccountInfoPage extends StatelessWidget {
  const AccountInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar.build(
      //   context,
      //   titleText: 'معلومات  الحساب',
      //   iconAppBar: SvgPicture.asset(
      //     'assets/images/svg/cart_icon.svg',
      //     height: 20,
      //     width: 20,
      //   ),
      // ),
      // backgroundColor: AppConst.kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Gap(60.h),
                  const Text(
                    'الاسم ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
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
                    ' البريد الالكتروني',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                  ),
                  const Gap(16),
                  CustomInputField(
                    hint: 'elsayed.gaber@example.com',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        'assets/images/svg/email.svg',
                      ),
                    ),
                  ),
                  const Gap(32),
                  const Text(
                    'رقم الجوال',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
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
                  Gap(80.h),
                  CustomTextButton(
                    onTap: () {
                      Utils.openScreen(context, const HomePage(), replacment: true);
                    },
                    title: '  حفظ التعديلات',
                    fontSize: 18.sp,
                  ),
                ],
              ),
            ),
            Gap(20.h),
          ],
        ),
      ),
    );
  }
}
