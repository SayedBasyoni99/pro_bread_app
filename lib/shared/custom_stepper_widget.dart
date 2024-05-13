import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/const/constant_var.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({super.key});

  @override
  build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Container(
          height: 5.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppConst.kStepperColor),
        ),
      ),
    );
  }
}
