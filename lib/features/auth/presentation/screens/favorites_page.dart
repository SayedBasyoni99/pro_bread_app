import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../shared/product_card.dart';

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
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          return ProductCard();
                        },
                        itemCount: 10,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics()),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
