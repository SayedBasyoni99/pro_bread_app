import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../../shared/custom_app_bar.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/utils/utils.dart';
import '../../../../shared/text_button.dart';
import '../../../../shared/text_widget.dart';
import 'delivered_details_page.dart';
import 'product_details_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kPrimaryColor,
      appBar: CustomAppBar.build(
        context,
        titleText: 'السلة',
        actions: [],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Utils.openScreen(
                                context,
                                const ProductDetailsPage(),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: AppConst.kPrimaryColor,
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppConst.kBottomBarColor,
                                    spreadRadius: .5,
                                    blurRadius: 5,
                                    offset: Offset(0, .1),
                                    // changes position of shadow
                                  ),
                                  BoxShadow(
                                      color: AppConst.kPrimaryColor,
                                      spreadRadius: 4.0)
                                ],
                              ),
                              padding: EdgeInsets.all(16.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextWidget(
                                                title: '225 ر.س',
                                                color:
                                                    AppConst.kScondaryTextColor,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              Gap(12.w),
                                              TextWidget(
                                                title: 'كيكة ليمون بلوبيري ',
                                                color:
                                                    AppConst.kPrimaryTextColor,
                                                fontSize: 12.sp,
                                                // fontWeight: FontWeight.bold,
                                              ),
                                            ],
                                          ),
                                          Gap(12.h),
                                          Row(
                                            children: [
                                              TextWidget(
                                                title: '225 ر.س',
                                                color:
                                                    AppConst.kScondaryTextColor,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              Gap(12.w),
                                              TextWidget(
                                                title:
                                                    'قطعة براونيز مغطاه بالنوتيلا ',
                                                color: AppConst.kThirdTextColor,
                                                fontSize: 12.sp,
                                                // fontWeight: FontWeight.bold,
                                              ),
                                            ],
                                          ),
                                          Gap(12.h),
                                          Row(
                                            children: [
                                              TextWidget(
                                                title: '225 ر.س',
                                                color:
                                                    AppConst.kScondaryTextColor,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              Gap(12.w),
                                              TextWidget(
                                                title:
                                                    'قطعة براونيز مغطاه بالنوتيلا ',
                                                color: AppConst.kThirdTextColor,
                                                fontSize: 12.sp,
                                                // fontWeight: FontWeight.bold,
                                              ),
                                            ],
                                          ),
                                          Gap(12.h),
                                        ],
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/images/svg/plus_icon.svg'),
                                          Gap(12.w),
                                          const Text('1'),
                                          Gap(12.w),
                                          SvgPicture.asset(
                                              'assets/images/svg/minus_icon.svg'),
                                          Gap(12.w),
                                          TextWidget(
                                            title: 'الكمية :',
                                            color: AppConst.kScondaryTextColor,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 8.w, top: 16.h, bottom: 16.h),
                                    child: SizedBox(
                                      height: 70.h,
                                      width: 70.w,
                                      child: Image.asset(
                                          'assets/images/png/cake00.png'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Ink(
                            child: SvgPicture.asset(
                                'assets/images/svg/delete_icon.svg'),
                          ),
                        ),
                      ],
                    );
                  }),
              Gap(32.h),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'كود الخصم',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppConst.kThirdTextColor),
                  ),
                ],
              ),
              Gap(12.h),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child:
                        SvgPicture.asset('assets/images/svg/discount_icon.svg'),
                  ),
                  prefixText: ' تطبيق ',
                  prefixStyle: const TextStyle(
                      color: AppConst.kBorderButtonColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  hintText: 'ادخل كود الخصم',
                  hintStyle: const TextStyle(
                      color: AppConst.kThirdTextColor, fontSize: 14),
                  contentPadding: const EdgeInsets.all(16.0),
                  fillColor: AppConst.kBorderBoxColor,
                  filled: true,
                ),
              ),
              // Container(
              //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(8.0),
              //       color: AppConst.kBorderBoxColor,
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       children: [SvgPicture.asset('assets/images/svg/discount_icon.svg'),

              //       ],

              //     )),

              Gap(16.h),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppConst.kPrimaryColor,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextWidget(
                          title: 'ملخص الدفع',
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
                          title: '220 ر.س',
                          color: AppConst.kPrimaryTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        Gap(16.h),
                        TextWidget(
                          title: 'مجموع الطلب',
                          color: AppConst.kThirdTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Gap(16.w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          title: ' 220 ر.س',
                          color: AppConst.kPrimaryTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        Gap(16.h),
                        TextWidget(
                          title: 'رسوم التوصيل ',
                          color: AppConst.kThirdTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Gap(16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          title: '220 ر.س',
                          color: AppConst.kPrimaryTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        Gap(16.h),
                        TextWidget(
                          title: ' كود الخصم',
                          color: AppConst.kThirdTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Gap(16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          title: '220 ر.س',
                          color: AppConst.kScondaryTextColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        Gap(16.h),
                        TextWidget(
                          title: 'المجموع',
                          color: AppConst.kThirdTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Gap(24.h),
              CustomTextButton(
                onTap: () {
                  Utils.openScreen(context, const DeliveredDetailsPage());
                },
                title: 'تابع إتمام الطلب ',
                fontSize: 18.sp,
              ),
              Gap(24.h),
            ],
          ),
        ),
      ),
    );
  }
}
