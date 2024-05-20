import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/utils/utils.dart';
import '../../../../shared/custom_app_bar.dart';
import '../../../../shared/custom_details_container.dart';
import '../../../../shared/text_button.dart';
import 'payment_page.dart';
import 'product_details_page.dart';
import 'recipient_info_page.dart';

class ChooseLocationPage extends StatelessWidget {
  const ChooseLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kPrimaryColor,
      appBar: CustomAppBar.build(
        context,
        titleText: 'shipping_details'.tr(),
        iconAppBar: SvgPicture.asset(
          'assets/images/svg/cart_icon.svg',
          height: 20,
          width: 20,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0, top: 32.0, left: 16.0, bottom: 16.0),
          child: Column(
            children: [
              ListView.separated(
                itemBuilder: (context, index) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Utils.openScreen(
                            context,
                            const ProductDetailsPage(),
                          );
                        },
                        child: CustomDetailsContainer(
                          picInfo: 'select_icon',
                          message02: 'mansoura'.tr(),
                          message03: 'gift_services_description'.tr(),
                          message04: '+966 565 9999 00',
                        ),
                      ),
                      if (index == 0)
                        Positioned(
                          left: 4.0,
                          top: -15.h,
                          child: Container(
                            height: 24.h,
                            width: 74.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: const Color(0xffF0FBF6),
                            ),
                            child: Text(
                              'default_address'.tr(),
                              style: TextStyle(
                                  color: const Color(0xff43CA8A), fontSize: 8.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                    ],
                  );
                },
                itemCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) {
                  return Gap(32.h);
                },
              ),
              Gap(16.h),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 16.0),
              //   child: GestureDetector(
              //     onTap: () {
              //       Utils.openScreen(
              //         context,
              //         const ProductDetailsPage(),
              //       );
              //     },
              //     child: const CustomDetailsContainer(
              //       picInfo: 'un select_icon',
              //       message02: 'Ar Rawdah',
              //       message03: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة لقد تم توليد هذا النص من مولد',
              //       message04: '+966 565 9999 00',
              //     ),
              //   ),
              // ),
              // Gap(8.h),
              GestureDetector(
                onTap: () {
                  Utils.openScreen(context, const RecipientInfoPage());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/images/svg/plus_icon.svg'),
                    Gap(4.w),
                    Text(
                      'add_another_address'.tr(),
                      style:
                          TextStyle(color: AppConst.kBorderButtonColor, fontSize: 14.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Gap(150.h),
              CustomTextButton(
                onTap: () {
                  Utils.openScreen(
                    context,
                    PaymentPage(),
                  );
                },
                title: 'next'.tr(),
                fontSize: 18.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
