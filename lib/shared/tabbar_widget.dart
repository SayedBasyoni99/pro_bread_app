// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/const/constant_var.dart';

class TabBarWidget extends StatefulWidget {
  int length;
  List<Tab> tabs;
  Function(int)? onTap;
  TabBarWidget({Key? key, required this.length, required this.tabs, this.onTap}) : super(key: key);

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: widget.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: Colors.transparent,
      unselectedLabelColor: Colors.grey,
      labelColor: AppConst.kButtonColor,
      onTap: widget.onTap,
      isScrollable: false,
      indicatorColor: AppConst.kButtonColor,
      tabs: widget.tabs,
      controller: tabController,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle:  TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle:  TextStyle(
        fontSize: 14.sp,
      ),
    );
  }
}
