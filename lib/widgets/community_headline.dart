import 'package:flutter/material.dart';

class CategoryHeadline extends StatelessWidget {
  const CategoryHeadline({
    Key? key,
    required this.category,
  }) : super(key: key);
  final String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        top: 16.0,
      ),
      child: Text(
        category,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}