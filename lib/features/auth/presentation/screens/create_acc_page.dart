import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/const/constant_var.dart';
import '../../../../core/resources/assets.gen.dart';
import '../../../../core/utils/app_snack_bar.dart';
import '../controller/register/register_cubit.dart';
import '../widgets/register_pin_code_dialog.dart';
import 'log_in_page.dart';
import '../../../../shared/custom_input_field.dart';
import '../../../../shared/text_button.dart';
import '../../../../shared/show_dialog.dart';

// ignore: must_be_immutable
class CreateAccPage extends StatelessWidget {
  CreateAccPage({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kPrimaryColor,
      body: SingleChildScrollView(
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
                    Text(
                      'create_new_account'.tr(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppConst.kScondaryTextColor),
                    ),
                    const Gap(32),
                    Text(
                      'mobile_number'.tr(),
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppConst.kThirdTextColor),
                    ),
                    const Gap(16),
                    // CustomTxtField(
                    //   textInputType: TextInputType.number,
                    //   hintTxt: 'ادخل رقم الجوال',
                    //   iconButton: SizedBox(
                    //     height: 12.0,
                    //     width: 16.0,
                    //     child: SvgPicture.asset(
                    //       'assets/images/svg/phone_icon.svg',
                    //     ),
                    //   ),
                    // ),
                    Gap(40.h),
                    CustomInputField(
                      controller: phoneController,
                      hint: '  enter_mobile_number'.tr(),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          'assets/images/svg/phone_icon.svg',
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value?.trim().isEmpty == true) {
                          return 'Required'.tr();
                        }
                        return null;
                      },
                    ),
                    const Gap(40),
                    BlocConsumer<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                        if (state is RegisterSuccessState) {
                          showAppDialog(
                            context: context,
                            child: const RegisterPinCodeDialog(),
                          );
                        }
                        if (state is RegisterErrorState) {
                          showAppSnackBar(
                              context: context,
                              message: state.message,
                              type: ToastType.error);
                        }
                      },
                      builder: (context, state) {
                        if (state is RegisterLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return CustomTextButton(
                            onTap: () {
                              if (formKey.currentState?.validate() == true) {
                                context.read<RegisterCubit>().fRegister(
                                      phone: phoneController.text.trim(),
                                    );
                              }
                              // showAppDialog(
                              //   context: context,
                              //   child: const RegisterPinCodeDialog(),
                              // );
                            },
                            title: 'create_account'.tr(),
                            fontSize: 18.sp);
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
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LogInPage()));
                    },
                    child: Text(' login'.tr(),
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppConst.kButtonColor)),
                  ),
                  const Gap(12),
                  Text('already_have_an_account'.tr(),
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppConst.kThirdTextColor)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
