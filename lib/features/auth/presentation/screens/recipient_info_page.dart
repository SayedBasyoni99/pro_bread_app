import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'con_recipient_info_page.dart';
import '../../../../shared/custom_stepper_widget.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/utils/utils.dart';
import '../../../../shared/custom_app_bar.dart';
import '../../../../shared/custom_input_field.dart';
import '../../../../shared/text_button.dart';

class RecipientInfoPage extends StatelessWidget {
  RecipientInfoPage({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.build(
        context,
        titleText: 'proceed_to_checkout'.tr(),
        iconAppBar: SvgPicture.asset(
          'assets/images/svg/cart_icon.svg',
          height: 20,
          width: 20,
        ),
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
                  CustomStepper(),
                  CustomStepper(),
                  CustomStepper(),
                  CustomStepper(),
                ]),
                Gap(32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'recipient_information'.tr(),
                      style:
                          const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
                    ),
                    const Gap(16),
                    SvgPicture.asset('assets/images/svg/gift_icon.svg'),
                  ],
                ),
                Gap(32.h),
                Text(
                  'recipient_name'.tr(),
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                ),
                const Gap(16),
                CustomInputField(
                  controller: nameController,
                  validator: (p0) {
                    if (p0?.trim().isEmpty == true) {
                      return 'required'.tr();
                    }
                    return null;
                  },
                  hint: 'elsayed_gaber'.tr(),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      'assets/images/svg/person.svg',
                    ),
                  ),
                ),
                const Gap(32),
                Text(
                  'mobile_number'.tr(),
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                ),
                const Gap(16),
                CustomInputField(
                  controller: numberController,
                  validator: (p0) {
                    if (p0?.trim().isEmpty == true) {
                      return 'required'.tr();
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  hint: 'enter_mobile_number'.tr(),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      'assets/images/svg/phone_icon.svg',
                    ),
                  ),
                ),
                const Gap(32),
                Text(
                  'send_note'.tr(),
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                ),
                const Gap(16),
                CustomInputField(
                  hint: 'write_note'.tr(),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      'assets/images/svg/note_icon.svg',
                    ),
                  ),
                ),
                Gap(60.h),
                CustomTextButton(
                  icon: Icons.arrow_forward,
                  onTap: () {
                    if (formKey.currentState?.validate() == true) {
                      Utils.openScreen(
                        context, ConRecipientInfoPage(),
                        // replacment: true
                      );
                    }
                  },
                  title: 'next'.tr(),
                  fontSize: 18.sp,
                ),
                Gap(20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
