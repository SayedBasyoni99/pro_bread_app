import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/presentation/screens/products_page.dart';
import '../../screens/home_page.dart';

part 'bottom_nav_bar_states.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(const BottomNavBarState());

  int currentIndex = 0;

  final List<Widget> screens = const [
    HomePage(),
    ProductsPage(),
    HomePage(),
  ];

  Future<void> changeCurrentScreen({required int index}) async {
    currentIndex = index;
    emit(BottomNavBarState(index: currentIndex));
  }
}
