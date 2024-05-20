import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../core/const/constant_var.dart';

class NotFoundMesaage extends StatelessWidget {
  const NotFoundMesaage({
    super.key,
    required this.picInfo,
    required this.message,
  });

  final String picInfo;

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/svg/$picInfo.svg',
            height: 112.h,
            width: 103.w,
          ),
          Gap(32.h),
          Text(
            message,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppConst.kPrimaryTextColor),
          ),
        ],
      ),
    );
  }
}





// SizedBox(
//               width: 274.w,
//               child: CustomTextButton(
//                 title: 'ابدأ التسوق',
//                 fontSize: 18.sp,
//                 onTap: () {
//                   Utils.openScreen(context, const HomePage());
//                 },
//               ),
//             ),