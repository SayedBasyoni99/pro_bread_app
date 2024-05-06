import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pro_bread_app/core/const/constant_var.dart';
import 'package:pro_bread_app/core/resources/assets.gen.dart';
import 'package:pro_bread_app/core/utils/utils.dart';
import 'package:pro_bread_app/features/auth/presentation/screens/change_password02_page.dart';
import 'package:pro_bread_app/shared/custom_input_field.dart';
import 'package:pro_bread_app/shared/text_button.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

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
                    'تغيير كلمة المرور',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppConst.kScondaryTextColor),
                  ),
                  const Gap(24),
                  const Text(
                    'كلمة المرور الجديدة ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                  ),
                  const Gap(16),
                  CustomInputField(
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
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                  ),
                  const Gap(16),
                  CustomInputField(
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
                      Utils.openScreen(context, const ChangePassword02Page(), replacment: true);
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
    );
  }
}
