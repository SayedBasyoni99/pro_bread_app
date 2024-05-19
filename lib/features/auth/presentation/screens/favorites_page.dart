import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/utils/app_snack_bar.dart';
import '../../../../shared/product_card.dart';
import '../../../categories/presentation/controller/get_dishes/get_dishes_cubit.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConst.kPrimaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                const Gap(32),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'عدد المنتجات',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppConst.kThirdTextColor),
                    ),
                  ],
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: BlocConsumer<GetDishesCubit, GetDishesState>(
                      listener: (BuildContext context, GetDishesState state) {
                        if (state is GetDishesErrorState) {
                          showAppSnackBar(
                              context: context,
                              message: state.message,
                              type: ToastType.error);
                        }
                      },
                      builder: (context, state) {
                        if (state is GetDishesLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is GetDishesSuccessState) {
                          return ListView.builder(
                              itemBuilder: (context, index) {
                                final product = state.value[index];
                                return ProductCard(
                                  productDescription: product.description,
                                  productName: product.name,
                                  productPrice: product.price,
                                  productImage: product.avatar,
                                );
                              },
                              itemCount: 10,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics());
                        }

                        return const SizedBox();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
