library pretty_numbers;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PrettyNumbers extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextStyle style;
  final Widget? suffixIcon;
  final String hintText;
  final String locale;
  final bool filled;
  final Widget? prefixIcon;
  final OutlineInputBorder focusedBorder;
  final OutlineInputBorder errorBorder;
  final OutlineInputBorder border;
  final TextStyle hintStyle;
  final InputDecoration? decoration;

  PrettyNumbers({
    Key? key,
    required this.controller,
    this.focusNode,
    this.style = const TextStyle(color: Colors.black, fontSize: 14),
    this.hintText = '',
    this.suffixIcon,
    this.locale = 'en_US',
    this.prefixIcon,
    this.filled = true,
    this.focusedBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    this.errorBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    this.border = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    this.hintStyle = const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    this.decoration,
  }) : super(key: key);

  @override
  _PrettyNumbersState createState() => _PrettyNumbersState();
}

class _PrettyNumbersState extends State<PrettyNumbers> {
  late NumberFormat _numberFormat;

  @override
  void initState() {
    super.initState();
    _numberFormat = NumberFormat.decimalPattern(widget.locale);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        TextInputFormatter.withFunction(
          (oldValue, newValue) {
            final newText =
                _numberFormat.format(int.tryParse(newValue.text) ?? 0);
            return TextEditingValue(
              text: newText,
              selection: TextSelection.collapsed(offset: newText.length),
            );
          },
        ),
      ],
      style: widget.style,
      decoration: widget.decoration ?? _buildDecoration(),
    );
  }

  InputDecoration _buildDecoration() {
    return InputDecoration(
      prefix: widget.prefixIcon != null
          ? Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: widget.prefixIcon,
            )
          : null,
      suffix: widget.suffixIcon != null
          ? Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: widget.suffixIcon,
            )
          : null,
      filled: widget.filled,
      fillColor: Colors.grey.shade300,
      hintText: widget.hintText,
      hintStyle: widget.hintStyle,
      focusedBorder: widget.focusedBorder,
      errorBorder: widget.errorBorder,
      border: widget.border,
    );
  }
}
