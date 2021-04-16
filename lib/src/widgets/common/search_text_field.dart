import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField(this.controller);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(14),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        hintText: 'Search here...',
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}
