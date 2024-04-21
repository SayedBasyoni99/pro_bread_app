import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pro_bread_app/core/const/constant_var.dart';
import 'package:pro_bread_app/core/resources/assets.gen.dart';
import 'package:pro_bread_app/shared/custom_text_field.dart';
import 'package:pro_bread_app/shared/custom_txt_bottom.dart';

class CreateAccPage extends StatelessWidget {
  const CreateAccPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kPrimaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Assets.images.png.primaryBg.image(fit: BoxFit.fill),
          const Text(
            'إنشاء حساب جديد',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppConst.kScondaryTextColor),
          ),
          const Gap(10),
          const Text(
            'رقم الجوال',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConst.kThirdTextColor),
          ),
          const Gap(10),
          const CustomTxtField(
            hintTxt: 'ادخل رقم الجوال',
          ),
          Gap(10.h),
          
        ],
      ),
    );
  }
}
