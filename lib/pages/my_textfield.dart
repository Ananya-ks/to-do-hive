import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  // const MyTextField({super.key});
  final controller;
  final String hintText;
  final bool obsecureText;
  final String obscuringCharacter;
  final IconData prefixIconData;
  final Color prefixIconColor;
  final double fontSize;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obsecureText,
    required this.obscuringCharacter,
    required this.prefixIconData,
    required this.prefixIconColor,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final FocusNode _focusNode = FocusNode();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: TextField(
        onTapOutside: (event) => {_focusNode.unfocus()},
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(20.0),
            ),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(
              prefixIconData,
              color: prefixIconColor,
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.bold,
            )),
        obscureText: obsecureText,
        obscuringCharacter: obscuringCharacter,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }
}



