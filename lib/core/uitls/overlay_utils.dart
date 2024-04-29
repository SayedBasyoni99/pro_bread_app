
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class OverlayUtils {
//   /// Shows a custom dialog.
//   ///
//   /// This method is used to display a custom dialog on the screen.
//   /// The [child] widget is the content of the dialog.
//   static void showCustomDialog({
//     required BuildContext context,
//     required Widget child,
//     bool barrierDismissible = true,
//   }) {
//     showDialog(
//       context: context,
//       useSafeArea: false,
//       barrierDismissible: barrierDismissible,
//       builder: (context) => child,
//     );
//   }

//   /// Shows a bottom sheet.
//   ///
//   /// This method is used to display a bottom sheet on the screen.
//   /// The [child] widget is the content of the bottom sheet.
//   static void showBottomSheet({required BuildContext context, required Widget child}) {
//     showModalBottomSheet(
//       context: context,
//       useRootNavigator: true,
//       enableDrag: true,
//       showDragHandle: true,
//       backgroundColor: context.scaffoldBackgroundColor,
//       isScrollControlled: true,
//       builder: (BuildContext ctx) {
//         return Wrap(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 color: context.scaffoldBackgroundColor,
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(AppSize.s14.r)),
//               ),
//               child: child.setContainerToView(width: context.width()).paddingVertical(AppSize.s20.h),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   /// Shows a scrollable bottom sheet.
//   ///
//   /// This method is used to display a scrollable bottom sheet on the screen.
//   /// The [child] widget is the content of the bottom sheet.
//   static void showScrollableBottomSheet({
//     required BuildContext context,
//     required Widget child,
//     Color? barrierColor,
//   }) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       useRootNavigator: true,
//       barrierColor: barrierColor,
//       builder: (BuildContext context) {
//         return DraggableScrollableSheet(
//           expand: false,
//           maxChildSize: 0.85,
//           minChildSize: 0.5,
//           initialChildSize: 0.85,
//           builder: (context, controller) => child,
//         );
//       },
//     );
//   }

//   /// Opens the setting permission dialog.
//   ///
//   /// This method is used to open a dialog that prompts the user to navigate to the app's settings
//   /// in order to grant a specific permission. The dialog provides a convenient way for the user
//   /// to grant the required permission without manually navigating through the device settings.
//   static openSettingPermissionDialog({
//     String? title,
//     String? actionTitle,
//     required String message,
//   }) {
//     return showDialog(
//         barrierDismissible: false,
//         context: RouteConfigs.rootNavigatorKey.currentContext!,
//         builder: (BuildContext context) {
//           return AlertDialog.adaptive(
//             title: Text(title ?? LocaleKeys.permission.tr()),
//             content: Text(LocaleKeys.validator_location_always.tr()),
//             actions: [
//               Material(
//                 color: context.scaffoldBackgroundColor,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [Text(actionTitle ?? LocaleKeys.setting_title.tr())],
//                 ).paddingAll(AppSize.s10.sp).onTap(() async => openAppSettings()),
//               ),
//             ],
//           );
//         });
//   }

//   static void showPickerSheet<T>({
//     bool isLoading = false,
//     bool enableSearch = true,
//     T? initialValue,
//     required BuildContext context,
//     required List<T> items,
//     required Function(int) onSelectedItemChanged,
//     required Widget? Function(BuildContext, int) itemBuilder,
//     String? Function(int)? headerBuilder,
//   }) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       useRootNavigator: true,
//       builder: (BuildContext context) {
//         return Padding(
//           padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 height: AppSize.s300,
//                 color: context.scaffoldBackgroundColor,
//                 child: items.isEmpty
//                     ? Material(
//                         color: context.scaffoldBackgroundColor,
//                         child: SizedBox(height: AppSize.s300, child: Text(LocaleKeys.not_available.tr()).center()),
//                       )
//                     : CustomPicker(
//                         enableSearch: enableSearch,
//                         data: items,
//                         initialValue: initialValue,
//                         itemBuilder: itemBuilder,
//                         headerBuilder: headerBuilder,
//                         onSelectedItemChanged: onSelectedItemChanged,
//                       ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
