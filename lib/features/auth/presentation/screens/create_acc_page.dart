import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
import 'package:pro_bread_app/core/const/constant_var.dart';
import 'package:pro_bread_app/core/resources/assets.gen.dart';
import 'package:pro_bread_app/core/uitls/utils.dart';
import 'package:pro_bread_app/features/auth/presentation/screens/log_in_page.dart';
import 'package:pro_bread_app/features/auth/presentation/screens/new_acc_page.dart';
import 'package:pro_bread_app/shared/aleart.dart';
import 'package:pro_bread_app/shared/custom_input_field.dart';
import 'package:pro_bread_app/shared/custom_text_field.dart';
import 'package:pro_bread_app/shared/custom_txt_bottom.dart';
import 'package:pro_bread_app/shared/text_button.dart';

class CreateAccPage extends StatelessWidget {
  CreateAccPage({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kPrimaryColor,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
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
                      'إنشاء حساب جديد',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppConst.kScondaryTextColor),
                    ),
                    const Gap(32),
                    const Text(
                      'رقم الجوال',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                    ),
                    const Gap(16),
                    // CustomTxtField(
                    //   textInputType: TextInputType.number,
                    //   hintTxt: 'ادخل رقم الجوال',
                    //   iconButton: SizedBox(
                    //     height: 12.0,
                    //     width: 16.0,
                    //     child: SvgPicture.asset(
                    //       'assets/images/svg/phone_icon.svg',
                    //     ),
                    //   ),
                    // ),
                    Gap(40.h),
                    CustomInputField(
                      hint: 'ادخل رقم الجوال',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          'assets/images/svg/phone_icon.svg',
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'هذا الحقل مطلوب';
                        }
                        return null;
                      },
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          Alerts.dialog(
                            context,
                            // insetPadding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 32.w),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 32.w),
                              child: Column(
                                children: [
                                  Container(
                                    color: AppConst.kPrimaryColor,
                                    child: const Pinput(
                                      autofocus: true,
                                      length: 4,
                                      animationCurve: Curves.easeIn,
                                      // animationDuration: Duration(milliseconds: 300),
                                    ),
                                  ),
                                  CustomButton(
                                      btnTitle: 'تأكيد ',
                                      onTap: () {
                                        Utils.openScreen(context, const NewAccPage());
                                      }),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    const Gap(40),
                    CustomTextButton(
                        onTap: () {
                          Utils.openScreen(context, const NewAccPage());
                        },
                        title: 'التالي',
                        fontSize: 18.sp),
                  ],
                ),
              ),
              Gap(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  LogInPage()));
                    },
                    child: const Text('تسجيل الدخول',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kButtonColor)),
                  ),
                  const Gap(12),
                  const Text('هل لديك حساب بالفعل ؟ ',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
