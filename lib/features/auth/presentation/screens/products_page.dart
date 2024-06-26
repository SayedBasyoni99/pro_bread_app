import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/utils/app_snack_bar.dart';
import '../../../../shared/text_widget.dart';
import '../../../categories/presentation/controller/get_categories/get_categories_cubit.dart';
import '../../../categories/presentation/controller/get_dishes/get_dishes_cubit.dart';
import '../../../../shared/product_card.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../shared/custom_card.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kPrimaryColor,
      // appBar: CustomAppBar.build(context,
      //     titleText: 'المنتجات',
      //     backgroundColor: AppConst.kPrimaryColor,
      //     iconAppBar: SvgPicture.asset('assets/images/svg/cart_icon.svg')),
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            BlocConsumer<GetCategoriesCubit, GetCategoriesState>(
              listener: (context, state) {
                if (state is GetCategoriesErrorState) {
                  showAppSnackBar(context: context, message: state.message, type: ToastType.error);
                }
              },
              builder: (context, state) {
                if (state is GetCategoriesLoadingState) {
                  return const SizedBox();
                }

                if (state is GetCategoriesSuccessState) {
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
                      : SizedBox(
                          height: 140.h,
                          child: ListView.separated(
                            separatorBuilder: (context, index) => Gap(16.h),
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.value.length,
                            //  viewModel.homeModel?.data?.products?.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              //  Products? product =
                              //      viewModel.homeModel?.data?.products?[index];

                              return GestureDetector(
                                  onTap: () {
                                    context.read<GetCategoriesCubit>().changeIndex(index: index);
                                    context.read<GetDishesCubit>().fGetDishes(category: state.value[index].id);
                                  },
                                  child: CustomCard(
                                    item: state.value[index],
                                    color: AppConst.kBorderBoxColor,
                                    isSelected: context.read<GetCategoriesCubit>().currentIndex == index,
                                  ));
                            },
                          ),
                        );
                }

                return const SizedBox();
              },
            ),
            Gap(16.h),
            Expanded(
              child: BlocConsumer<GetDishesCubit, GetDishesState>(
                listener: (BuildContext context, GetDishesState state) {
                  if (state is GetDishesErrorState) {
                    showAppSnackBar(context: context, message: state.message, type: ToastType.error);
                  }
                },
                builder: (BuildContext context, GetDishesState state) {
                  if (state is GetDishesLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppConst.kBorderButtonColor,
                      ),
                    );
                  }
                  if (state is GetDishesSuccessState) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          const Gap(8),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text('${'product_count'.tr()} : ${state.value.length}',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppConst.kThirdTextColor,
                                )),
                          ),
                          Gap(16.h),
                          Expanded(
                            child: ListView.separated(
                              separatorBuilder: (context, index) => Gap(24.h),
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              itemCount: state.value.length,
                              itemBuilder: (context, index) {
                                final dish = state.value[index];
                                return ProductCard(
                                  item: dish,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
