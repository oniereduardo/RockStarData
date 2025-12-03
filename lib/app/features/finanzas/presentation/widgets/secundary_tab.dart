import 'package:flutter/material.dart';

class SecundaryFilterTab extends StatelessWidget {
  const SecundaryFilterTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          // Pestaña 'Vista general' (seleccionada)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.purple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Vista general',
              style:
                  TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 8),

          // Pestañas no seleccionadas
          const Text('Ingresos y gastos', style: TextStyle(color: Colors.grey)),
          const SizedBox(width: 16),
          const Text('Márgenes', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
