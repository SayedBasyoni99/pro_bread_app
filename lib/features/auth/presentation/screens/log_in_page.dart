// ignore_for_file: must_be_immutable
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/resources/assets.gen.dart';
import '../../../../core/utils/app_snack_bar.dart';
import '../../../../core/utils/enums.dart';
import '../controller/auto_login/auto_login_cubit.dart';
import '../controller/login/login_cubit.dart';
import '../../../../shared/custom_input_field.dart';
import '../../../../shared/text_button.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AutoLoginCubit, AutoLoginState>(
      listener: (context, state) {
        if (state is AutoLoginSuccessState && state.userType == UserType.user) {
          Navigator.pushNamed(context, Routes.mainPageRoute);
        }
      },
      child: Scaffold(
        backgroundColor: AppConst.kPrimaryColor,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                children: [
                  Assets.images.png.primaryBg.image(fit: BoxFit.fill),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(16.h),
                        if (formKey.currentState?.validate() == true)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'incorrect_email_or_password'.tr(),
                                style: TextStyle(
                                    fontSize: 12.sp, fontWeight: FontWeight.bold, color: AppConst.kErrorColor),
                              ),
                              Gap(4.w),
                              SvgPicture.asset('assets/images/svg/wrong_icon.svg'),
                            ],
                          ),
                        Gap(20.h),
                        Text(
                          'login'.tr(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold, color: AppConst.kScondaryTextColor),
                        ),
                        const Gap(24),
                        Text(
                          'mobile_number'.tr(),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                        ),
                        const Gap(16),
                        CustomInputField(
                          keyboardType: TextInputType.phone,
                          controller: phoneController,
                          validator: (value) {
                            if (value?.trim().isEmpty == true) {
                              return 'required'.tr();
                            }
                            return null;
                          },
                          hint: 'enter_mobile_number'.tr(),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              'assets/images/svg/phone_icon.svg',
                            ),
                          ),
                        ),
                        const Gap(24),
                        Text(
                          'password'.tr(),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                        ),
                        const Gap(16),
                        CustomInputField(
                          controller: passwordController,
                          validator: (value) {
                            if (value?.isEmpty == true) {
                              return 'required'.tr();
                            }
                            return null;
                          },
                          isPassword: true,
                          hint: 'enter_password'.tr(),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              'assets/images/svg/security lock.svg',
                            ),
                          ),
                        ),
                        const Gap(12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Utils.openScreen(
                                //   context,
                                //   ForgetPasswordPage(),
                                // );
                                Navigator.pushNamed(context, Routes.forgotPasswordRoute);
                              },
                              child: Text('forgot_password'.tr(),
                                  style: const TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kButtonColor)),
                            ),
                          ],
                        ),
                        Gap(50.h),
                        BlocConsumer<LoginCubit, LoginState>(
                          listener: (context, state) {
                            if (state is LoginSuccessState) {
                              // Utils.openScreen(context, const MainPage(), replacment: true);
                              context.read<AutoLoginCubit>().fLoggedUser(
                                  context: context, accessToken: context.read<LoginCubit>().data?.accessToken ?? '');
                            }
                            if (state is LoginErrorState) {
                              showAppSnackBar(context: context, message: state.message, type: ToastType.error);
                            }
                          },
                          builder: (context, state) {
                            if (state is LoginLoadingState) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return CustomTextButton(
                              onTap: () {
                                if (formKey.currentState?.validate() == true) {
                                  context
                                      .read<LoginCubit>()
                                      .fLogin(phone: phoneController.text.trim(), password: passwordController.text);
                                }
                              },
                              title: 'login'.tr(),
                              fontSize: 18.sp,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Gap(10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('dont_have_an_account'.tr(),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor)),
                      Gap(8.w),
                      GestureDetector(
                        onTap: () {
                          // Utils.openScreen(context, const NewAccPage(), replacment: true);
                          Navigator.pushReplacementNamed(context, Routes.registerRoute);
                        },
                        child: Text(' ${'create_new_account'.tr()} ',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kButtonColor)),
                      ),
                    ],
                  ),
                  Gap(20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
