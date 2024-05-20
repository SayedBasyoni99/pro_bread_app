import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/utils/utils.dart';
import '../../../../shared/custom_app_bar.dart';

import '../../../auth/presentation/screens/cart_page.dart';
import '../../../categories/presentation/controller/get_categories/get_categories_cubit.dart';
import '../controllers/bottom_nav_bar/bottom_nav_bar_cubit.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    context.read<GetCategoriesCubit>().fGetCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar.build(
            removeBack: true,
            iconAppBar: GestureDetector(
              onTap: () {
                Utils.openScreen(context, const CartPage());
              },
              child: SvgPicture.asset(
                'assets/images/svg/cart_icon.svg',
                height: 20,
                width: 20,
              ),
            ),

            context,
            centerTitle: true,
            // titleText : state.index == 1? 'Add' : state.index == 2? 'Star': 'Home',
            title: Builder(
              builder: (context) {
                String title = 'home'.tr();
                if (state.index == 1) {
                  title = 'products'.tr();
                }
                if (state.index == 2) {
                  title = 'favourites'.tr();
                }
                if (state.index == 3) {
                  title = 'profile'.tr();
                }
                return Text(
                  title,
                  style: const TextStyle(color: AppConst.kScondaryTextColor, fontSize: 20, fontWeight: FontWeight.bold),
                );
              },
            ),
          ),
          // appBar: AppBar(
          //   centerTitle: true,
          //   title: Builder(
          //     builder: (context) {
          //       String title = 'Home';
          //       if (state.index == 1) {
          //         title = 'Add';
          //       }
          //       if (state.index == 2) {
          //         title = 'Star';
          //       }
          //       return Text(title);
          //     },
          //   ),
          // ),
          body: context.read<BottomNavBarCubit>().screens[state.index],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppConst.kBorderButtonColor,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppConst.kPrimaryColor,
            currentIndex: state.index,
            onTap: (int index) => context.read<BottomNavBarCubit>().changeCurrentScreen(index: index),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/images/svg/home_icon.svg'),
                ),
                activeIcon: Column(
                  children: [
                    Container(
                      height: 2.h,
                      width: 20.w,
                      color: AppConst.kBorderButtonColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/images/svg/home_icon.svg',
                        colorFilter: const ColorFilter.mode(AppConst.kBorderButtonColor, BlendMode.srcIn),
                      ),
                    ),
                  ],
                ),
                label: 'home'.tr(),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/images/svg/product_icon.svg'),
                ),
                activeIcon: Column(
                  children: [
                    Container(
                      height: 2.h,
                      width: 20.w,
                      color: AppConst.kBorderButtonColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/images/svg/product_icon.svg',
                        colorFilter: const ColorFilter.mode(AppConst.kBorderButtonColor, BlendMode.srcIn),
                      ),
                    ),
                  ],
                ),
                label: 'products'.tr(),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/images/svg/favorite_icon.svg'),
                ),
                activeIcon: Column(
                  children: [
                    Container(
                      height: 2.h,
                      width: 20.w,
                      color: AppConst.kBorderButtonColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/images/svg/favorite_icon.svg',
                        colorFilter: const ColorFilter.mode(AppConst.kBorderButtonColor, BlendMode.srcIn),
                      ),
                    ),
                  ],
                ),
                label: 'favourites'.tr(),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/images/svg/account_icon.svg'),
                ),
                activeIcon: Column(
                  children: [
                    Container(
                      height: 2.h,
                      width: 20.w,
                      color: AppConst.kBorderButtonColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/images/svg/account_icon.svg',
                        colorFilter: const ColorFilter.mode(AppConst.kBorderButtonColor, BlendMode.srcIn),
                      ),
                    ),
                  ],
                ),
                label: 'profile'.tr(),
              ),
            ],
          ),
        );
      },
    );
  }
}
