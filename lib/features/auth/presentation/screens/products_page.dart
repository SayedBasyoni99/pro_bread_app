import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:pro_bread_app/features/auth/presentation/screens/home_page.dart';
import 'package:pro_bread_app/features/auth/presentation/screens/product_details_page.dart';
import 'package:pro_bread_app/shared/custom_app_bar.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/uitls/utils.dart';
import '../../../../shared/custom_card.dart';
import '../../../../shared/text_widget.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kPrimaryColor,
      appBar: CustomAppBar.build(context,
          titleText: 'المنتجات',
          backgroundColor: AppConst.kPrimaryColor,
          iconAppBar: SvgPicture.asset('assets/images/svg/cart_icon.svg')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 140.h,
              child: ListView.separated(
                  separatorBuilder: (context, index) => Gap(16.h),
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  physics: const BouncingScrollPhysics(),
                  itemCount: 4,
                  //  viewModel.homeModel?.data?.products?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    //  Products? product =
                    //      viewModel.homeModel?.data?.products?[index];
                    return GestureDetector(
                        onTap: () {
                          Utils.openScreen(context, const HomePage());
                        },
                        child: const CustomCard(
                          color: AppConst.kBorderBoxColor,
                        ));
                  }),
            ),
            Gap(16.h),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: .06.sh,
                  width: 16.w,
                  child: SvgPicture.asset('assets/images/svg/desert_icon.svg'),
                ),
                const Gap(8),
                TextWidget(
                  title: 'الحلا',
                  color: AppConst.kPrimaryTextColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            Gap(16.h),
            SizedBox(
              child: SingleChildScrollView(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Utils.openScreen(context, const ProductDetailsPage());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: AppConst.kPrimaryColor,
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: SvgPicture.asset('assets/images/svg/empty_heart_icon01.svg'),
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
                                  TextWidget(
                                    title: 'قطعة براونيز مغطاه بالنوتيلا ',
                                    color: AppConst.kThirdTextColor,
                                    fontSize: 12.sp,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                  TextWidget(
                                    title: '225 ر.س',
                                    color: AppConst.kScondaryTextColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 16.0),
                                child: SizedBox(
                                  height: 80.h,
                                  width: 85.w,
                                  child: Assets.images.png.cake00.image(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics()),
              ),
            )
          ],
        ),
      ),
    );
  }
}


//  Card(
//                         color: AppConst.kPrimaryColor,
//                         elevation: 2.0,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         child: 
//                       Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 16.0),
//                               child: SizedBox(
//                                 height: 80.h,
//                                 width: 85.w,
//                                 child: Assets.images.png.cake00.image(),
//                               ),
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 TextWidget(
//                                   title: 'كيكة ليمون بلوبيري ',
//                                   color: AppConst.kPrimaryTextColor,
//                                   fontSize: 12.sp,
//                                   // fontWeight: FontWeight.bold,
//                                 ),
//                                 TextWidget(
//                                   title: 'قطعة براونيز مغطاه بالنوتيلا ',
//                                   color: AppConst.kThirdTextColor,
//                                   fontSize: 12.sp,
//                                   // fontWeight: FontWeight.bold,
//                                 ),
//                                 TextWidget(
//                                   title: '225 ر.س',
//                                   color: AppConst.kScondaryTextColor,
//                                   fontSize: 14.sp,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ],
//                             ),
//                             const Spacer(),
//                             Padding(
//                               padding: const EdgeInsets.only(right: 8.0),
//                               child: SvgPicture.asset('assets/images/svg/empty_heart_icon01.svg'),
//                             )
//                           ],
//                         ),
//                       );