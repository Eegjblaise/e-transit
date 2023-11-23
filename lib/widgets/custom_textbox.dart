import 'package:etransit/theme/color.dart';
import 'package:flutter/material.dart';

class CustomTextBox extends StatelessWidget {
  CustomTextBox(
      {Key? key,
      this.hint = "",
      this.obscuretex = false,
      this.prefix,
      this.suffix,
      this.controller,
      this.onClic,
      this.node,
      this.onChanged})
      : super(key: key);
  void Function(String)? onChanged;
  void Function()? onClic;
  final String hint;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscuretex;
  final TextEditingController? controller;
  FocusNode? node;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 3),
      height: 44,
      decoration: BoxDecoration(
        color: textBoxColor,
        border: Border.all(color: textBoxColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        focusNode: node,
        controller: controller,
        obscureText: obscuretex,
        obscuringCharacter: "*",
        onChanged: onChanged,
        onTap: onClic,
        decoration: InputDecoration(
          prefixIcon: prefix,
          suffixIcon: suffix,
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(color: darker.withOpacity(.5), fontSize: 15),
        ),
      ),
    );
  }
}
