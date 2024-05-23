import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSubmitted;

  const SearchWidget({
    super.key,
    required this.controller,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Search Restaurant...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              8.0,
            ),
          ),
          prefixIcon: IconButton(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {
              onSubmitted(
                controller.text,
              );
            },
          ),
          contentPadding: const EdgeInsets.all(
            8,
          ),
        ),
        onSubmitted: onSubmitted,
      ),
    );
  }
}
