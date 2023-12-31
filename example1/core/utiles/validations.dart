import 'package:easy_localization/easy_localization.dart';

class Validation {
  static RegExp emailReg = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  String? emailValidation(String? value, {bool isRequired = true}) {
    if (value!.trim().isEmpty) {
      if (isRequired) {
        return ("البريد الالكتروني مطلوب".tr());
      } else {
        return null;
      }
    } else if (!emailReg.hasMatch(value.trim())) {
      return ("بريد الكتروني غير صالح".tr());
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value!.trim().isEmpty) {
      return 'كلمة المرور مطلوبه'.tr();
    } else {
      if (value.trim().length < 6) {
        return "كلمة مرور قصيره".tr();
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

  String? confirmPasswordValidation(value, String password) {
    if (value!.isEmpty) {
      return 'تاكيد كلمة المرور مطلوبه'.tr(args: ["confirmPassword".tr()]);
    } else if (password != value) {
      return ("كلمة المرور غير متطابقه".tr());
    } else {
      return null;
    }
  }

  String? defaultValidation(value, [String field = "", String? error]) {
    if (value!.isEmpty) {
      return error ?? ("حقل مطلوب".tr(args: [field]));
    } else {
      return null;
    }
  }
}
