import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../home/presentation/screens/home_page.dart';
import '../../../../shared/product_card.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/utils/utils.dart';
import '../../../../shared/custom_card.dart';
import '../../../../shared/text_widget.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar.build(
      //   context,
      // ),
      backgroundColor: AppConst.kPrimaryColor,
      // appBar: CustomAppBar.build(context,
      //     titleText: 'المنتجات',
      //     backgroundColor: AppConst.kPrimaryColor,
      //     iconAppBar: SvgPicture.asset('assets/images/svg/cart_icon.svg')),
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
                          Utils.openScreen(context, const HomePage(),
                              replacment: true);
                        },
                        child: const CustomCard(
                          color: AppConst.kBorderBoxColor,
                        ));
                  }),
            ),
            Gap(16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
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
                      return ProductCard();
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
