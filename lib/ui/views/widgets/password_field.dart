import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.isLastField,
    this.onChanged,
    this.errorText,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final bool isLastField;
  final Function(String)? onChanged;
  final String? errorText;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      onChanged: widget.onChanged,
      controller: widget.controller,
      obscureText: _obscureText,
      textInputAction:
          widget.isLastField ? TextInputAction.done : TextInputAction.next,
      decoration: InputDecoration(
        errorText: widget.errorText,
        suffixIcon: InkWell(
          onTap: _toggle,
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
            size: 20,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 2.5,
            color: Color(0xFF2290DF),
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
