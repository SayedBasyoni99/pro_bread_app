import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/utils/utils.dart';
import '../../../../shared/custom_app_bar.dart';
import '../../../../shared/custom_input_field.dart';
import '../../../../shared/custom_stepper_widget.dart';
import '../../../../shared/text_button.dart';
import 'delivery_time_page.dart';

class ConRecipientInfoPage extends StatelessWidget {
  ConRecipientInfoPage({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final areaController = TextEditingController();
  final streetController = TextEditingController();
  final buildController = TextEditingController();
  final landNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.build(
        context,
        titleText: 'proceed_to_checkout'.tr(),
        // removeBack: false,
        actions: [],
      ),
      backgroundColor: AppConst.kPrimaryColor,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(children: [
                  CustomStepper(stepperColor: AppConst.kSecondaryStepperColor),
                  CustomStepper(),
                  CustomStepper(),
                  CustomStepper(),
                ]),
                Gap(32.h),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SvgPicture.asset('assets/images/svg/map_icon.svg'),
                  Gap(8.w),
                  Text(
                    'recipient_address'.tr(),
                    style:
                        const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
                  ),
                ]),
                Gap(32.h),
                Text(
                  'area'.tr(),
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
                ),
                Gap(4.h),
                CustomInputField(
                  controller: areaController,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'required'.tr();
                    }
                    return null;
                  },
                  hint: 'mansoura'.tr(),
                ),
                Gap(32.h),
                Text(
                  'street'.tr(),
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
                ),
                Gap(4.h),
                CustomInputField(
                  controller: streetController,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'required'.tr();
                    }
                    return null;
                  },
                  hint: 'jahan_street'.tr(),
                ),
                Gap(32.h),
                Text(
                  'building_name_or_number'.tr(),
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
                ),
                Gap(4.h),
                CustomInputField(
                  controller: buildController,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'required'.tr();
                    }
                    return null;
                  },
                  hint: '50',
                ),
                Gap(32.h),
                Text(
                  'landmark'.tr(),
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
                ),
                Gap(4.h),
                CustomInputField(
                  controller: landNameController,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'required'.tr();
                    }
                    return null;
                  },
                  hint: 'mansoura'.tr(),
                ),
                Gap(60.h),
                CustomTextButton(
                  icon: Icons.arrow_forward,
                  onTap: () {
                    if (formKey.currentState!.validate() == true) {
                      Utils.openScreen(
                        context,
                        const DeliveryTimePage(),
                      );
                    }
                  },
                  title: 'next'.tr(),
                  fontSize: 18.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
