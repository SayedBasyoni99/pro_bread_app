import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/resources/assets.gen.dart';
import 'log_in_page.dart';
import '../../../../shared/custom_input_field.dart';
import '../../../../shared/text_button.dart';

import '../../../../core/utils/app_snack_bar.dart';
import '../../../../core/utils/utils.dart';
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Gap(25.h),
                      const Text(
                        'إنشاء حساب جديد',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppConst.kScondaryTextColor),
                      ),
                      const Gap(32),
                      const Text(
                        'الاسم ',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppConst.kThirdTextColor),
                      ),
                      const Gap(16),
                      CustomInputField(
                        controller: nameController,
                        hint: 'ادخل اسم الحساب',
                        validator: (value) {
                          if (value?.trim().isEmpty == true) {
                            return 'required';
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
                      //   style: TextStyle(
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
                      const Text(
                        'كلمة المرور ',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppConst.kThirdTextColor),
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
                        hint: 'ادخل كلمة المرور',
                        validator: (p0) {
                          if (p0?.isEmpty == true) {
                            return 'required';
                          }
                          if ((p0?.length ?? 0) < 8) {
                            return 'كلمة المرور قصيرة جدا';
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
                      BlocConsumer<CompleteRegisterCubit,
                          CompleteRegisterState>(
                        listener: (context, state) {
                          if (state is CompleteRegisterSuccessState) {
                            Utils.openScreen(context, LogInPage(),
                                replacment: true);
                          }
                          if (state is CompleteRegisterErrorState) {
                            showAppSnackBar(
                                context: context,
                                message: state.message,
                                type: ToastType.error);
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
                                context
                                    .read<CompleteRegisterCubit>()
                                    .fCompleteRegister(
                                      name: nameController.text.trim(),
                                      phone:
                                          context.read<RegisterCubit>().phone ??
                                              '',
                                      password: passwordController.text.trim(),
                                    );
                              }
                            },
                            title: '  انشاء حساب جديد',
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LogInPage()));
                      },
                      child: const Text('تسجيل الدخول',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppConst.kButtonColor)),
                    ),
                    const Gap(12),
                    const Text('هل لديك حساب بالفعل ؟ ',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppConst.kThirdTextColor)),
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
