import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.home),
          ),
        ),BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.home),
          ),
        ),BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.home),
          ),
        ),
      ],
    );
  }
}
