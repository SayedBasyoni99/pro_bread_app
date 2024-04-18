import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pro_bread_app/core/resources/assets.gen.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Assets.images.png.logInBg.image(width: double.infinity, height: 534, fit: BoxFit.fill),
      
        
      ]),
    );
  }
}
