import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField(
    this.controller, {
    this.hintText = 'Search here...',
    this.hintStyle,
  });

  final TextEditingController controller;
  final String hintText;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(14),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}
