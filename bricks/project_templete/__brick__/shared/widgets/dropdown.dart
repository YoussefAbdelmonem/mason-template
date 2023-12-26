import 'package:flutter/material.dart';

import 'customtext.dart';

class DropDownItem<T> extends StatefulWidget {
  DropDownItem(
      {Key? key,
      required this.options,
      required this.onChanged,
      this.inistialValue,
      this.title,
      this.validator,
      this.radius,
      this.hint,
      this.color,
      this.hintColor,
      this.itemAsString})
      : super(key: key);
  List<T> options;
  final T? inistialValue;
  final String Function(T)? itemAsString;
  final String? hint;
  final String? Function(T?)? validator;
  final String? title;
  final double? radius;
  final Color? hintColor;
  final Color? color;
  Function(T) onChanged;

  @override
  State<DropDownItem<T>> createState() => _DropDownItemState<T>();
}

class _DropDownItemState<T> extends State<DropDownItem<T>> {
  TextEditingController controller = TextEditingController();
  double width = 0.0;

  @override
  void initState() {
    controller = TextEditingController(text: widget.inistialValue?.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title?.isNotEmpty ?? false)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: CustomText(
                widget.title ?? '',
                fontsize: 14,
                color: Color(0xffA1A7AD),
              ),
            ),
          Container(
            height: 60,
            color: widget.color?? Colors.white,
            child: DropdownButtonFormField<T>(
                itemHeight: 50,
                validator: widget.validator,
                hint: CustomText(
                  widget.hint ?? '',
                  fontsize: 14,
                  color: widget.hintColor??Colors.grey,
                  fontFamily: 'Roboto',

                ),
                decoration: InputDecoration(

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(color: Color(0xff8CAAC5))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        widget.radius ?? 10,
                      ),
                      borderSide: BorderSide(color: Color(0xff8CAAC5))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        widget.radius ?? 10,
                      ),
                      borderSide: BorderSide(color: Color(0xff8CAAC5))),
                ),
                value: widget.inistialValue,

                items: widget.options
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: CustomText(
                            widget.itemAsString?.call(e) ?? e.toString(),
                            color: Colors.black,
                          ),
                        ))
                    .toList(),
                onChanged: (s) {
                  if (s != null) {
                    widget.onChanged.call(s);
                  }
                }),
          )
        ],
      ),
    );
  }
}
