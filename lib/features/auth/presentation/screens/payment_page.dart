// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/resources/assets.gen.dart';
import '../../../../core/utils/utils.dart';
import '../../../../shared/custom_app_bar.dart';
import '../../../../shared/custom_input_field.dart';
import '../../../../shared/custom_stepper_widget.dart';
import '../../../../shared/custom_txt_bottom.dart';
import '../../../../shared/show_dialog.dart';
import '../../../../shared/text_button.dart';
import '../../../home/presentation/screens/home_page.dart';
import 'track_order_page.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({super.key});
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final cardNumberController = TextEditingController();
  final cvvNumberController = TextEditingController();
  final expDateController = TextEditingController();
  final onwerCardNameController = TextEditingController();

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
            padding: EdgeInsets.only(
                right: 16.w, left: 16.w, top: 32.h, bottom: 32.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Row(
                  children: [
                    CustomStepper(),
                    CustomStepper(
                        stepperColor: AppConst.kSecondaryStepperColor),
                    CustomStepper(
                        stepperColor: AppConst.kSecondaryStepperColor),
                    CustomStepper(
                        stepperColor: AppConst.kSecondaryStepperColor),
                  ],
                ),
                Gap(32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'معلومات الدفع',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppConst.kPrimaryTextColor),
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
                          Assets.images.png.madaIcon
                              .image(height: 14.h, width: 40.w),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomInputField(
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.phone,
                              controller: cvvNumberController,
                              validator: (value) {
                                if (value?.trim().isEmpty == true) {
                                  return 'required';
                                }
                                return null;
                              },
                              hint: ' CVV',
                            ),
                          ),
                          // Divider(
                          //   color: AppConst.kScondaryTextColor,
                          //   thickness: 1.h,
                          //   height: 1.h,
                          //   // width: 1.w
                          // ),
                          Gap(16.w),
                          Expanded(
                            child: CustomInputField(
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.phone,
                              controller: expDateController,
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
                          SvgPicture.asset('assets/images/svg/visa_icon.svg',
                              height: 14.h, width: 40.w)
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomInputField(
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.phone,
                              controller: onwerCardNameController,
                              validator: (value) {
                                if (value?.trim().isEmpty == true) {
                                  return 'required';
                                }
                                return null;
                              },
                              hint: ' اسم حامل البطاقة  ',
                            ),
                          ),
                          Gap(25.w),
                          SvgPicture.asset(
                              'assets/images/svg/masterCard_icon.svg',
                              height: 18.h,
                              width: 28.w)
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
                          SvgPicture.asset('assets/images/svg/visa_icon.svg',
                              height: 14.h, width: 40.w)
                        ],
                      ),
                    ],
                  ),
                ),
                Gap(32.h),
                Column(
                  children: [
                    Text(
                      ': مجموع الطلب',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppConst.kThirdTextColor),
                    ),
                    Gap(8.h),
                    Text(
                      ' ر.س 2500',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppConst.kScondaryTextColor),
                    ),
                  ],
                ),
                Gap(32.h),
                CustomTextButton(
                  onTap: () {
                    if (formKey.currentState?.validate() == true) {
                      showAppDialog(
                          backgroundColor: Colors.transparent,
                          context: context,
                          child: Container(
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/png/successfullOrderBg.png'),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(16.r),
                              color: Colors.transparent,
                            ),
                            child: Wrap(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 40.h, horizontal: 16.w),
                                  child: Stack(
                                    // clipBehavior: Clip.none,
                                    children: [
                                      // Assets.images.png.successfullOrderBg
                                      //     .image(
                                      //   height: 404.h,
                                      //   fit: BoxFit.cover,
                                      // ),
                                      Positioned(
                                        top: -45.h,
                                        left: -30.w,
                                        right: -25.w,
                                        bottom: 130.h,
                                        child: SvgPicture.asset(
                                          'assets/images/svg/BgCelebration_icon.svg',
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/svg/successfullOrder_icon.svg',
                                          ),

                                          Gap(16.h),
                                          // SvgPicture.asset('assets/images/svg/heart_icon.svg'),
                                          const Text(
                                            'تم إكتمال طلبك رقم123 بنجاح  ',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    AppConst.kPrimaryTextColor),
                                          ),
                                          Gap(4.h),
                                          const Text(
                                            'جاري تحضير الطلب',
                                            style: TextStyle(
                                                fontSize: 12,
                                                // fontWeight: FontWeight.bold,
                                                color:
                                                    AppConst.kThirdTextColor),
                                          ),

                                          Gap(24.h),

                                          CustomButton(
                                              btnTitle: ' اتبع طلبك ',
                                              onTap: () {
                                                Utils.openScreen(
                                                  context,
                                                  const TrackOrderPage(),
                                                  // replacment: true
                                                );
                                              }),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )

                          // Container(
                          //   height: 404.h,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(8.h),
                          //     color: AppConst.kPrimaryColor,
                          //   ),
                          //   child: Stack(
                          //     alignment: Alignment.topCenter,
                          //     children: [
                          //       SvgPicture.asset(
                          //         'assets/images/svg/BgCelebration_icon.svg',
                          //       ),
                          //       Positioned(
                          //         top: 65.h,
                          //         child: SvgPicture.asset(
                          //           'assets/images/svg/successfullOrder_icon.svg',
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          );
                    }
                  },
                  title: ' إتمام الطلب ',
                  fontSize: 18.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
