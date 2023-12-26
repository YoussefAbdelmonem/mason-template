import 'package:flutter/material.dart';

import '../../core/theme/dynamic_theme/colors.dart';
import 'customtext.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {Key? key,
      this.color,
      this.shape,
      required this.text,
      this.onTap,
      this.padding,
      this.icon,
      this.radius,
      this.fontColor})
      : super(key: key);
  final Color? color;
  final Color? fontColor;
  final double? radius;
  final OutlinedBorder? shape;
  final String text;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 48,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: shape ??
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(radius ?? 10)),
                backgroundColor: color ?? AppColors.primary,
                foregroundColor: fontColor ?? Colors.black),
            onPressed: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                if (icon != null) icon!,
                const SizedBox(
                  width: 5,
                ),
                CustomText(
                  text,
                  textStyleEnum: TextStyleEnum.caption,
                  weight: FontWeight.bold,
                  fontsize: 20,
                ),
              ],
            )),
      ),
    );
  }
}

class DefaultButtonOutLined extends StatelessWidget {
  const DefaultButtonOutLined(
      {Key? key,
      this.color,
      this.shape,
      required this.text,
      this.onTap,
      this.style,
      this.padding,
      this.icon,
      this.fontColor})
      : super(key: key);
  final Color? color;
  final Color? fontColor;

  final OutlinedBorder? shape;
  final String text;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final TextStyle? style;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 48,
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: shape ??
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
              foregroundColor: fontColor ?? Colors.white,
              side: BorderSide(color: color ?? AppColors.primary),
            ),
            onPressed: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    color: color,
                    size: 30,
                  ),
                const SizedBox(
                  width: 5,
                ),
                CustomText(
                  text,
                  style: style,
                  textStyleEnum: TextStyleEnum.caption,
                  weight: FontWeight.w500,
                  fontsize: 20,
                ),
              ],
            )),
      ),
    );
  }
}

class ButtonIcon extends StatelessWidget {
  const ButtonIcon({
    Key? key,
    this.color,
    this.iconColor,
    this.onTap,
    required this.icon,
  }) : super(key: key);
  final Color? color;
  final Color? iconColor;
  final VoidCallback? onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: color ?? AppColors.primary,
      child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(
              icon,
              size: 15,
              color: iconColor ?? Colors.white,
            ),
          )),
    );
  }
}
