import 'package:flutter/material.dart';

class customTextform extends StatelessWidget {
  customTextform({
    this.texttype,
    this.onChanged,
    this.hinttext,
    super.key,
  });
  final TextInputType? texttype;
  final ValueChanged<String>? onChanged;
  final String? hinttext;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: texttype,
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hinttext,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey))),
    );
  }
}
