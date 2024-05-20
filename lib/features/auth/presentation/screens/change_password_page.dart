import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/resources/assets.gen.dart';
import '../../../../shared/change_password_dialog.dart';
import '../../../../shared/show_dialog.dart';
import '../../../../shared/custom_input_field.dart';
import '../../../../shared/text_button.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kPrimaryColor,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
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
                      'تغيير كلمة المرور',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold, color: AppConst.kScondaryTextColor),
                    ),
                    const Gap(24),
                    const Text(
                      'كلمة المرور الجديدة ',
                      style:
                          const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                    ),
                    const Gap(16),
                    CustomInputField(
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'reqired'.tr();
                        }
                        return null;
                      },
                      controller: passwordController,
                      isPassword: true,
                      hint: 'أدخل كلمة المرور الجديدة',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          'assets/images/svg/security lock.svg',
                        ),
                      ),
                    ),
                    const Gap(24),
                    const Text(
                      'تأكيد كلمة المرور الجديدة',
                      style:
                          const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                    ),
                    const Gap(16),
                    CustomInputField(
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'reqired'.tr();
                        }
                        return null;
                      },
                      controller: confirmPasswordController,
                      isPassword: true,
                      hint: 'أدخل كلمة المرور الجديدة',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          'assets/images/svg/security lock.svg',
                        ),
                      ),
                    ),
                    const Gap(12),
                    Gap(40.h),
                    CustomTextButton(
                      onTap: () {
                        if (formKey.currentState?.validate() == true) {
                          showAppDialog(context: context, child: const ChangePasswordDialog());
                        }
                      },
                      title: 'تغيير ',
                      fontSize: 18.sp,
                    ),
                  ],
                ),
              ),
              Gap(10.h),
            ],
          ),
        ),
      ),
    );
  }
}
