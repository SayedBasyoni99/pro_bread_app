import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../core/const/constant_var.dart';
import '../core/utils/utils.dart';
import '../features/auth/presentation/screens/change_password_page.dart';
import '../features/auth/presentation/screens/new_acc_page.dart';
import 'custom_txt_bottom.dart';
import 'pin_code_widget.dart';

class CustomPopUp extends StatelessWidget {
  const CustomPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppConst.kScondaryTextColor),
                ),
                Gap(16.h),
                const Text(
                  'يرجي إدخال الكود الذي تم إرساله لإنشاء الحساب',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                ),
                Gap(32.h),
                PinCodeWidget(
                  // controller: textController,
                  pinLength: 4,
                  textSubmit: (value) {
                    Utils.openScreen(context, ChangePasswordPage(), replacment: true);
                  },
                ),
                const Gap(12),
                const Text('سيتم ارسال الكود خلال 60 ثانية',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor)),
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
                        Utils.openScreen(
                          context,
                          const NewAccPage(),
                        );
                      },
                      child: const Text('ارسال مرة أخرى ',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kButtonColor)),
                    ),
                    const Gap(8),
                    const Text('لم يتم ارسال الكود؟ ',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor)),
                  ],
                ),
                Gap(16.h),
              ],
            ),
          )
        ],
      ),
    );
  }
}
