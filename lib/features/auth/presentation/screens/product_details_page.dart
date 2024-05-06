
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:pro_bread_app/core/resources/assets.gen.dart';
import 'package:pro_bread_app/core/utils/utils.dart';
import 'package:pro_bread_app/features/auth/presentation/screens/delivered_page.dart';
import 'package:pro_bread_app/features/auth/presentation/screens/products_page.dart';
import 'package:pro_bread_app/shared/custom_txt_bottom.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../shared/show_dialog.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kBorderBoxColor,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const SliverAppBar(
              title: Text('تفاصيل المنتج'),
              backgroundColor: AppConst.kPrimaryColor,
              pinned: true,
              floating: true,
              snap: true,
              expandedHeight: 240,
              flexibleSpace: FlexibleSpaceBar(
                background: Image(
                  image: AssetImage('assets/images/png/cake 01.png'),
                  fit: BoxFit.fill,
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
                  alignment: Alignment.centerRight,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Gap(16),
                      Text(
                        'براوني كيك ',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppConst.kScondaryTextColor),
                      ),
                      Gap(8),
                      Text(
                        'قطعة براونيز نوتيلا مغطاه بالنوتيلا ',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                      ),
                      Gap(8),
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
                    child: const Row(
                      children: [
                        Text(
                          '225',
                          style:
                              TextStyle(color: AppConst.kScondaryTextColor, fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          'السعر',
                          style:
                              TextStyle(color: AppConst.kScondaryTextColor, fontWeight: FontWeight.bold, fontSize: 12),
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'المنتجات المتوفرة',
                          style:
                              TextStyle(color: AppConst.kScondaryTextColor, fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 300.h,
                          width: double.infinity,
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                height: 80.h,
                                width: 85.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: AppConst.kPrimaryColor,
                                ),
                                child: ListTile(
                                  leading: SvgPicture.asset('assets/images/svg/select_icon.svg'),
                                  title: const Text(' كيكة ليمون بلوبيري '),

                                  onTap: () {},

                                  // subtitle: Text('السعر'),
                                ),
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'الاضافات',
                          style:
                              TextStyle(color: AppConst.kScondaryTextColor, fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 300.h,
                          width: double.infinity,
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                height: 80.h,
                                width: 85.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: AppConst.kPrimaryColor,
                                ),
                                child: ListTile(
                                  leading: SvgPicture.asset('assets/images/svg/plus_icon.svg'),
                                  title: const Text('عدد المنتجات '),
                                  // subtitle: Text('السعر'),
                                ),
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 80.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: AppConst.kPrimaryColor,
                              ),
                              child: ListTile(
                                leading: SvgPicture.asset('assets/images/svg/plus_icon.svg'),
                                title: const Text('عدد المنتجات '),
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              'الكمية',
                              style: TextStyle(
                                  color: AppConst.kScondaryTextColor, fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Gap(16),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: SvgPicture.asset('assets/images/svg/empty_heart_icon01.svg'),
                            ),
                            const Spacer(),
                            CustomButton(
                              onTap: () {
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
                                              const Text(
                                                'تم إضافة المنتج الى السلة بنجاح',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppConst.kScondaryTextColor),
                                              ),
                                              Gap(24.h),

                                              CustomButton(
                                                  btnTitle: 'اذهب للسلة ',
                                                  onTap: () {
                                                    Utils.openScreen(context, const DeliveredPage(), replacment: true);
                                                  }),
                                              Gap(24.h),
                                              GestureDetector(
                                                child: const Text(
                                                  'تابع التسوق',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold,
                                                      color: AppConst.kBorderButtonColor),
                                                ),
                                                onTap: () {
                                                  Utils.openScreen(context, const ProductsPage(), replacment: true);
                                                },
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );

                                // Alerts.dialog(
                                //   context,
                                //   child: Column(
                                //     children: [
                                //       Container(
                                //         height: 100,
                                //         width: 300,
                                //         decoration: BoxDecoration(
                                //           borderRadius: BorderRadius.circular(8.0),
                                //           color: AppConst.kPrimaryColor,
                                //         ),
                                //         alignment: Alignment.center,
                                //         padding: const EdgeInsets.all(16.0),
                                //         child: const Text('تم اضافة المنتج بنجاح'),
                                //       ),
                                //       const Gap(16),
                                //       CustomButton(
                                //         onTap: () {
                                //           Utils.openScreen(context, const AccountInfoPage(),replacment: true);
                                //         },
                                //         btnTitle: 'الذهاب للصفحة الشخصية',
                                //       )
                                //     ],
                                //   ),
                                // );
                              },
                              btnTitle: 'تأكيد',
                              btnColor: AppConst.kBorderButtonColor,
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
//                             style: TextStyle(
//                                 color: AppConst.kScondaryTextColor, fontWeight: FontWeight.bold, fontSize: 18),
//                           ),
//                           const Spacer(),
//                           const Text(
//                             ' 01 السعر',
//                             style: TextStyle(
//                                 color: AppConst.kScondaryTextColor, fontWeight: FontWeight.bold, fontSize: 12),
//                           ),
//                         ],
//                       ),
//                       Gap(16),
//                       Row(
//                         children = [
//                           const Text(
//                             '501',
//                             style: TextStyle(
//                                 color: AppConst.kScondaryTextColor, fontWeight: FontWeight.bold, fontSize: 18),
//                           ),
//                           const Spacer(),
//                           const Text(
//                             '02السعر',
//                             style: TextStyle(
//                                 color: AppConst.kScondaryTextColor, fontWeight: FontWeight.bold, fontSize: 12),
//                           ),
//                         ],
//                       ),
//                       Gap(16),
//                       Row(
//                         children = [
//                           const Text(
//                             '502',
//                             style: TextStyle(
//                                 color: AppConst.kScondaryTextColor, fontWeight: FontWeight.bold, fontSize: 18),
//                           ),
//                           const Spacer(),
//                           const Text(
//                             '03السعر',
//                             style: TextStyle(
//                                 color: AppConst.kScondaryTextColor, fontWeight: FontWeight.bold, fontSize: 12),
//                           ),
//                         ],
//                       ),