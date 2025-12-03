import 'package:flutter/material.dart';

class FilterButtons extends StatelessWidget {
  final String text;
  const FilterButtons({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(text),
          const Icon(Icons.arrow_drop_down, size: 20),
        ],
      ),
    );
  }
}
