import 'package:apk_test/app/features/finanzas/index.dart';
import 'package:flutter/material.dart';

class Filters extends StatelessWidget {
  const Filters({super.key});

  @override
    Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            FilterButtons(text: 'Todo el holding'),
            const SizedBox(width: 8),
            FilterButtons(text: 'Este mes'),
            const SizedBox(width: 8),
            FilterButtons(text: 'Plataformas'),
          ],
        ),
      ),
    );
  }
}