import 'package:easy_localization/easy_localization.dart';
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

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

int _counter = 1;

class _CartPageState extends State<CartPage> {
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kPrimaryColor,
      appBar: CustomAppBar.build(
        context,
        titleText: 'cart'.tr(),
        actions: [],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.separated(
                  separatorBuilder: (context, index) => Gap(24.h),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Ink(
                          child: SvgPicture.asset('assets/images/svg/delete_icon.svg'),
                        ),
                        Gap(14.w),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.pushNamed(context, Routes.productDetailsRoute);
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
                                  BoxShadow(color: AppConst.kPrimaryColor, spreadRadius: 4.0)
                                ],
                              ),
                              padding: EdgeInsets.only(left: 16.h, right: 4.h, top: 16.h, bottom: 16.h),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.w, bottom: 32.h),
                                    child: SizedBox(
                                      height: 60.h,
                                      width: 60.w,
                                      child: Image.asset('assets/images/png/cake00.png'),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextWidget(
                                                title: 'hot_drinks'.tr(),
                                                color: AppConst.kPrimaryTextColor,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              Gap(12.h),
                                              TextWidget(
                                                title: 'cold_drinks'.tr(),
                                                color: AppConst.kThirdTextColor,
                                                fontSize: 12.sp,
                                                // fontWeight: FontWeight.bold,
                                              ),
                                              Gap(12.h),
                                              TextWidget(
                                                title: 'croissants'.tr(),
                                                color: AppConst.kThirdTextColor,
                                                fontSize: 12.sp,
                                                // fontWeight: FontWeight.bold,
                                              ),
                                              Gap(12.h),
                                            ],
                                          ),
                                          Gap(60.w),
                                          Column(
                                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              TextWidget(
                                                title: ' 255 ${'SAR'.tr()}',
                                                color: AppConst.kScondaryTextColor,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              Gap(12.h),
                                              TextWidget(
                                                title: ' 210 ${'SAR'.tr()}',
                                                color: AppConst.kThirdTextColor,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              Gap(12.h),
                                              TextWidget(
                                                title: ' 200 ${'SAR'.tr()}',
                                                color: AppConst.kThirdTextColor,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              Gap(12.h),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            title: '  ${'quantity'.tr()} :',
                                            color: AppConst.kScondaryTextColor,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          Gap(16.w),
                                          Container(
                                            height: 30.h,
                                            width: 125.w,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8.0),
                                              color: AppConst.kPrimaryColor,
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                    child: SvgPicture.asset('assets/images/svg/plus_icon.svg'),
                                                    onTap: () {
                                                      setState(() {
                                                        if (_counter < 10) {
                                                          _counter++;
                                                        }
                                                      });
                                                    }),
                                                Gap(12.w),
                                                Text('$_counter'),
                                                Gap(12.w),
                                                InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        if (_counter > 1) {
                                                          _counter--;
                                                        }
                                                      });
                                                    },
                                                    child: SvgPicture.asset('assets/images/svg/minus_icon.svg')),
                                                Gap(12.w),
                                              ],
                                            ),
                                          ),
                                          // Gap(12.w),
                                          // SvgPicture.asset('assets/images/svg/plus_icon.svg'),
                                          // Gap(12.w),
                                          // const Text('1'),
                                          // Gap(12.w),
                                          // SvgPicture.asset('assets/images/svg/minus_icon.svg'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
              Gap(32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'discount_code'.tr(),
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
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
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset('assets/images/svg/discount_icon.svg'),
                  ),
                  suffixText: 'apply'.tr(),
                  suffixStyle:
                      const TextStyle(color: AppConst.kBorderButtonColor, fontSize: 16, fontWeight: FontWeight.bold),
                  hintText: 'enter_discount_code'.tr(),
                  hintStyle: const TextStyle(color: AppConst.kThirdTextColor, fontSize: 14),
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
              //       mainAxisAlignment: MainAxisAlignment.start,
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
                        TextWidget(
                          title: ' 600 ${'SAR'.tr()}',
                          color: AppConst.kPrimaryTextColor,
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
                          title: 'delivery_fee'.tr(),
                          color: AppConst.kThirdTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        Gap(16.h),
                        TextWidget(
                          title: ' 100 ${'SAR'.tr()}',
                          color: AppConst.kPrimaryTextColor,
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
                          title: 'discount_code'.tr(),
                          color: AppConst.kThirdTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        Gap(16.h),
                        TextWidget(
                          title: ' 50 ${'SAR'.tr()}',
                          color: AppConst.kPrimaryTextColor,
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
                          title: 'total'.tr(),
                          color: AppConst.kThirdTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        Gap(16.h),
                        TextWidget(
                          title: ' 240 ${'SAR'.tr()}',
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
              CustomTextButton(
                onTap: () {
                  Utils.openScreen(context, const DeliveredDetailsPage());
                },
                title: 'proceed_to_checkout'.tr(),
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
