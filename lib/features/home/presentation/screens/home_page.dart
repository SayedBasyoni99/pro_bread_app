import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/resources/assets.gen.dart';
import '../../../../shared/custom_app_bar.dart';
import '../../../auth/presentation/screens/products_page.dart';
import '../../../../shared/custom_text_field.dart';
import '../../../../core/utils/utils.dart';
import '../../../auth/presentation/screens/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kPrimaryColor,
      appBar: CustomAppBar.build(context,
          titleText: ' الرئيسية',
          backgroundColor: AppConst.kPrimaryColor,
          iconAppBar: SvgPicture.asset('assets/images/svg/cart_icon.svg')),
      body: ListView(physics: const BouncingScrollPhysics(), children: [
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
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Gap(32),
                          const Text(
                            'فاجئ من تحب بهدية فاخرة',
                            style: TextStyle(
                                color: AppConst.kScondaryTextColor, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Gap(32),
                          CustomTxtField(
                            borderColor: AppConst.kPrimaryColor,
                            filled: true,
                            fillColor: AppConst.kPrimaryColor,
                            hintTxt: 'عن ماذا تبحث؟',
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
                  InkWell(
                    onTap: () {
                      Utils.openScreen(
                        context,
                        const ProductsPage(),
                        
                      );
                    },
                    child: const Text(
                      'عرض الكل ',
                      style: TextStyle(color: AppConst.kBorderButtonColor, fontSize: 12),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'المنتجات',
                    style: TextStyle(color: AppConst.kPrimaryTextColor, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Gap(16.h),
              BlocConsumer(builder: 
              if(state is GetProductsLoadingState)
              const Center(child: CircularProgressIndicator()),

              
              
              , listener: 
              (context, state) {
                if(state is GetProductsErrorState){
                  show
                  
                }
              })
            ],
          ),
        ),
      ]),
    );
  }

  Color getColor(int entry, int currentPage) {
    if (entry == currentPage) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }
}
