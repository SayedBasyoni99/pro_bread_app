import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../shared/custom_app_bar.dart';
import '../../../../shared/order_card.dart';
import '../../../../shared/tabbar_widget.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.build(
        context,
        titleText: 'my_orders'.tr(),
        iconAppBar: SvgPicture.asset('assets/images/svg/cart_icon.svg'),
      ),
      backgroundColor: AppConst.kPrimaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 32.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                color: AppConst.kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  side: const BorderSide(
                    color: AppConst.kBorderBoxColor,
                  ),
                ),
                elevation: 0.0,
                //   ),
                child: TabBarWidget(
                    length: 2,
                    tabs:  [
                      Tab(text:'received_orders'.tr()),
                      Tab(text: 'pending_orders'.tr()),
                    ],
                    onTap: (index) {
                      return null;
                    }),
              ),

              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     height: 50.h,
              //     padding:
              //         EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              //     decoration: BoxDecoration(
              //       boxShadow: const [
              //         BoxShadow(
              //           color: AppConst.kBottomBarColor,
              //           spreadRadius: .3,
              //           // blurRadius: .5,
              //           // offset: Offset(0, .1),
              //         )
              //       ],
              //       borderRadius: BorderRadius.circular(8.0),
              //       color: AppConst.kPrimaryColor,
              //       border: Border.all(color: AppConst.kBorderBoxColor),
              //     ),
              //     child: TabBarWidget(
              //         length: 2,
              //         tabs: const [
              //           Tab(text: 'الطلبات المعلقة'),
              //           Tab(text: 'الطلبات المستلمة'),
              //         ],
              //         onTap: (index) {
              //           return null;
              //         }),
              //   ),
              // ),
              Gap(16.h),
              ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.h, horizontal: 16.w),
                      child: const OrderCard(),
                    );
                  },
                  itemCount: 6,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics()),
            ],
          ),
        ),
      ),
    );
  }
}
