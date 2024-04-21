import 'package:flutter/material.dart';
import 'package:pro_bread_app/shared/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.icon,
    required this.appBarTitle,
    this.onActionPressed,
  });
  final IconData icon;
  final String appBarTitle;
  final void Function()? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          appBarTitle,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        CustomIcon(icon: icon, onTap: onActionPressed),
      ],
    );
  }
}
