import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart' as DatePickerTheme;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/utils/utils.dart';
import '../../../../shared/custom_app_bar.dart';
import '../../../../shared/custom_stepper_widget.dart';
import '../../../../shared/text_button.dart';
import 'payment_page.dart';

class DeliveryTimePage extends StatefulWidget {
  const DeliveryTimePage({
    super.key,
  });

  @override
  State<DeliveryTimePage> createState() => _DeliveryTimePageState();
}

class _DeliveryTimePageState extends State<DeliveryTimePage> {
  // final DateTime _selectedDateTime = DateTime.now();

  // void _pickDateTime() {
  //   DatePicker.showDateTimePicker(
  //     context,
  //     showTitleActions: true,
  //     onChanged: (date) {
  //       print('change $date');
  //     },
  //     onConfirm: (date) {
  //       setState(() {
  //         _selectedDateTime = date;
  //       });
  //     },
  //     currentTime: DateTime.now(),
  //     locale: LocaleType.ar,
  //   );
  // }

  bool isSelected = false;
  //  bool isSelectedBorder;
  bool isSelect = false;

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
          padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 32.h, bottom: 32.h),
          child: Column(
            children: [
              const Row(
                children: [
                  CustomStepper(stepperColor: AppConst.kSecondaryStepperColor),
                  CustomStepper(stepperColor: AppConst.kSecondaryStepperColor),
                  CustomStepper(),
                  CustomStepper(),
                ],
              ),
              Gap(32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/images/svg/deliveryTime_icon.svg'),
                  Gap(8.w),
                  Text(
                    'delivery_time'.tr(),
                    style:
                        const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
                  ),
                ],
              ),
              Gap(24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        toggleSelected();
                      });
                    },
                    child: SvgPicture.asset(
                      isSelected ? 'assets/images/svg/select_icon.svg' : 'assets/images/svg/un select_icon.svg',
                    ),
                  ),
                  Gap(4.w),
                  Text(
                    'in_45_minutes'.tr(),
                    style:
                        const TextStyle(color: AppConst.kPrimaryTextColor, fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
              Gap(24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        toggleSelect();
                      });
                    },
                    child: SvgPicture.asset(
                      isSelect ? 'assets/images/svg/select_icon.svg' : 'assets/images/svg/un select_icon.svg',
                    ),
                  ),
                  Gap(4.w),
                  Text(
                    'choose_another_time'.tr(),
                    style:
                        const TextStyle(color: AppConst.kPrimaryTextColor, fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
              Gap(32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'select_day'.tr(),
                    style: const TextStyle(color: AppConst.kThirdTextColor, fontSize: 12),
                  ),
                ],
              ),
              Gap(24.h),
              SizedBox(
                height: 80.h,
                width: double.infinity,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return
                        // Container(
                        //   padding: const EdgeInsets.all(20.0),
                        //   decoration: BoxDecoration(
                        //     border: Border.all(color: Colors.blueAccent),
                        //     borderRadius: BorderRadius.circular(10.0),
                        //   ),
                        //   child: Text(
                        //     '${'${_selectedDateTime.toLocal()}'.split(' ')[0]} ${_selectedDateTime.month}:${_selectedDateTime.day}',
                        //     style: const TextStyle(fontSize: 20.0),
                        //   ),
                        // );
                        // // SizedBox(height: 20.0);
                        // ElevatedButton(
                        //   onPressed: _pickDateTime,
                        //   child: const Text('Pick Date & Time'),
                        // );

                        Container(
                      width: 64.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        // border: isSelectedBorder ? Border.all(color: AppConst.kBorderButtonColor, width: 2.0) : null,
                        color: AppConst.kBorderBoxColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'today'.tr(),
                              style: const TextStyle(color: AppConst.kThirdTextColor, fontSize: 12),
                            ),
                            Gap(16.h),
                            const Text(
                              '25 jan',
                              style: TextStyle(
                                  color: AppConst.kPrimaryTextColor, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Gap(8.w),
                ),
              ),
              Gap(32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'select_time'.tr(),
                    style: const TextStyle(color: AppConst.kThirdTextColor, fontSize: 12),
                  ),
                ],
              ),
              Gap(24.h),
              SizedBox(
                height: 40.h,
                width: double.infinity,
                child: ListView.separated(
                  separatorBuilder: (context, index) => Gap(8.w),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(8.h),
                      width: 80.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: AppConst.kBorderBoxColor,
                      ),
                      child: const Center(
                        child: Text(
                          ' 05:00 ',
                          style:
                              TextStyle(color: AppConst.kPrimaryTextColor, fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Gap(100.h),
              CustomTextButton(
                icon: Icons.arrow_forward,
                onTap: () {
                  Utils.openScreen(
                    context,
                    PaymentPage(),
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
