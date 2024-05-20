import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/resources/assets.gen.dart';
import '../../../../core/utils/app_snack_bar.dart';
import '../../../auth/presentation/screens/products_page.dart';
import '../../../../shared/custom_text_field.dart';
import '../../../../core/utils/utils.dart';
import '../../../auth/presentation/screens/search_page.dart';
import '../../../categories/presentation/controller/get_categories/get_categories_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<GetCategoriesCubit>().fGetCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kPrimaryColor,
      // appBar: CustomAppBar.build(context,
      //     titleText: ' الرئيسية',
      //     backgroundColor: AppConst.kPrimaryColor,
      //     iconAppBar: SvgPicture.asset('assets/images/svg/cart_icon.svg')),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: .4.sh,
                  width: double.infinity.w,
                  child: Stack(
                    children: [
                      Assets.images.png.bekery.image(fit: BoxFit.fill),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Gap(32),
                            Text(
                              textAlign: TextAlign.center,
                              'surprise_your_loved_one'.tr(),
                              style: const TextStyle(
                                  color: AppConst.kScondaryTextColor, fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const Gap(32),
                            CustomTxtField(
                              borderColor: AppConst.kPrimaryColor,
                              filled: true,
                              fillColor: AppConst.kPrimaryColor,
                              hintTxt: 'what_are_you_looking_for'.tr(),
                              readOnly: true,
                              onTap: () {
                                Utils.openScreen(context, const SearchPage());
                              },
                              iconButton02: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SvgPicture.asset(
                                  'assets/images/svg/search_icon.svg',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: .009.sh, bottom: .010.sh),
                  child: CarouselSlider(
                    //  carouselController: viewModel.carouselController,
                    options: CarouselOptions(
                      height: 160.h,
                      onPageChanged: (index, reason) {
                        //  viewModel.updateIndex(index);
                      },
                    ),
                    items: [1, 2, 3, 4, 5].map((sliderItem) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration:
                                BoxDecoration(color: AppConst.kPrimaryColor, borderRadius: BorderRadius.circular(8.0)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Assets.images.png.food00.image(fit: BoxFit.fill),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: {1, 2, 3}.map<Widget>((entry) {
                    return Container(
                      width: 8.w,
                      height: 8.h,
                      margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 4.w),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppConst.kBorderButtonColor,

                        //  getColor(viewModel.homeModel!.data!.sliders!.indexOf(entry), viewModel.currentPage),
                      ),
                    );
                  }).toList(),
                ),
                Gap(.009.sh),
                Row(
                  children: [
                    Text(
                      'products'.tr(),
                      style:
                          const TextStyle(color: AppConst.kPrimaryTextColor, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Utils.openScreen(
                          context,
                          const ProductsPage(),
                        );
                      },
                      child: Text(
                        'show_all'.tr(),
                        style: const TextStyle(color: AppConst.kBorderButtonColor, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                Gap(16.h),
                BlocConsumer<GetCategoriesCubit, GetCategoriesState>(
                  listener: (BuildContext context, GetCategoriesState state) {
                    if (state is GetCategoriesErrorState) {
                      showAppSnackBar(context: context, message: state.message, type: ToastType.error);
                    }
                  },
                  builder: (BuildContext context, GetCategoriesState state) {
                    if (state is GetCategoriesLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is GetCategoriesSuccessState) {
                      return SizedBox(
                        height: 250.h,
                        width: double.infinity.w,
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.value.length,
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, mainAxisSpacing: 16.0, crossAxisSpacing: 16.0),
                          itemBuilder: (context, index) {
                            final category = state.value[index];
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: AppConst.kPrimaryTextColor,
                              ),
                              child: Image.network(category.avatar),
                            );
                          },
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Color getColor(int entry, int currentPage) {
  //   if (entry == currentPage) {
  //     return Colors.red;
  //   } else {
  //     return Colors.grey;
  //   }
  // }
}
