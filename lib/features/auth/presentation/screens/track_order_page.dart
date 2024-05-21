import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../shared/custom_app_bar.dart';
import '../../../../shared/text_widget.dart';

class TrackOrderPage extends StatelessWidget {
  const TrackOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.build(
        context,
        titleText: 'تتبع الطلب',
      ),
      backgroundColor: AppConst.kPrimaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppConst.kPrimaryColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextWidget(
                      title: ' ${'order_number'.tr()} 123456',
                    ),
                    Stepper(
                      connectorColor: const MaterialStatePropertyAll(AppConst.kBorderButtonColor),
                      currentStep: 0,
                      steps: const [
                        Step(
                            subtitle: Text('   الطلب'),
                            title: Text('12/12/2022'),
                            content: Text(' '),
                            isActive: true,
                            state: StepState.complete),
                      ],
                    ),
                    Stepper(
                      controlsBuilder: (context, details) => const SizedBox(),
                      connectorColor: const MaterialStatePropertyAll(AppConst.kBorderButtonColor),
                      currentStep: 0,
                      steps: const [
                        Step(
                            subtitle: Text(' الطلب'),
                            title: Text('12/12/2022'),
                            content: Text(' '),
                            isActive: true,
                            state: StepState.complete),
                      ],
                    ),
                    Stepper(
                      onStepCancel: () {
                        Navigator.pop(context);
                      },
                      onStepContinue: () {},
                      controlsBuilder: (context, details) => const SizedBox(),
                      connectorColor: const MaterialStatePropertyAll(AppConst.kBorderButtonColor),
                      currentStep: 0,
                      steps: const [
                        Step(
                            subtitle: Text('   الطلب'),
                            title: Text('12/12/2022'),
                            content: Text(' '),
                            isActive: true,
                            state: StepState.complete),
                      ],
                    ),
                  ],
                ),
              ),
              Gap(16.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppConst.kPrimaryColor,
                  boxShadow: const [
                    BoxShadow(
                      color: AppConst.kBottomBarColor,
                      spreadRadius: .5,
                      blurRadius: 5,
                      offset: Offset(0, .1),
                    ),
                  ],
                ),
                // height: 200.h,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'delivery_to'.tr(),
                      style: TextStyle(
                        color: AppConst.kThirdTextColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    Gap(4.h),
                    Text(
                      'mansoura'.tr(),
                      style: TextStyle(color: AppConst.kPrimaryTextColor, fontSize: 14.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Gap(16.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: AppConst.kBottomBarColor,
                      spreadRadius: .5,
                      blurRadius: 5,
                      offset: Offset(0, .1),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppConst.kPrimaryColor,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          title: 'payment_summary'.tr(),
                          color: AppConst.kScondaryTextColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Gap(16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          title: 'order_total'.tr(),
                          color: AppConst.kThirdTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        Gap(16.w),
                        // const Spacer(),
                        TextWidget(
                          title: ' 240 ${'SAR'.tr()}',
                          color: AppConst.kPrimaryTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        // Gap(16.h),
                      ],
                    ),
                    Gap(16.h),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextWidget(
                            title: 'delivery_fee'.tr(),
                            color: AppConst.kThirdTextColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gap(16.w),
                        TextWidget(
                          title: ' 510 ${'SAR'.tr()}',
                          color: AppConst.kPrimaryTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Gap(16.h),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextWidget(
                            title: 'discount_code'.tr(),
                            color: AppConst.kThirdTextColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gap(16.w),
                        TextWidget(
                          title: ' 411 ${'SAR'.tr()}',
                          color: AppConst.kPrimaryTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Gap(16.h),
                    Divider(
                      color: AppConst.kBorderBoxColor,
                      thickness: 1.h,
                      height: 1.h,
                    ),
                    Gap(16.h),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextWidget(
                            title: 'total'.tr(),
                            color: AppConst.kThirdTextColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gap(16.w),
                        TextWidget(
                          title: ' 855 ${'SAR'.tr()}',
                          color: AppConst.kScondaryTextColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Gap(24.h),
            ],
          ),
        ),
      ),
    );
  }
}
