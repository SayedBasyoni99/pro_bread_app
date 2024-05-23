import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/utils/app_snack_bar.dart';
import '../../../../shared/product_card.dart';
import '../controller/get_favorites/get_favorites_cubit.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    super.initState();
    context.read<GetFavoritesCubit>().fGetFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kPrimaryColor,
      body: BlocConsumer<GetFavoritesCubit, GetFavoritesState>(
        listener: (BuildContext context, GetFavoritesState state) {
          if (state is GetFavoritesErrorState) {
            showAppSnackBar(context: context, message: state.message, type: ToastType.error);
          }
        },
        builder: (context, state) {
          if (state is GetFavoritesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppConst.kBorderButtonColor,
              ),
            );
          }
          if (state is GetFavoritesSuccessState) {
            return state.value.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Gap(60.h),
                        SvgPicture.asset('assets/images/svg/noProducts_icon.svg'),
                        Gap(16.h),
                        Text(
                          'no_search_results'.tr(),
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: AppConst.kPrimaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Gap(32.h),
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            '${'product_count'.tr()} : ${state.value.length}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppConst.kThirdTextColor,
                            ),
                          ),
                        ),
                        Gap(16.h),
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) => Gap(24.h),
                            itemBuilder: (context, index) {
                              final dish = state.value[index];
                              return ProductCard(
                                item: dish,
                              );
                            },
                            itemCount: state.value.length,
                          ),
                        ),
                      ],
                    ),
                  );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
