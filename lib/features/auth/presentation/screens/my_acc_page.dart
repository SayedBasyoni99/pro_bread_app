import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/utils/utils.dart';
import '../../../../shared/custom_adress_box.dart';
import 'acc_info_page.dart';
import 'change_password02_page.dart';
import 'lang_page.dart';
import 'my_orders_page.dart';
import 'welcome_page.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConst.kPrimaryColor,
        // appBar: CustomAppBar.build(
        //   context,
        //   titleText: 'حسابي',
        //   iconAppBar: SvgPicture.asset('assets/images/svg/cart_icon.svg'),
        // removeBack: true,
        // ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 55.r,
                      backgroundColor: AppConst.kPrimaryColor,
                      child: Image.asset('assets/images/png/userPic.png'),
                    ),
                    Positioned(
                        top: 70.h,
                        right: 60.w,
                        child: GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset('assets/images/svg/camera_icon.svg'),
                        )),
                  ],
                ),
                Gap(12.h),
                Text(
                  'elsayed_gaber'.tr(),
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: AppConst.kPrimaryTextColor,
                  ),
                ),
                Text(
                  'Elsayed.Gaber99@gmail.com',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppConst.kThirdTextColor,
                  ),
                ),
                Gap(42.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Utils.openScreen(context, const ChangePassword02Page());
                      },
                      child: CustomAdressBox(
                        boxTitle: 'change_password'.tr(),
                        picInfo: 'changePassword_icon',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Utils.openScreen(context, const AccountInfoPage());
                      },
                      child: CustomAdressBox(
                        boxTitle: 'account_information'.tr(),
                        picInfo: 'accInfo_icon',
                      ),
                    ),
                  ],
                ),
                Gap(24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Utils.openScreen(context, const LanguagePage());
                      },
                      child: CustomAdressBox(
                        boxTitle: 'language'.tr(),
                        picInfo: 'language_icon',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Utils.openScreen(context, const MyOrdersPage());
                      },
                      child: CustomAdressBox(
                        boxTitle: 'my_orders'.tr(),
                        picInfo: 'myOrders_icon',
                      ),
                    ),
                  ],
                ),
                Gap(60.h),
                GestureDetector(
                  onTap: () {
                    Utils.openScreen(context, const WelcomePage(), replacment: true);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'logout'.tr(),
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xffC20000)),
                      ),
                      Gap(4.h),
                      SvgPicture.asset('assets/images/svg/logOut_icon.svg'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
