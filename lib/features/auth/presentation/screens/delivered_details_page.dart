import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/utils/utils.dart';
import '../../../../shared/custom_app_bar.dart';
import '../../../../shared/custom_details_container.dart';
import '../../../../shared/text_button.dart';
import 'choose_location_page.dart';

class DeliveredDetailsPage extends StatefulWidget {
  const DeliveredDetailsPage({super.key});

  @override
  State<DeliveredDetailsPage> createState() => _DeliveredDetailsPageState();
}

class _DeliveredDetailsPageState extends State<DeliveredDetailsPage> {
  bool isSelected = false;
  bool isSelect = true;

  void toggleSelected() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  void toggleSelect() {
    setState(() {
      isSelect = !isSelect;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kPrimaryColor,
      appBar: CustomAppBar.build(
        context,
        titleText: 'proceed_to_checkout'.tr(),
        iconAppBar: SvgPicture.asset(
          'assets/images/svg/cart_icon.svg',
          height: 20,
          width: 20,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, Routes.productDetailsRoute);
                  },
                  child: CustomDetailsContainer(
                    // picInfo: 'arrowBack_icon',
                    message01: 'shipping_details'.tr(),
                    message02: 'mansoura'.tr(),
                    message03: 'gift_services_description'.tr(),
                    message04: '+966 565 9999 00',
                  ),
                ),
              ),
              Gap(16.h),
              Container(
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
                // padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16.w, top: 16.h),
                      child: Text('pickup'.tr(),
                          style: TextStyle(
                              color: AppConst.kBorderButtonColor, fontSize: 14.sp, fontWeight: FontWeight.bold)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
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
                            title: Text(
                              'store_pickup'.tr(),
                              style: const TextStyle(color: AppConst.kPrimaryTextColor, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: AppConst.kPrimaryColor,
                          ),
                          child: ListTile(
                            leading: GestureDetector(
                              onTap: () {
                                setState(() {
                                  toggleSelect();
                                });
                              },
                              child: SvgPicture.asset(
                                isSelect ? 'assets/images/svg/select_icon.svg' : 'assets/images/svg/un select_icon.svg',
                              ),
                            ),
                            title: Text(
                              'home_delivery'.tr(),
                              style: const TextStyle(color: AppConst.kPrimaryTextColor, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Gap(60.h),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 52.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: AppConst.kScondaryTextColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                          child: Text(
                            'send_as_gift'.tr(),
                            style:
                                TextStyle(color: AppConst.kPrimaryColor, fontSize: 14.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Gap(8.w),
                      ],
                    ),
                  ),
                  Positioned.directional(
                    bottom: 0,
                    end: 20.w,
                    textDirection: Directionality.of(context),
                    child: SvgPicture.asset('assets/images/svg/sendGif_icon.svg'),
                  ),
                ],
              ),
              Gap(50.h),
              CustomTextButton(
                icon: Icons.arrow_forward,
                onTap: () {
                  Utils.openScreen(
                    context,
                    const ChooseLocationPage(),
                  );
                },
                title: 'next'.tr(),
                fontSize: 18.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
