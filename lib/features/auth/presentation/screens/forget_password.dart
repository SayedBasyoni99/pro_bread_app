import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/resources/assets.gen.dart';
import '../../../../shared/custom_popUp.dart';
import '../../../../shared/text_button.dart';
import '../../../../shared/custom_input_field.dart';
import '../../../../shared/show_dialog.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController phoneController = TextEditingController();

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
                    Text(
                      'forgot_password'.tr(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold, color: AppConst.kScondaryTextColor),
                    ),
                    Gap(25.h),
                    Text(
                      'enter_your_mobile_number'.tr(),
                      style:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                    ),
                    const Gap(32),
                    Text(
                      'mobile_number'.tr(),
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
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      hint: 'enter_mobile_number'.tr(),
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
                        if (formKey.currentState?.validate() == true) {
                          showAppDialog(context: context, child: const CustomPopUp());
                        }
                      },
                      title: 'send'.tr(),
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
