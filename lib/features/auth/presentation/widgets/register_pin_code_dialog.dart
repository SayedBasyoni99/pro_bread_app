import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/const/constant_var.dart';
import '../../../../core/utils/app_snack_bar.dart';
import '../../../../core/utils/utils.dart';
import '../../../../shared/custom_txt_bottom.dart';
import '../../../../shared/pin_code_widget.dart';
import '../controller/check_otp/check_otp_cubit.dart';
import '../controller/register/register_cubit.dart';
import '../screens/new_acc_page.dart';

class RegisterPinCodeDialog extends StatefulWidget {
  const RegisterPinCodeDialog({super.key});

  @override
  State<RegisterPinCodeDialog> createState() => _RegisterPinCodeDialogState();
}

class _RegisterPinCodeDialogState extends State<RegisterPinCodeDialog> {
  final TextEditingController textController = TextEditingController();

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
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppConst.kScondaryTextColor),
                ),
                Gap(16.h),
                const Text(
                  'يرجي إدخال الكود الذي تم إرساله لإنشاء الحساب',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppConst.kThirdTextColor),
                ),
                Gap(32.h),
                PinCodeWidget(
                  controller: textController,
                  pinLength: 4,
                  textSubmit: (value) {
                    onConfirmOtp();
                    // Utils.openScreen(context, const NewAccPage(),
                    //     replacment: true);
                  },
                ),
                const Gap(12),
                const Text('سيتم ارسال الكود خلال 60 ثانية',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppConst.kThirdTextColor)),
                Gap(16.h),
                BlocConsumer<CheckOtpCubit, CheckOtpState>(
                  listener: (context, state) {
                    if (state is CheckOtpSuccessState) {
                      Utils.openScreen(context, const NewAccPage(),
                          replacment: true);
                    }
                    if (state is CheckOtpErrorState) {
                      showAppSnackBar(
                          context: context,
                          message: state.message,
                          type: ToastType.error);
                    }
                  },
                  builder: (context, state) {
                    if (state is CheckOtpLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return CustomButton(
                        btnTitle: 'تأكيد ',
                        onTap: () {
                          onConfirmOtp();
                        });
                  },
                ),
                Gap(12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Utils.openScreen(context, const NewAccPage(),
                            replacment: true);
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
    );
  }

  void onConfirmOtp() {
    context.read<CheckOtpCubit>().fCheckOtp(
          phone: context.read<RegisterCubit>().phone ?? '',
          otp: textController.text.trim(),
        );
    // Utils.openScreen(context, const NewAccPage(), replacment: true);
  }
}
