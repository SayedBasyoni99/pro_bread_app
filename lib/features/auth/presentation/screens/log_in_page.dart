import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pro_bread_app/core/const/constant_var.dart';
import 'package:pro_bread_app/core/resources/assets.gen.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Assets.images.png.logInBg.image(width: double.infinity, height: 534, fit: BoxFit.fill),
          Padding(
            padding: const EdgeInsets.only(top: 150, right: 18),
            child: Column(children: [
              const Text(
                'مرحبا بك في تطبيق ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryTextColor),
              ),
              const Gap(20),
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/images/svg/PBLogo.svg',
                  height: 102.16,
                  width: 194.86,
                ),
              ),
            ]),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              'assets/images/svg/buttomSheet.svg',
              height: 372,
            ),
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'نقدم لك خدمات إهداء متميزة وغير تقليدية تساعدك على إرسال هديتك لمن تُحب',
                  style: TextStyle(color: primaryTextColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
