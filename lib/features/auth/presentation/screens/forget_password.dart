import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pro_bread_app/core/const/constant_var.dart';
import 'package:pro_bread_app/core/resources/assets.gen.dart';
import 'package:pro_bread_app/features/auth/presentation/screens/change_password_page.dart';
import 'package:pro_bread_app/features/auth/presentation/screens/new_acc_page.dart';
import 'package:pro_bread_app/shared/custom_txt_bottom.dart';
import 'package:pro_bread_app/shared/text_button.dart';
import '../../../../core/uitls/utils.dart';
import '../../../../shared/custom_input_field.dart';
import '../../../../shared/pin_code_widget.dart';
import '../../../../shared/show_dialog.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Assets.images.png.primaryBg.image(fit: BoxFit.fill),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Gap(25.h),
                  const Text(
                    'هل نسيت كلمة المرور',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppConst.kScondaryTextColor),
                  ),
                  Gap(25.h),
                  const Text(
                    'يرجي إدخال رقم الجوال الخاص بك ليتم إرسال الكود',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                  ),
                  const Gap(32),
                  const Text(
                    'رقم الجوال',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                  ),
                  const Gap(16),
                  CustomInputField(
                    keyboardType: TextInputType.number,
                    hint: 'ادخل رقم الجوال',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        'assets/images/svg/phone_icon.svg',
                      ),
                    ),
                  ),
                  Gap(90.h),
                  CustomTextButton(
                    onTap: () {
                      showAppDialog(
                        context: context,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: AppConst.kPrimaryColor,
                          ),
                          child: Wrap(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 32.w),
                                child: Column(
                                  children: [
                                    const Text(
                                      'الرجاء اخال الكود',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppConst.kScondaryTextColor),
                                    ),
                                    Gap(16.h),
                                    const Text(
                                      'يرجي إدخال الكود الذي تم إرساله لإنشاء الحساب',
                                      style: TextStyle(
                                          fontSize: 12, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                                    ),
                                    Gap(32.h),
                                    PinCodeWidget(
                                      // controller: textController,
                                      pinLength: 4,
                                      textSubmit: (value) {
                                        Utils.openScreen(context, const ChangePasswordPage(), replacment: true);
                                      },
                                    ),
                                    const Gap(12),
                                    const Text('سيتم ارسال الكود خلال 60 ثانية',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: AppConst.kThirdTextColor)),
                                    Gap(16.h),
                                    CustomButton(
                                        btnTitle: 'تأكيد ',
                                        onTap: () {
                                          // Utils.openScreen(context, const ChangePasswordPage(), replacment: true);
                                        }),
                                    Gap(12.h),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Utils.openScreen(context, const NewAccPage(), replacment: true);
                                          },
                                          child: const Text('ارسال مرة أخرى ',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppConst.kButtonColor)),
                                        ),
                                        const Gap(8),
                                        const Text('لم يتم ارسال الكود؟ ',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: AppConst.kThirdTextColor)),
                                      ],
                                    ),
                                    Gap(16.h),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    title: 'ارسل ',
                    fontSize: 18.sp,
                  ),
                ],
              ),
            ),
            Gap(10.h),
          ],
        ),
      ),
    );
  }
}
