import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:pro_bread_app/features/auth/presentation/screens/product_details_page.dart';
import 'package:pro_bread_app/shared/text_widget.dart';

import '../core/const/constant_var.dart';
import '../core/uitls/utils.dart';

class ProductCard extends StatelessWidget {
  ProductCard(
      {super.key,
      this.addToCart = false,
      this.cartIcon = Icons.add_shopping_cart});

  bool addToCart = false;
  IconData? cartIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
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
              BoxShadow(color: AppConst.kPrimaryColor, spreadRadius: 4.0)
            ],
          ),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SvgPicture.asset(
                            'assets/images/svg/empty_heart_icon01.svg'),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextWidget(
                            title: 'كيكة ليمون بلوبيري ',
                            color: AppConst.kPrimaryTextColor,
                            fontSize: 12.sp,
                            // fontWeight: FontWeight.bold,
                          ),
                          Gap(12.h),
                          TextWidget(
                            title: 'قطعة براونيز مغطاه بالنوتيلا ',
                            color: AppConst.kThirdTextColor,
                            fontSize: 12.sp,
                            // fontWeight: FontWeight.bold,
                          ),
                          Gap(12.h),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (addToCart = true)
                        const TextWidget(
                          title: 'أضف إلى العربة',
                          color: AppConst.kBorderButtonColor,
                        ),
                      Gap(4.w),
                      if (cartIcon != null)
                        SvgPicture.asset('assets/images/svg/cart_icon.svg'),
                      Gap(16.w),
                      TextWidget(
                        title: '225 ر.س',
                        color: AppConst.kScondaryTextColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 16.0),
                child: SizedBox(
                  height: 80.h,
                  width: 85.w,
                  child: Image.asset('assets/images/png/cake00.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
