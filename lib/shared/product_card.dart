// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../features/auth/presentation/screens/product_details_page.dart';
import '../features/categories/domain/entities/get_dish_response.dart';
import '../features/favorites/presentation/controller/toggle_favorite/toggle_favorite_cubit.dart';
import 'text_widget.dart';
import '../core/const/constant_var.dart';
import '../core/utils/utils.dart';

class ProductCard extends StatefulWidget {
  ProductCard({
    super.key,
    this.addToCart = false,
    this.cartIcon = Icons.add_shopping_cart,
    required this.item,
  });

  bool addToCart = false;
  IconData? cartIcon;
  final Dish item;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  Widget build(BuildContext context) {
    // bool addToCart;
    return GestureDetector(
      onTap: () {
        final settings = RouteSettings(
          name: '/ProductDetailsPage',
          arguments: widget.item,
        );
        Utils.openScreen(
          context,
          const ProductDetailsPage(),
          settings: settings,
        );
      },
      child: Container(
        height: 150.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: AppConst.kPrimaryColor,
          boxShadow: const [
            BoxShadow(
              color: AppConst.kBottomBarColor,
              spreadRadius: .2,
              blurRadius: 12,
              offset: Offset(0, .1),
              // changes position of shadow
            ),
            BoxShadow(color: AppConst.kPrimaryColor, spreadRadius: 4.0)
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                widget.item.avatar,
                width: 95.w,
                height: 95.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    title: widget.item.name,
                    color: AppConst.kPrimaryTextColor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    // fontWeight: FontWeight.bold,
                  ),
                  Gap(12.h),
                  TextWidget(
                    title: widget.item.description,
                    color: AppConst.kThirdTextColor,
                    fontSize: 12.sp,
                    // fontWeight: FontWeight.bold,
                  ),
                  Expanded(child: SizedBox()),
                  TextWidget(
                    title: '${widget.item.price} ${'SAR'.tr()}',
                    color: AppConst.kScondaryTextColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              children: [
                // TODO: add BlocBuilder of ToggleFavoriteCubit
                BlocBuilder<ToggleFavoriteCubit, ToggleFavoriteState>(
                  builder: (context, state) {
                    if (state is ToggleFavoriteInitialState) {
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<ToggleFavoriteCubit>()
                              .fToggleFavorite(dishId: widget.item.id);
                        },
                        child: SvgPicture.asset(
                          'assets/images/svg/empty_heart_icon01.svg',
                          width: 25.w,
                          height: 25.h,
                        ),
                      );
                    }
                    if (state is ToggleFavoriteSuccessState) {
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<ToggleFavoriteCubit>()
                              .fToggleFavorite(dishId: widget.item.id);
                        },
                        child: SvgPicture.asset(
                          'assets/images/svg/full_heart_icon01.svg',
                          width: 25.w,
                          height: 25.h,
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
                Gap(12.h),
              ],
            ),
          ],
        ),

        // child: Row(
        //   children: [
        //     Expanded(
        //       child: Column(
        //         children: [
        //           Row(
        //             children: [
        //               Padding(
        //                 padding: const EdgeInsets.only(right: 8.0),
        //                 child: Image.network(
        //                   width: 50,
        //                   height: 50,
        //                   widget.item.avatar,
        //                 ),
        //                 // SvgPicture.asset(
        //                 //     'assets/images/svg/empty_heart_icon01.svg'),
        //               ),
        //               Expanded(
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.end,
        //                   children: [
        //                     TextWidget(
        //                       title: widget.item.name,
        //                       color: AppConst.kPrimaryTextColor,
        //                       fontSize: 12.sp,
        //                       // fontWeight: FontWeight.bold,
        //                     ),
        //                     Gap(12.h),
        //                     TextWidget(
        //                       title: widget.item.description,
        //                       color: AppConst.kThirdTextColor,
        //                       fontSize: 12.sp,
        //                       // fontWeight: FontWeight.bold,
        //                     ),
        //                     Gap(12.h),
        //                   ],
        //                 ),
        //               ),
        //             ],
        //           ),
        //           Row(
        //             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               if (addToCart = true)
        //                 const TextWidget(
        //                   title: 'أضف إلى العربة',
        //                   color: AppConst.kBorderButtonColor,
        //                 ),
        //               Gap(4.w),
        //               if (widget.cartIcon != null)
        //                 SvgPicture.asset('assets/images/svg/cart_icon.svg',
        //                 width: 20,height: 20,),
        //               Gap(16.w),
        //               TextWidget(
        //                 title: widget.item.price,
        //                 color: AppConst.kScondaryTextColor,
        //                 fontSize: 14.sp,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ],
        //           ),
        //         ],
        //       ),
        //     ),
        //     SizedBox(width: 8.w),
        //     Padding(
        //       padding:
        //           const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 16.0),
        //       child: Image.network(
        //         width: 50,
        //         height: 50,
        //         widget.item.avatar,
        //         fit: BoxFit.fill,
        //         errorBuilder: (context, error, stackTrace) {
        //           return const SizedBox();
        //         },
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
