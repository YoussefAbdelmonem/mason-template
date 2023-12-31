import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/screens/login/login_screen.dart';
class Routes {
  static const String SplashScreen = "/";
  static const String AuthScreen = "/authScreen";
  static const String LoginScreen = "LoginScreen";
  static const String RegisterScreen = "RegisterScreen";
  static const String forget_passScreen = "/forgetPassScreen";
  static const String OtpScreen = "/OtpScreen";
  static const String LayoutScreen = "/LayoutScreen";
  }

class RouteGenerator {
  static String currentRoute = "";

  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    currentRoute = routeSettings.name.toString();
    switch (routeSettings.name) {
         case Routes.LoginScreen:
        return CupertinoPageRoute(
            settings: routeSettings,
            builder: (_) {
              return const LoginScreen();
            });
      // case Routes.SplashScreen:
      //   return CupertinoPageRoute(
      //       settings: routeSettings,
      //       builder: (_) {
      //         return const SplashScreen();
      //       });
  
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> getNestedRoute(RouteSettings routeSettings) {
    currentRoute = routeSettings.name.toString();
    switch (routeSettings.name) {

     

      default:
        return unDefinedRoute();
    }
  }


  static Route<dynamic> unDefinedRoute() {
    return CupertinoPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("مسار غير موجود"),
              ),
              body: const Center(child: Text("مسار غير موجود")),
            ));
  }
}