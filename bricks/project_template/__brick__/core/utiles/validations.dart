import 'package:easy_localization/easy_localization.dart';

import '../app_strings/app_strings.dart';

class Validation {
   String? defaultValidation(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return (AppStrings.requiredField.tr());
      }
      //short
      // if (value.length < (3)) //value.length < 3
      // {
      //   return ('shortField'.tr());
      // }
      return null;
    }
    return null;
  }


 static String? phoneValidation(String? value) {
    // String p =r'(^[+]?[(]?[0-9]{3}[)]?[-\s.]?[0-9]{3}[-\s.]?[0-9]{4,6}$)';
    String p = r'^5[0-9]{8}$';

    RegExp regExp = RegExp(p);
    if (value!.trim().isEmpty) {
      return (AppStrings.requiredPhone.tr());
    } else if (!regExp.hasMatch(value.trim())) {
      return (AppStrings.phoneDoseNotMatch.tr());
    } else {
      return null;
    }
  }

  static RegExp emailReg = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

   String? emailValidation(
    String? value,
  ) {
    if (value!.trim().isEmpty) {
      return (AppStrings.requiredEmail.tr());
    } else if (!emailReg.hasMatch(value.trim())) {
      return (AppStrings.wrongEmailValidation.tr());
    } else {
      return null;
    }
  }

   String? passwordValidation(String? value) {
    if (value!.trim().isEmpty) {
      return (AppStrings.requiredPassword.tr());
    } else if (value.trim().length < 8) {
      return (AppStrings.smallPassword.tr());
    } else {
      return null;
    }
  }

   String? confirmPasswordValidation(value, String password) {
    if (value!.isEmpty) {
      return AppStrings.requiredField.tr(args: [AppStrings.confirmPasswordValidation.tr()]);
    } else if (password != value) {
      return (AppStrings.passwordNotMatch.tr());
    } else {
      return null;
    }
  }
  static bool? isValidSaudiPhoneNumber(String input) {
    // Regular expression to match Saudi phone number format
    // Note: This is a simple example and may need adjustment based on actual requirements
    RegExp regex = RegExp(r'^5[0-9]{8}$');
    return regex.hasMatch(input);
  }
}
