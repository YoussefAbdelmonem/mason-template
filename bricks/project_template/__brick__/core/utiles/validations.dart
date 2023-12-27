import 'package:easy_localization/easy_localization.dart';

class Validation {
  static RegExp emailReg = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  static String? emailValidation(String? value, {bool isRequired = true}) {
    if (value!.trim().isEmpty) {
      if (isRequired) {
        return ('Required Email'.tr());
      } else {
        return null;
      }
    } else if (!emailReg.hasMatch(value.trim())) {
      return ('Invalid Email'.tr());
    } else {
      return null;
    }
  }

  static String? validatePassword(String? value) {
    if (value!.trim().isEmpty) {
      return 'Password Required'.tr();
    } else {
      if (value.trim().length < 6) {
        return "Short Password".tr();
      } else {
        return null;
      }
    }
  }

  // static String? phoneValidation(String? value) {
  //   String p = r'^(5|50|53|56|54|59|51|58|57)([0-9]{8})$';

  //   RegExp regExp = RegExp(p);
  //   if (value!.trim().isEmpty) {
  //     return ('phoneValidation'.tr());
  //   } else if (!regExp.hasMatch(value.trim())) {
  //     return ('wrongPhoneValidation'.tr());
  //   } else {
  //     return null;
  //   }
  // }

  static String? confirmPasswordValidation(value, String password) {
    if (value!.isEmpty) {
      return 'requiredField'.tr(args: ["confirmPassword".tr()]);
    } else if (password != value) {
      return ('Password Not Match'.tr());
    } else {
      return null;
    }
  }

  static String? defaultValidation(value, [String field = "", String? error]) {
    if (value!.isEmpty) {
      return error ?? ("Required Field".tr(args: [field]));
    } else {
      return null;
    }
  }
}
