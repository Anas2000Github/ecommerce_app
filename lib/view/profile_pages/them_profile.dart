// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:learn_flutter_with_firebase/view/widgets/CustomListTile.dart';
//
// import '../../helper/theme_controller.dart';
//
// class ThemeProfile extends StatelessWidget {
//
//   final controller = Get.put(ThemeController());
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ThemeController>(
//       builder: (_) =>  Scaffold(
//         appBar: AppBar(backgroundColor: Theme
//             .of(context)
//             .primaryColor),
//         body: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             children: [
//               const Padding(
//                 padding: EdgeInsets.symmetric(vertical: 20.0),
//                 child: Text(
//                   "Change Theme",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//               ),
//               addRadioButton.addRadio(
//                   title: "System",
//                   val: ThemeMode.system,
//                   context: context,
//                   icon: Icons.system_security_update_good,
//                   groupValue:  controller.themeMode,
//                   onChanged: (value) {
//                     controller.setThemeMode(value!);
//                   },
//               ),
//               addRadioButton.addRadio(
//                 title: "Light",
//                 val: ThemeMode.light,
//                 icon: Icons.light_mode_outlined,
//                 context: context,
//                 groupValue:  controller.themeMode,
//                 onChanged: (value) {
//                   controller.setThemeMode(value!);
//                 },
//               ),
//               addRadioButton.addRadio(
//                 title: "Dark",
//                 val: ThemeMode.dark,
//                 icon: Icons.dark_mode,
//                 context: context,
//                 groupValue:  controller.themeMode,
//                 onChanged: (value) {
//                   controller.setThemeMode(value!);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//
// }


