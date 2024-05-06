import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../shared/custom_app_bar.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/utils/utils.dart';
import '../../../../shared/text_widget.dart';
import '../screens/product_details_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kPrimaryColor,
      appBar: CustomAppBar.build(
        context,
        titleText: 'السلة',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      Utils.openScreen(context, const ProductDetailsPage(),
                          replacment: true);
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
                              color: AppConst.kPrimaryColor, spreadRadius: 4.0)
                        ],
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      TextWidget(
                                        title: '225 ر.س',
                                        color: AppConst.kScondaryTextColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      Gap(12.w),
                                      TextWidget(
                                        title: 'كيكة ليمون بلوبيري ',
                                        color: AppConst.kPrimaryTextColor,
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
                                        color: AppConst.kScondaryTextColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      Gap(12.w),
                                      TextWidget(
                                        title: 'قطعة براونيز مغطاه بالنوتيلا ',
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
                                        color: AppConst.kScondaryTextColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      Gap(12.w),
                                      TextWidget(
                                        title: 'قطعة براونيز مغطاه بالنوتيلا ',
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
                                children: [
                                  SvgPicture.asset(
                                      'assets/images/svg/plus_icon.svg'),
                                  Gap(12.w),
                                  Text('1'),
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
                            padding: const EdgeInsets.only(
                                left: 8.0, top: 16.0, bottom: 16.0),
                            child: SizedBox(
                              height: 80.h,
                              width: 85.w,
                              child:
                                  Image.asset('assets/images/png/cake00.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Ink(
                child: SvgPicture.asset('assets/images/svg/delete_icon.svg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
