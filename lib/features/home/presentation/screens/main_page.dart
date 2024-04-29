import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_bread_app/shared/custom_app_bar.dart';
import 'package:pro_bread_app/shared/show_dialog.dart';

import '../controllers/bottom_nav_bar/bottom_nav_bar_cubit.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {

        return Scaffold(
          appBar: CustomAppBar.build(
            context,
            centerTitle: true,
            // titleText : state.index == 1? 'Add' : state.index == 2? 'Star': 'Home',
            title: Builder(
              builder: (context) {
                String title = 'Home';
                if (state.index == 1) {
                  title = 'Add';
                }
                if (state.index == 2) {
                  title = 'Star';
                }
                return Text(title);
              },
            ),
          ),
          // appBar: AppBar(
          //   centerTitle: true,
          //   title: Builder(
          //     builder: (context) {
          //       String title = 'Home';
          //       if (state.index == 1) {
          //         title = 'Add';
          //       }
          //       if (state.index == 2) {
          //         title = 'Star';
          //       }
          //       return Text(title);
          //     },
          //   ),
          // ),
          body: context.read<BottomNavBarCubit>().screens[state.index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.index,
            onTap: (int index) => context
                .read<BottomNavBarCubit>()
                .changeCurrentScreen(index: index),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.home),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.add),
                ),
                label: 'Add',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.star),
                ),
                label: 'Star',
              ),
            ],
          ),
        );
      },
    );
  }
}
