import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../features/home/presentation/screens/home_page.dart';
import 'not_found_message.dart';
import 'text_button.dart';

import '../core/utils/utils.dart';

class NotFoundItem extends StatelessWidget {
  const NotFoundItem({
    super.key,
    required this.picInfo,
    required this.message,
  });

  final String picInfo;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(60.h),
        NotFoundMesaage(picInfo: picInfo, message: message),
        Gap(40.h),
        SizedBox(
          width: 274.w,
          child: CustomTextButton(
            title: 'ابدأ التسوق',
            fontSize: 18.sp,
            onTap: () {
              Utils.openScreen(context, const HomePage());
            },
          ),
        ),
      ],
    );
  }
}
