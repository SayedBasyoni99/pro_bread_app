import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    super.key,
    this.onTap,
    this.title = 'Next ',
    this.height = 65,
    this.width = 343,
    this.radius = 10,
    this.textColor = Colors.black,
    this.buttonColor = const Color(0xffD8A235),
    this.borderColor = const Color(0xffCB962C),
    this.inkColor = Colors.transparent,
    this.withBorder = false,
    this.isBold = true,
    this.fontSize = 16.0,
    this.icon,
  });
  void Function()? onTap;
  String title;
  double height, width, radius, fontSize;
  Color textColor, buttonColor, borderColor, inkColor;
  bool withBorder, isBold;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
            shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: withBorder
                  ? BorderSide(color: borderColor)
                  : const BorderSide(color: Colors.transparent),
            ))),
        child: Ink(
          decoration: BoxDecoration(
            color: inkColor,
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          child: Container(
              constraints: BoxConstraints(minWidth: width, minHeight: height),
              // min sizes for Material buttons
              // alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                          color: textColor,
                          fontSize: fontSize,
                          fontWeight:
                              isBold ? FontWeight.bold : FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  if (icon != null) Icon(icon, color: textColor),
                ],
              )),
        ));
  }
}



// ElevatedButton(
//       style = ButtonStyle(
//           backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
//           shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
//           shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(radius),
//               side: withBorder ? BorderSide(color: borderColor) : const BorderSide(color: Colors.transparent)))),
//       onPressed = onTap,
//       child = Ink(
//         decoration: BoxDecoration(
//           color: inkColor,
//           borderRadius: BorderRadius.all(Radius.circular(radius)),
//         ),
//         child: child ??
//             Container(
//               constraints: BoxConstraints(minWidth: width, minHeight: height),
//               // min sizes for Material buttons
//               alignment: Alignment.center,
//               child: TextWidget(
//                 title: title,
//                 fontSize: fontSize ?? 16.sp,
//                 textAlign: TextAlign.center,
//                 color: textColor,
//               ),
//             ),
//       ),
//     );




    // GestureDetector(
    //   onTap = onTap,
    //   child = Container(
    //     color: const Color(0xffD8A235),
    //     height: 65,
    //     width: 343,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(10),
    //       color: const Color(0xffCB962C),
    //     ),
    //     child: const Center(
    //         child: Text(
    //       'Next to',
    //       style: TextStyle(color: Colors.white),
    //     )),
    //   ),
    // );