import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/utils/app_snack_bar.dart';
import '../../../../shared/custom_app_bar.dart';
import '../../../categories/presentation/controller/get_dishes/get_dishes_cubit.dart';
import '../../../../shared/product_card.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/utils/utils.dart';
import '../../../../shared/custom_card.dart';
import '../../../../shared/text_widget.dart';
import 'product_details_page.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    super.initState();
    context.read<GetDishesCubit>().fGetDishes();
  }

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
                          Utils.openScreen(
                            context,
                            const ProductDetailsPage(),
                          );
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
            BlocConsumer<GetDishesCubit, GetDishesState>(
              listener: (BuildContext context, GetDishesState state) {
                if (state is GetDishesErrorState) {
                  showAppSnackBar(
                      context: context,
                      message: state.message,
                      type: ToastType.error);
                }
              },
              builder: (BuildContext context, GetDishesState state) {
                if (state is GetDishesLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is GetDishesSuccessState) {
                  return SizedBox(
                    child: SingleChildScrollView(
                      child: ListView.builder(
                          itemBuilder: (context, index) {
                            final product = state.value[index];
                            return ProductCard(
                              productDescription: product.description,
                              productName: product.name,
                              productPrice: product.price,
                              productImage: product.avatar,
                            );

                            // ProductCard();
                          },
                          itemCount: state.value.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics()),
                    ),
                  );
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
