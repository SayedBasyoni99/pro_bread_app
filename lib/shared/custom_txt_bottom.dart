import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_bread_app/core/const/constant_var.dart';

//ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.onTap,
    required this.btnTitle,
    this.isloading = false,
    this.btnColor = AppConst.kButtonColor,
    this.btntxtColor = AppConst.kPrimaryTextColor,
    this.borderButtonColor = Colors.transparent,
  });

  final String btnTitle;
  void Function()? onTap;
  final bool isloading;
  final Color btntxtColor, btnColor, borderButtonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56.0,
        width: 305.0,
        decoration: BoxDecoration(
            color: btnColor,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: borderButtonColor,
            )),
        child: Center(
          child: isloading
              ? const SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 10, 49, 44),
                  ),
                )
              : Text(
                  btnTitle,
                  style: GoogleFonts.balooBhaijaan2(
                    textStyle: TextStyle(
                      color: btntxtColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
