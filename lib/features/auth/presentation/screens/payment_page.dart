// ignore_for_file: must_be_immutable
import 'package:easy_localization/easy_localization.dart';
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
import 'track_order_page.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({super.key});
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final cardNumberController = TextEditingController();
  final cvvNumberController = TextEditingController();
  final expDateController = TextEditingController();
  final ownerCardNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.build(
        context,
        titleText: 'proceed_to_checkout'.tr(),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    CustomStepper(stepperColor: AppConst.kSecondaryStepperColor),
                    CustomStepper(stepperColor: AppConst.kSecondaryStepperColor),
                    CustomStepper(stepperColor: AppConst.kSecondaryStepperColor),
                    CustomStepper(),
                  ],
                ),
                Gap(32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'payment_information'.tr(),
                      style:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
                    ),
                    Gap(8.w),
                    SvgPicture.asset(
                      'assets/images/svg/payment_icon.svg',
                    ),
                  ],
                ),
                Gap(24.h),
                Align(alignment: Alignment.center, child: SvgPicture.asset('assets/images/svg/visaCard_icon.svg')),
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
                          Assets.images.png.madaIcon.image(height: 14.h, width: 40.w),
                          Gap(8.w),
                          Expanded(
                            child: CustomInputField(
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.phone,
                              controller: cardNumberController,
                              validator: (value) {
                                if (value?.trim().isEmpty == true) {
                                  return 'required'.tr();
                                }
                                return null;
                              },
                              hint: 'card_number'.tr(),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          // Divider(
                          //   color: AppConst.kScondaryTextColor,
                          //   thickness: 1.h,
                          //   height: 1.h,
                          //   // width: 1.w
                          // ),
                          SvgPicture.asset('assets/images/svg/visa_icon.svg', height: 14.h, width: 40.w),
                          Gap(14.w),
                          Expanded(
                            child: CustomInputField(
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.phone,
                              controller: expDateController,
                              validator: (value) {
                                if (value?.trim().isEmpty == true) {
                                  return 'required';
                                }
                                return null;
                              },
                              hint: 'expiration_date'.tr(),
                            ),
                          ),
                          Gap(16.w),
                          Expanded(
                            child: CustomInputField(
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.phone,
                              controller: cvvNumberController,
                              validator: (value) {
                                if (value?.trim().isEmpty == true) {
                                  return 'required'.tr();
                                }
                                return null;
                              },
                              hint: ' CVV',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/svg/masterCard_icon.svg', height: 18.h, width: 24.w),
                          Gap(25.w),
                          Expanded(
                            child: CustomInputField(
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.phone,
                              controller: ownerCardNameController,
                              validator: (value) {
                                if (value?.trim().isEmpty == true) {
                                  return 'required'.tr();
                                }
                                return null;
                              },
                              hint: 'card_holder_name'.tr(),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/svg/visa_icon.svg', height: 14.h, width: 40.w),
                          Gap(14.w),
                          Expanded(
                            child: CustomInputField(
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.phone,
                              controller: cardNumberController,
                              validator: (value) {
                                if (value?.trim().isEmpty == true) {
                                  return 'required'.tr();
                                }
                                return null;
                              },
                              hint: '  ',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Gap(32.h),
                Column(
                  children: [
                    Text(
                      ' ${'order_total'.tr()} :',
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                    ),
                    Gap(8.h),
                    Text(
                      '140 ${'SAR'.tr()}',
                      style:
                          TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppConst.kScondaryTextColor),
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
                            width: 343.w,
                            height: 404.h,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/png/successfullOrderBg.png'), fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(16.r),
                              color: Colors.transparent,
                            ),
                            child: Wrap(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 16.w),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      // Assets.images.png.successfullOrderBg
                                      //     .image(
                                      //   height: 404.h,
                                      //   fit: BoxFit.cover,
                                      // ),
                                      Positioned(
                                        top: -85.h,
                                        right: -30.w,
                                        left: -25.w,
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
                                          Text(
                                            'order_completed_successfully'.tr(),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: AppConst.kPrimaryTextColor),
                                          ),
                                          Gap(4.h),
                                          Text(
                                            'order_preparing'.tr(),
                                            style: const TextStyle(
                                                fontSize: 12,
                                                // fontWeight: FontWeight.bold,
                                                color: AppConst.kThirdTextColor),
                                          ),

                                          Gap(24.h),

                                          CustomButton(
                                              btnTitle: 'track_your_order'.tr(),
                                              onTap: () {
                                                Utils.openScreen(context, const TrackOrderPage(), replacment: true);
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
                  title: 'complete_order'.tr(),
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
