// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/const/constant_var.dart';
import '../../../../core/resources/assets.gen.dart';
import '../../../../shared/custom_app_bar.dart';
import '../../../../shared/custom_input_field.dart';
import '../../../../shared/custom_stepper_widget.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({super.key});
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final cardNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.build(
        context,
        titleText: 'تابع إتمام الطلب',
        iconAppBar: SvgPicture.asset(
          'assets/images/svg/cart_icon.svg',
          height: 20,
          width: 20,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 32.h, bottom: 32.h),
            child: Column(
              children: [
                const Row(
                  children: [
                    CustomStepper(),
                    CustomStepper(stepperColor: AppConst.kSecondaryStepperColor),
                    CustomStepper(stepperColor: AppConst.kSecondaryStepperColor),
                    CustomStepper(stepperColor: AppConst.kSecondaryStepperColor),
                  ],
                ),
                Gap(32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'معلومات الدفع',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
                    ),
                    Gap(8.w),
                    SvgPicture.asset(
                      'assets/images/svg/payment_icon.svg',
                    ),
                  ],
                ),
                Gap(24.h),
                SvgPicture.asset('assets/images/svg/visaCard_icon.svg'),
                Gap(24.h),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.h),
                    color: AppConst.kPrimaryColor,
                  ),
                  // padding: EdgeInsets.all(16.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomInputField(
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.phone,
                              controller: cardNumberController,
                              validator: (value) {
                                if (value?.trim().isEmpty == true) {
                                  return 'required';
                                }
                                return null;
                              },
                              hint: ' رقم البطاقة',
                            ),
                          ),
                          Gap(12.w),
                          Assets.images.png.madaIcon.image(height: 14.h, width: 40.w),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomInputField(
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.phone,
                              controller: cardNumberController,
                              validator: (value) {
                                if (value?.trim().isEmpty == true) {
                                  return 'required';
                                }
                                return null;
                              },
                              hint: ' CVV',
                            ),
                          ),
                          Gap(16.w),
                          Expanded(
                            child: CustomInputField(
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.phone,
                              controller: cardNumberController,
                              validator: (value) {
                                if (value?.trim().isEmpty == true) {
                                  return 'required';
                                }
                                return null;
                              },
                              hint: ' شهر/سنة ',
                            ),
                          ),
                          Gap(16.w),
                          SvgPicture.asset('assets/images/svg/visa_icon.svg', height: 14.h, width: 40.w)
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomInputField(
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.phone,
                              controller: cardNumberController,
                              validator: (value) {
                                if (value?.trim().isEmpty == true) {
                                  return 'required';
                                }
                                return null;
                              },
                              hint: ' اسم حامل البطاقة  ',
                            ),
                          ),
                          Gap(24.w),
                          SvgPicture.asset('assets/images/svg/masterCard_icon.svg', height: 18.h, width: 28.w)
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomInputField(
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.phone,
                              controller: cardNumberController,
                              validator: (value) {
                                if (value?.trim().isEmpty == true) {
                                  return 'required';
                                }
                                return null;
                              },
                              hint: '  ',
                            ),
                          ),
                          Gap(14.w),
                          SvgPicture.asset('assets/images/svg/visa_icon.svg', height: 14.h, width: 40.w)
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
