import 'package:flutter/material.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.isLastField,
    required this.inputType,
    this.onChanged,
    this.suffixIcon,
    this.errorText,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final bool isLastField;
  final TextInputType inputType;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      controller: controller,
      onChanged: onChanged,
      keyboardType: inputType,
      textInputAction:
          isLastField ? TextInputAction.done : TextInputAction.next,
      decoration: InputDecoration(
        errorText: errorText,
        hintStyle: const TextStyle(color: Colors.black),
        hintText: hintText,
        suffixIcon: suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 2.5,
            style: BorderStyle.none,
            color: Color(0xFF2290DF),
          ),
        ),
      ),
    );
  }
}
