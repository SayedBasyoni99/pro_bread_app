import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pro_bread_app/core/const/constant_var.dart';
import 'package:pro_bread_app/core/resources/assets.gen.dart';
import 'package:pro_bread_app/features/auth/presentation/screens/log_in_page.dart';
import 'package:pro_bread_app/splash/splash_screen.dart';
// import 'package:pro_bread_app/shared/text_button.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CupertinoOnboarding(
            bottomButtonChild: index == 0 ? const Text(' تخطي') : const Text('تسجبل الدخول'),

            bottomButtonColor: buttonColor,
            // onPressed: () {},
            onPressedOnLastPage: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LogInPage()));
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
                  const Text('هذا النص هو مثال لنص يمكن أن يستبدل',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: scondaryTextColor,
                      )),
                  const Gap(20),
                  const Text(
                      'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: thirdTextColor,
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
                  const Text('هذا النص هو مثال لنص يمكن أن يستبدل',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: scondaryTextColor,
                      )),
                  const Gap(20),
                  const Text(
                      'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: thirdTextColor,
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
          //               style: TextStyle(
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 18.0,
          //                 color: scondaryTextColor,
          //               )),
          //           const Gap(20),
          //           const Text(
          //               'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص',
          //               textAlign: TextAlign.center,
          //               style: TextStyle(
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
