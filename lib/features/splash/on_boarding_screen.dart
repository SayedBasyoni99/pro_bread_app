import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../config/routes/app_routes.dart';
import '../../core/const/constant_var.dart';
import '../../core/resources/assets.gen.dart';

// ignore: must_be_immutable
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CupertinoOnboarding(
            bottomButtonChild: index == 0 ? Text('skip'.tr()) : Text('login'.tr()),

            bottomButtonColor: AppConst.kButtonColor,
            // onPressed: () {},
            onPressedOnLastPage: () {
              Navigator.pushReplacementNamed(context, Routes.welcomeRoute);
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WelcomePage()));
            },
            pages: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.images.png.onBoardingLogo01.image(
                    width: 298,
                    height: 304.96,
                  ),
                  const Gap(20),
                  Text('welcome_message'.tr(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: AppConst.kScondaryTextColor,
                      )),
                  const Gap(20),
                  Text('gift_services_description'.tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        // fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: AppConst.kThirdTextColor,
                      )),
                  const Gap(30),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset('assets/images/png/Splash Logo.png', width: 298, height: 298),
                  Assets.images.png.onBoardingLogo02.image(
                    width: 298,
                    height: 298,
                  ),
                  const Gap(20),
                  Text('welcome_message'.tr(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: AppConst.kScondaryTextColor,
                      )),
                  const Gap(20),
                  Text('gift_services_description'.tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        // fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: AppConst.kThirdTextColor,
                      )),
                  const Gap(30),
                  // CustomTextButton(
                  //   fontSize: 16.0,
                  //   title: 'تخطي',
                  // )
                ],
              )
            ],
          )
          // PageView.builder(
          //     itemCount: 2,
          //     itemBuilder: (context, index) {
          //       return Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Assets.images.png.onBoardingLogo01.image(
          //             width: 298,
          //             height: 304.96,
          //           ),
          //           const Gap(20),
          //           const Text('هذا النص هو مثال لنص يمكن أن يستبدل',
          //               style: const TextStyle(
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 18.0,
          //                 color: scondaryTextColor,
          //               )),
          //           const Gap(20),
          //           const Text(
          //               'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص',
          //               textAlign: TextAlign.center,
          //               style: const TextStyle(
          //                 // fontFamily: 'SF Pro Text',
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 14.0,
          //                 color: thirdTextColor,
          //               )),
          //           const Gap(30),
          //           CustomTextButton(
          //             fontSize: 16.0,
          //             title: 'تخطي',
          //           )
          //         ],
          //       );
          //     }),
          ),
    );
  }
}
