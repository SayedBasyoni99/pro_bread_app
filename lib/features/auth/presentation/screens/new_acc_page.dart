import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/resources/assets.gen.dart';
import '../../../../shared/custom_input_field.dart';
import '../../../../shared/text_button.dart';
import '../../../../core/utils/app_snack_bar.dart';
import '../controller/complete_register/complete_register_cubit.dart';
import '../controller/register/register_cubit.dart';

class NewAccPage extends StatefulWidget {
  const NewAccPage({super.key});

  @override
  State<NewAccPage> createState() => _NewAccPageState();
}

class _NewAccPageState extends State<NewAccPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kPrimaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 32.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Assets.images.png.primaryBg.image(fit: BoxFit.fill),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(25.h),
                      Text(
                        'create_new_account'.tr(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold, color: AppConst.kScondaryTextColor),
                      ),
                      const Gap(32),
                      Text(
                        'name'.tr(),
                        style:
                            const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                      ),
                      const Gap(16),
                      CustomInputField(
                        controller: nameController,
                        hint: 'enter_account_name'.tr(),
                        validator: (value) {
                          if (value?.trim().isEmpty == true) {
                            return 'required'.tr();
                          }

                          return null;
                        },
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            'assets/images/svg/person.svg',
                          ),
                        ),
                      ),
                      // const Gap(32),
                      // const Text(
                      //   ' البريد الالكتروني',
                      //   style: const TextStyle(
                      //       fontSize: 14,
                      //       fontWeight: FontWeight.bold,
                      //       color: AppConst.kThirdTextColor),
                      // ),
                      // const Gap(16),
                      // CustomInputField(
                      //   controller: emailController,
                      //   hint: 'ادخل بريدك الإلكتروني',
                      //   validator: (p0) {
                      //     if (p0?.trim().isEmpty == true) {
                      //       return 'ادخل بريدك الإلكتروني';
                      //     }

                      //     return null;
                      //   },
                      //   prefixIcon: Padding(
                      //     padding: const EdgeInsets.all(12.0),
                      //     child: SvgPicture.asset(
                      //       'assets/images/svg/email.svg',
                      //     ),
                      //   ),
                      // ),
                      const Gap(32),
                      Text(
                        'password'.tr(),
                        style:
                            const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
                      ),
                      const Gap(16),
                      CustomInputField(
                        // suffixIcon: Padding(
                        //   padding: const EdgeInsets.all(12.0),
                        //   child: SvgPicture.asset(
                        //     'assets/images/svg/security lock.svg',
                        //   ),
                        // ),
                        controller: passwordController,
                        isPassword: true,
                        hint: 'enter_password'.tr(),
                        validator: (p0) {
                          if (p0?.isEmpty == true) {
                            return 'required'.tr();
                          }
                          if ((p0?.length ?? 0) < 8) {
                            return 'password_too_short'.tr();
                          }
                          return null;
                        },
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            'assets/images/svg/security lock.svg',
                          ),
                        ),
                      ),
                      Gap(40.h),
                      BlocConsumer<CompleteRegisterCubit, CompleteRegisterState>(
                        listener: (context, state) {
                          if (state is CompleteRegisterSuccessState) {
                            // Utils.openScreen(context, LogInPage(), replacment: true);
                            Navigator.pushReplacementNamed(context, Routes.loginRoute);
                          }
                          if (state is CompleteRegisterErrorState) {
                            showAppSnackBar(context: context, message: state.message, type: ToastType.error);
                          }
                        },
                        builder: (context, state) {
                          if (state is CompleteRegisterLoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return CustomTextButton(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                context.read<CompleteRegisterCubit>().fCompleteRegister(
                                      name: nameController.text.trim(),
                                      phone: context.read<RegisterCubit>().phone ?? '',
                                      password: passwordController.text.trim(),
                                    );
                              }
                            },
                            title: 'create_new_account'.tr(),
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
                    Text('already_have_an_account'.tr(),
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor)),
                    const Gap(12),
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => LogInPage()));
                        Navigator.pushReplacementNamed(context, Routes.loginRoute);
                      },
                      child: Text('login'.tr(),
                          style:
                              const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kButtonColor)),
                    ),
                  ],
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
