import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/resources/assets.gen.dart';
import 'on_boarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
            animationFinished: (p0) =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OnBoardingScreen())),
          )
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
