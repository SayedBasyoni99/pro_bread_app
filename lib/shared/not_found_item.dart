import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pro_bread_app/features/home/presentation/screens/home_page.dart';
import 'package:pro_bread_app/shared/not_found_message.dart';
import 'package:pro_bread_app/shared/text_button.dart';

import '../core/utils/utils.dart';

class NotFoundItem extends StatelessWidget {
  const NotFoundItem({
    super.key,
    required this.PicInfo,
    required this.Message,
  });

  final String PicInfo;
  final String Message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(60.h),
        NotFoundMesaage(PicInfo: PicInfo, Message: Message),
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
