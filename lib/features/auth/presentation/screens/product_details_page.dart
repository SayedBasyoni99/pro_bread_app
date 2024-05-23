import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/resources/assets.gen.dart';
import '../../../../core/utils/utils.dart';
import '../../../categories/domain/entities/get_dish_response.dart';
import '../../../favorites/presentation/controller/toggle_favorite/toggle_favorite_cubit.dart';
import '../../../home/presentation/screens/main_page.dart';
import 'cart_page.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../shared/custom_txt_bottom.dart';
import '../../../../shared/show_dialog.dart';
import 'products_page.dart';

class ProductDetailsPage extends StatefulWidget {
  final Dish dish;

  const ProductDetailsPage({
    required this.dish,
    super.key,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
//  void initState() {
//     super.initState();
//     context.read<GetDishCubit>().fGetDish(id: 1);
//   }
  int _counterX = 1;
  int _counterY = 0;
  bool isSelected = false;

  void toggleSelected() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kBorderBoxColor,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text('product_details'.tr()),
              backgroundColor: AppConst.kPrimaryColor,
              pinned: true,
              floating: false,
              snap: false,
              expandedHeight: 240,
              flexibleSpace: FlexibleSpaceBar(
                background: Image(
                  image: Image.network(widget.dish.avatar ?? '').image,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  color: AppConst.kPrimaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(16),
                      Text(
                        widget.dish.name ?? 'براوني كيك ',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold, color: AppConst.kScondaryTextColor),
                      ),
                      const Gap(8),
                      Text(
                        widget.dish.description ?? 'قطعة براونيز نوتيلا مغطاه بالنوتيلا ',
                        style:
                            const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                      ),
                      const Gap(8),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: SizedBox(
          height: 55.h,
          width: 120.w,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    height: 80.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: AppConst.kPrimaryColor,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'price'.tr(),
                          style: const TextStyle(
                              color: AppConst.kScondaryTextColor, fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        const Spacer(),
                        Text(
                          '${widget.dish.price} ${'SAR'.tr()}',
                          style: const TextStyle(
                              color: AppConst.kScondaryTextColor, fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  const Gap(16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: AppConst.kPrimaryColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'available_products'.tr(),
                          style: const TextStyle(
                              color: AppConst.kScondaryTextColor, fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 300.h,
                          width: double.infinity,
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      // height: 80.h,
                                      // width: 200.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.0),
                                        color: AppConst.kPrimaryColor,
                                      ),
                                      child: ListTile(
                                        leading: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              toggleSelected();
                                            });
                                          },
                                          child: SvgPicture.asset(
                                            isSelected
                                                ? 'assets/images/svg/select_icon.svg'
                                                : 'assets/images/svg/un select_icon.svg',
                                          ),
                                        ),
                                        title: Text(widget.dish.name ?? ' كيكة ليمون بلوبيري '),

                                        // onTap: () {},

                                        // subtitle: Text('السعر'),
                                      ),
                                    ),
                                  ),
                                  // const Spacer(),
                                  Text(
                                    '${widget.dish.price} ${'SAR'.tr()}',
                                    style: const TextStyle(
                                        color: AppConst.kScondaryTextColor, fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(thickness: .09, color: AppConst.kScondaryTextColor);
                            },
                            itemCount: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: AppConst.kPrimaryColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'addons'.tr(),
                          style: const TextStyle(
                              color: AppConst.kScondaryTextColor, fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 300.h,
                          width: double.infinity,
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 80.h,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: AppConst.kPrimaryColor,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                            child: SvgPicture.asset('assets/images/svg/plus_icon.svg'),
                                            onTap: () {
                                              setState(() {
                                                if (_counterY < 10) {
                                                  _counterY++;
                                                }
                                              });
                                            }),
                                        Gap(12.w),
                                        Text('$_counterY'),
                                        Gap(12.w),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (_counterY > 0) {
                                                  _counterY--;
                                                }
                                              });
                                            },
                                            child: SvgPicture.asset('assets/images/svg/minus_icon.svg')),
                                        Gap(12.w),
                                      ],
                                    ),
                                  ),
                                  Text(widget.dish.name ?? ' كيكة ليمون بلوبيري '),
                                  const Spacer(),
                                  Text(
                                    '${widget.dish.price} ${'SAR'.tr()}',
                                    style: const TextStyle(
                                        color: AppConst.kScondaryTextColor, fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(thickness: .09, color: AppConst.kScondaryTextColor);
                            },
                            itemCount: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: AppConst.kPrimaryColor,
                    ),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'quantity'.tr(),
                              style: const TextStyle(
                                  color: AppConst.kScondaryTextColor, fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Container(
                              height: 80.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: AppConst.kPrimaryColor,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                      child: SvgPicture.asset('assets/images/svg/plus_icon.svg'),
                                      onTap: () {
                                        setState(() {
                                          if (_counterX < 10) {
                                            _counterX++;
                                          }
                                        });
                                      }),
                                  Gap(12.w),
                                  Text('$_counterX'),
                                  Gap(12.w),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (_counterX > 1) {
                                            _counterX--;
                                          }
                                        });
                                      },
                                      child: SvgPicture.asset('assets/images/svg/minus_icon.svg')),
                                  Gap(12.w),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Gap(16),
                        Row(
                          children: [
                            Column(
                              children: [
                                // TODO: add BlocBuilder of ToggleFavoriteCubit
                                BlocBuilder<ToggleFavoriteCubit, ToggleFavoriteState>(
                                  buildWhen: (_, current) => current.dishId == widget.dish.id,
                                  builder: (context, state) {
                                    if (state is ToggleFavoriteSuccessState) {
                                      bool isFav = state.isFavorite;
                                      if (state.dishId != widget.dish.id) {
                                        if (context.read<ToggleFavoriteCubit>().favorites[widget.dish.id] != null) {
                                          isFav =
                                              context.read<ToggleFavoriteCubit>().favorites[widget.dish.id] ?? false;
                                        }
                                        isFav = widget.dish.isFav;
                                      }
                                      return GestureDetector(
                                        onTap: () {
                                          context.read<ToggleFavoriteCubit>().fToggleFavorite(dishId: widget.dish.id);
                                        },
                                        child: SvgPicture.asset(
                                          isFav
                                              ? 'assets/images/svg/full_heart_icon01.svg'
                                              : 'assets/images/svg/empty_heart_icon01.svg',
                                          width: 56.w,
                                          height: 56.h,
                                        ),
                                      );
                                    }
                                    if (state is ToggleFavoriteInitialState) {
                                      return GestureDetector(
                                        onTap: () {
                                          context.read<ToggleFavoriteCubit>().fToggleFavorite(dishId: widget.dish.id);
                                        },
                                        child: SvgPicture.asset(
                                          widget.dish.isFav
                                              ? 'assets/images/svg/full_heart_icon01.svg'
                                              : 'assets/images/svg/empty_heart_icon01.svg',
                                          width: 56.w,
                                          height: 56.h,
                                        ),
                                      );
                                    }
                                    return GestureDetector(
                                      onTap: () {
                                        context.read<ToggleFavoriteCubit>().fToggleFavorite(dishId: widget.dish.id);
                                      },
                                      child: SvgPicture.asset(
                                        'assets/images/svg/empty_heart_icon01.svg',
                                        width: 56.w,
                                        height: 56.h,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            Gap(8.w),
                            Expanded(
                              child: CustomButton(
                                onTap: () {
                                  // showAppDialog(
                                  //   context: context,
                                  //   child: Wrap(
                                  //     children: [
                                  //       Expanded(
                                  //         child: Image.asset(
                                  //             'assets/images/png/successfullOrderBg.png'),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // );

                                  showAppDialog(
                                    context: context,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16.r),
                                        color: AppConst.kPrimaryColor,
                                      ),
                                      child: Wrap(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 32.w),
                                            child: Column(
                                              children: [
                                                Assets.images.png.food01.image(),

                                                Gap(16.h),
                                                // SvgPicture.asset('assets/images/svg/heart_icon.svg'),
                                                Text(
                                                  textAlign: TextAlign.center,
                                                  'product_added_to_cart_successfully'.tr(),
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                      color: AppConst.kScondaryTextColor),
                                                ),
                                                Gap(24.h),

                                                CustomButton(
                                                    btnTitle: 'go_to_cart'.tr(),
                                                    onTap: () {
                                                      Utils.openScreen(
                                                        context,
                                                        const CartPage(),
                                                        replacment: true,
                                                      );
                                                    }),
                                                Gap(24.h),
                                                GestureDetector(
                                                  child: Text(
                                                    'continue_shopping'.tr(),
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold,
                                                        color: AppConst.kBorderButtonColor),
                                                  ),
                                                  onTap: () {
                                                    Utils.openScreen(context, const MainPage(), remove: true);
                                                  },
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                btnTitle: 'add_to_cart'.tr(),
                                btnColor: AppConst.kBorderButtonColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Row(
//                         children = [
//                           const Text(
//                             '500',
//                             style: const TextStyle(
//                                 color: AppConst.kScondaryTextColor, fontWeight: FontWeight.bold, fontSize: 18),
//                           ),
//                           const Spacer(),
//                           const Text(
//                             ' 01 السعر',
//                             style: const TextStyle(
//                                 color: AppConst.kScondaryTextColor, fontWeight: FontWeight.bold, fontSize: 12),
//                           ),
//                         ],
//                       ),
//                       Gap(16),
//                       Row(
//                         children = [
//                           const Text(
//                             '501',
//                             style: const TextStyle(
//                                 color: AppConst.kScondaryTextColor, fontWeight: FontWeight.bold, fontSize: 18),
//                           ),
//                           const Spacer(),
//                           const Text(
//                             '02السعر',
//                             style: const TextStyle(
//                                 color: AppConst.kScondaryTextColor, fontWeight: FontWeight.bold, fontSize: 12),
//                           ),
//                         ],
//                       ),
//                       Gap(16),
//                       Row(
//                         children = [
//                           const Text(
//                             '502',
//                             style: const TextStyle(
//                                 color: AppConst.kScondaryTextColor, fontWeight: FontWeight.bold, fontSize: 18),
//                           ),
//                           const Spacer(),
//                           const Text(
//                             '03السعر',
//                             style: const TextStyle(
//                                 color: AppConst.kScondaryTextColor, fontWeight: FontWeight.bold, fontSize: 12),
//                           ),
//                         ],
//                       ),
