// import 'dart:math';

// import 'package:flutter/material.dart';

// class Responsive {
//   Responsive({
//     this.designWidth = 428,
//     this.designHeight = 926,
//   });
//   final double designWidth;
//   final double designHeight;

//   //BuildContext context;

//   double w(num width) {
//     return width *
//         (MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width /
//             designWidth);
//   }

//   double h(num height) {
//     return height *
//         (MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height /
//             designHeight);
//   }

//   double fs(num size) {
//     return min(
//         size *
//             (MediaQueryData.fromWindow(WidgetsBinding.instance.window)
//                     .size
//                     .height /
//                 designHeight),
//         size *
//             (MediaQueryData.fromWindow(WidgetsBinding.instance.window)
//                     .size
//                     .width /
//                 designWidth));
//   }
// }

// extension SizeExtension on num {
//   double get w =>
//       MediaQueryData.fromWindow(WidgetsBinding.instance.window).orientation ==
//               Orientation.landscape
//           ? Responsive(designHeight: 428, designWidth: 926).w(this)
//           : Responsive().w(this);
//   double get h =>
//       MediaQueryData.fromWindow(WidgetsBinding.instance.window).orientation ==
//               Orientation.landscape
//           ? Responsive(designHeight: 428, designWidth: 926).h(this)
//           : Responsive().h(this);
//   double get fs =>
//       MediaQueryData.fromWindow(WidgetsBinding.instance.window).orientation ==
//               Orientation.landscape
//           ? Responsive(designHeight: 428, designWidth: 926).fs(this)
//           : Responsive().fs(this);
// }
