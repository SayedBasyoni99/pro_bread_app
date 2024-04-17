import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pro_bread_app/core/resources/assets.gen.dart';
import 'package:pro_bread_app/shared/text_button.dart';
// import 'package:pro_bread_app/shared/text_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Expanded(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.png.onBoardingLogo01.image(
              width: 298,
              height: 304.96,
            ),
            const Gap(20),
            const Text('هذا النص هو مثال لنص يمكن أن يستبدل'),
            const Gap(20),
            const Text(
                'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص'),
            const Gap(20),
            ElevatedButton(onPressed: () {}, child: const Text('Next')),
            const Gap(20),
            CustomTextButton()
          ],
        ),
      ),
    );
  }
}
