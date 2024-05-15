import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/utils/utils.dart';
import '../../../../shared/custom_app_bar.dart';
import '../../../../shared/custom_stepper_widget.dart';
import '../../../../shared/text_button.dart';
import 'payment_page.dart';

class DeliveryTimePage extends StatelessWidget {
  const DeliveryTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kPrimaryColor,
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
        child: Padding(
          padding:
              EdgeInsets.only(right: 16.w, left: 16.w, top: 32.h, bottom: 32.h),
          child: Column(
            children: [
              const Row(
                children: [
                  CustomStepper(),
                  CustomStepper(),
                  CustomStepper(stepperColor: AppConst.kSecondaryStepperColor),
                  CustomStepper(stepperColor: AppConst.kSecondaryStepperColor),
                ],
              ),
              Gap(32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'وقت التوصيل',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppConst.kPrimaryTextColor),
                  ),
                  Gap(8.w),
                  SvgPicture.asset('assets/images/svg/deliveryTime_icon.svg'),
                ],
              ),
              Gap(24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'بعد 45 دق',
                    style: TextStyle(
                        color: AppConst.kPrimaryTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  Gap(4.w),
                  SvgPicture.asset(
                    'assets/images/svg/un select_icon.svg',
                  )
                ],
              ),
              Gap(24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'اختر وقت آخر',
                    style: TextStyle(
                        color: AppConst.kPrimaryTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  Gap(4.w),
                  SvgPicture.asset(
                    'assets/images/svg/select_icon.svg',
                  )
                ],
              ),
              Gap(32.h),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'حدد اليوم',
                    style: TextStyle(
                        color: AppConst.kThirdTextColor, fontSize: 12),
                  ),
                ],
              ),
              Gap(24.h),
              SizedBox(
                height: 80.h,
                width: double.infinity,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 64.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: AppConst.kBorderBoxColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text(
                              'اليوم',
                              style: TextStyle(
                                  color: AppConst.kThirdTextColor,
                                  fontSize: 12),
                            ),
                            Gap(16.h),
                            const Text(
                              '25 يناير',
                              style: TextStyle(
                                  color: AppConst.kPrimaryTextColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Gap(8.w),
                ),
              ),
              Gap(32.h),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'حدد الوقت ',
                    style: TextStyle(
                        color: AppConst.kThirdTextColor, fontSize: 12),
                  ),
                ],
              ),
              Gap(24.h),
              SizedBox(
                height: 40.h,
                width: double.infinity,
                child: ListView.separated(
                  separatorBuilder: (context, index) => Gap(8.w),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(8.h),
                      width: 80.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: AppConst.kBorderBoxColor,
                      ),
                      child: const Center(
                        child: Text(
                          ' 05:00 ',
                          style: TextStyle(
                              color: AppConst.kPrimaryTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Gap(100.h),
              CustomTextButton(
                icon: Icons.arrow_forward,
                onTap: () {
                  Utils.openScreen(
                    context,
                    PaymentPage(),
                  );
                },
                title: 'التالي',
                fontSize: 18.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
