import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../core/helper/alerts.dart';
import '../../core/theme/dynamic_theme/colors.dart';
import 'customtext.dart';

class SnackDesgin extends StatelessWidget {
  const SnackDesgin({
    Key? key,
    required this.state,
    required this.text,
  }) : super(key: key);
  final SnackState state;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Card(
          color:
              state == SnackState.success ? AppColors.primary : AppColors.error,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              state == SnackState.success
                  ? Lottie.asset(
                      "assets/json/success.json",
                      width: 150,
                      height: 150,
                    )
                  : Lottie.asset(
                      "assets/json/error.json",
                      width: 150,
                      height: 90,
                    ),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: CustomText(
                  text,
                  color: Colors.white,
                  weight: FontWeight.bold,
                  align: TextAlign.start,
                  fontsize: 25,
                  textStyleEnum: TextStyleEnum.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
