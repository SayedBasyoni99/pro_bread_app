import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:pro_bread_app/core/const/constant_var.dart';
import 'package:pro_bread_app/core/resources/assets.gen.dart';
import 'package:pro_bread_app/shared/custom_app_bar.dart';
import 'package:pro_bread_app/shared/custom_text_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConst.kPrimaryColor,
        appBar: CustomAppBar.build(context,
            titleText: ' الرئيسية',
            backgroundColor: AppConst.kPrimaryColor,
            iconAppBar: SvgPicture.asset('assets/images/svg/cart_icon.svg')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) => Stack(
              children: [
                Assets.images.png.bekery.image(fit: BoxFit.fill),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Gap(32),
                      const Text(
                        'فاجئ من تحب بهدية فاخرة',
                        style: TextStyle(color: AppConst.kScondaryTextColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Gap(32),
                      CustomTxtField(
                          borderColor: AppConst.kPrimaryColor,
                          filled: true,
                          fillColor: AppConst.kPrimaryColor,
                          hintTxt: 'عن ماذا تبحث؟',
                          iconButton02: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SvgPicture.asset(
                              'assets/images/svg/search_icon.svg',
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
