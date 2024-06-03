import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/utils/utils.dart';
import '../../../../shared/custom_input_field.dart';
import '../../../../shared/text_button.dart';
import '../../../home/presentation/screens/home_page.dart';
import '../controller/login/login_cubit.dart';

class AccountInfoPage extends StatelessWidget {
  const AccountInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kPrimaryColor,
      // appBar: CustomAppBar.build(
      //   context,
      //   titleText: 'معلومات  الحساب',
      //   iconAppBar: SvgPicture.asset(
      //     'assets/images/svg/cart_icon.svg',
      //     height: 20,
      //     width: 20,
      //   ),
      // ),
      // backgroundColor: AppConst.kPrimaryColor,
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          final user = context.read<LoginCubit>().data?.data;
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(60.h),
                      Text(
                        'name'.tr(),
                        style:
                            const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                      ),
                      const Gap(16),
                      CustomInputField(
                        hint: user?.name ?? 'Sayed Gaber',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            'assets/images/svg/person.svg',
                          ),
                        ),
                      ),
                      const Gap(32),
                      Text(
                        'email'.tr(),
                        style:
                            const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                      ),
                      const Gap(16),
                      CustomInputField(
                        hint: user?.email ?? 'elsayd.gaber99@example.com',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            'assets/images/svg/email.svg',
                          ),
                        ),
                      ),
                      const Gap(32),
                      Text(
                        'mobile_number'.tr(),
                        style:
                            const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                      ),
                      const Gap(16),
                      CustomInputField(
                        keyboardType: TextInputType.phone,
                        hint: 'enter_mobile_number'.tr(),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            'assets/images/svg/phone_icon.svg',
                          ),
                        ),
                      ),
                      Gap(80.h),
                      CustomTextButton(
                        onTap: () {
                          Utils.openScreen(context, const HomePage(), replacment: true);
                        },
                        title: 'save_changes'.tr(),
                        fontSize: 18.sp,
                      ),
                    ],
                  ),
                ),
                Gap(20.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
