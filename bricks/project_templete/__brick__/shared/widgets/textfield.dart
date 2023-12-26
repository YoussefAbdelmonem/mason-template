import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import '../../core/theme/dynamic_theme/colors.dart';
import 'customtext.dart';

class DefaultTextField extends StatefulWidget {
  const DefaultTextField({
    Key? key,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.label,
    this.hintText,
    this.suffixIcon,
    this.border,
    this.showLabel = true,
    this.minlines,
    this.maxlines,
    this.onChange,
    this.validate,
    this.focusNode,
    this.inputFormatter = const [],
    this.contentPadding,
    this.readOnly = false,
    this.showRequiredStar = false,
    this.enable,
    this.autovalidateMode,
    this.prefixIcon,
    this.flex = 3,
    this.onTap,
    this.enabledBorder,
    this.style,
    this.autoFoces = false,
    this.padding,
  }) : super(key: key);
  final bool? enable;
  final bool readOnly;
  final bool autoFoces;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final String? Function(String?)? validate;
  final Function()? onTap;
  final FocusNode? focusNode;
  final List<TextInputFormatter> inputFormatter;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final int? minlines;
  final Widget? prefixIcon;
  final int? maxlines;
  final AutovalidateMode? autovalidateMode;
  final int flex;
  final TextStyle? style;
  final bool showLabel;
  final bool showRequiredStar;
  final TextAlign textAlign = TextAlign.start;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final Function(String)? onChange;
  @override
  _DefaultTextFieldState createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool? isPass;
  bool? visible;
  @override
  void initState() {
    isPass =
        widget.keyboardType == TextInputType.visiblePassword ? true : false;
    visible = isPass;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final BorderRadius borderRadius = BorderRadius.circular(8.0);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: FormField<String>(
          initialValue: widget.controller?.text ?? "",
          validator: widget.validate,
          builder: (state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.showLabel)
                  CustomText(
                    widget.label ?? "",
                    fontsize: 16,
                    weight: FontWeight.w600,
                  ),
                if (widget.showLabel)
                  const SizedBox(
                    height: 10,
                  ),
                TextFormField(
                  autovalidateMode: widget.autovalidateMode,
                  textAlign: widget.textAlign,
                  style: widget.style,
                  enabled: widget.enable ?? true,
                  onChanged: (s) {
                    widget.onChange?.call(s);
                    state.didChange(s);
                  },
                  autofocus: widget.autoFoces,
                  focusNode: widget.focusNode,
                  controller: widget.controller,
                  keyboardType: widget.keyboardType,
                  obscureText: visible!,
                  minLines: widget.minlines,
                  maxLines: widget.maxlines ?? 1,
                  onTap: () {
                    widget.onTap?.call();
                  },
                  inputFormatters: widget.inputFormatter,
                  readOnly: widget.readOnly,
                  decoration: InputDecoration(
                      // filled: true,
                      // fillColor: AppColors.surface,
                      prefixIcon: widget.prefixIcon != null
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                widget.prefixIcon!,
                              ],
                            )
                          : null,
                      contentPadding: widget.contentPadding ??
                          const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 18),
                      // fillColor: whiteColor70,
                      hintText: widget.hintText,
                      hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 13),
                      suffixIcon: widget.suffixIcon ??
                          (isPass!
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      visible = !visible!;
                                    });
                                  },
                                  icon: Icon(
                                    visible!
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    //color: widget.suffixIconColor,
                                  ),
                                )
                              : widget.suffixIcon),
                      border: widget.border ??
                          OutlineInputBorder(
                            borderRadius: borderRadius,
                          ),
                      enabledBorder: widget.enabledBorder ??
                          OutlineInputBorder(
                              borderRadius: borderRadius,
                              borderSide: BorderSide(
                                  color: state.hasError
                                      ? AppColors.error
                                      : Colors.grey,
                                  width: state.hasError ? 2 : 1)),
                      disabledBorder: widget.enabledBorder ??
                          OutlineInputBorder(
                            borderRadius: borderRadius,
                          )),
                ),
                const SizedBox(
                  height: 8,
                ),
                if (state.hasError)
                  Row(
                    children: [
                      Icon(
                        Icons.error,
                        color: AppColors.error,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      CustomText(
                        state.errorText.toString(),
                        fontsize: 12,
                        color: AppColors.error,
                      ),
                    ],
                  )
              ],
            );
          }),
    );
  }
}
