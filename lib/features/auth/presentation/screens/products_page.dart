import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:pro_bread_app/features/auth/presentation/screens/home_page.dart';
import 'package:pro_bread_app/shared/custom_app_bar.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/uitls/utils.dart';
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
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: AppConst.kBorderBoxColor,
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: .06.sh,
                              width: 24.w,
                              child: SvgPicture.asset('assets/images/svg/cold_drinks_icon.svg'),
                            ),
                            TextWidget(
                              title: 'اسم المنتج ',
                              color: AppConst.kScondaryTextColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Gap(16.h),
            SizedBox(
              child: SingleChildScrollView(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        color: AppConst.kBorderButtonColor,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            Container(color: AppConst.kBorderButtonColor),
                            SizedBox(
                              height: 80.h,
                              width: 88.w,
                              child: TextWidget(
                                title: 'ماذا تبحث؟',
                                color: AppConst.kScondaryTextColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
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




//  Container(
//                             // decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
//                             color: AppConst.kButtonColor,
//                             child: const Text('hello'),
//                           ),