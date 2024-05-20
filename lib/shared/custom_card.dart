import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../features/categories/domain/entities/get_category_response.dart';
import 'text_widget.dart';

import '../core/const/constant_var.dart';

class CustomCard extends StatelessWidget {
  final Category item;
  final bool isSelected;

  const CustomCard({
    super.key,
    required this.item,
    this.isSelected = false,
    this.color = AppConst.kPrimaryColor,
  });

  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: color,
        border: isSelected
            ? Border.all(color: AppConst.kBorderButtonColor, width: 2.0)
            : null,
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 75.h,
            // width: 24.w,
            child: Image.network(item.avatar),
          ),
          const Spacer(),
          TextWidget(
            title: item.name,
            color: AppConst.kScondaryTextColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
