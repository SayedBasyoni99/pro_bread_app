import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/utils.dart';
import '../../../../shared/custom_adress_box.dart';
import '../controller/auto_login/auto_login_cubit.dart';
import '../controller/login/login_cubit.dart';
import 'acc_info_page.dart';
import 'change_password02_page.dart';
import 'lang_page.dart';
import 'my_orders_page.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AutoLoginCubit, AutoLoginState>(
      listener: (context, state) {
        if (state is AutoLoginSuccessState && state.userType == UserType.login) {
          Navigator.pushNamedAndRemoveUntil(context, Routes.welcomeRoute, (route) => false);
        }
      },
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (BuildContext context, LoginState state) {
          final user = context.read<LoginCubit>().data?.data;
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
                            child: Builder(
                              builder: (context) {
                                if (user?.image == null || user?.image == '') {
                                  return Image.asset('assets/images/png/userPic.png');
                                }
                                return Image.network(user?.image ?? '');
                              },
                            ),
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
                        user?.name ?? 'Sayed',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppConst.kPrimaryTextColor,
                        ),
                      ),
                      Text(
                        user?.email ?? 'elsayed@me.com',
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
                          context.read<AutoLoginCubit>().fLogout();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'logout'.tr(),
                              style:
                                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xffC20000)),
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
        },
      ),
    );
  }
}
