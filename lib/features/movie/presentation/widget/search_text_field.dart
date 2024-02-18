import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.suffixIcon,
    required this.controller,
    this.onSubmitted,
  });

  final Widget? suffixIcon;
  final TextEditingController controller;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Pencarian',
        suffixIcon: suffixIcon,
        fillColor: Colors.white,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFBCBCBC)),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      textInputAction: TextInputAction.search,
      onFieldSubmitted: onSubmitted,
    );
  }
}
