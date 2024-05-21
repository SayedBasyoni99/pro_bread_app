import 'dart:developer';

import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/routes/app_routes.dart';
import '../../core/resources/assets.gen.dart';
import '../../core/utils/app_snack_bar.dart';
import '../../core/utils/enums.dart';
import '../auth/presentation/controller/auto_login/auto_login_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AutoLoginCubit, AutoLoginState>(
      listener: (context, state) {
        if(state is AutoLoginSuccessState){
          log('UserType: ${state.userType}');
          _goNext(state.userType);
        }
        if(state is AutoLoginErrorState){
          showAppSnackBar(
            context: context,
            message: state.message,
            type: ToastType.error,
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Assets.images.png.splashLogo00.image(width: double.infinity, fit: BoxFit.cover),
              OpacityAnimatedWidget.tween(
                duration: const Duration(milliseconds: 3000),
                opacityEnabled: 1,
                opacityDisabled: 0,
                child: SvgPicture.asset(
                  'assets/images/svg/PBLogo.svg',
                  height: 102.16,
                  width: 194.86,
                ),
                animationFinished: (p0) {
                  context.read<AutoLoginCubit>().getUserType();
                }),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  _goNext(UserType userType) {
    if (userType == UserType.firstOpen) {
      Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
    } else if (userType == UserType.login) {
      Navigator.pushReplacementNamed(context, Routes.welcomeRoute);
    } else if (userType == UserType.user || userType == UserType.guest) {
      Navigator.pushReplacementNamed(context, Routes.mainPageRoute);
    }
  }
}
