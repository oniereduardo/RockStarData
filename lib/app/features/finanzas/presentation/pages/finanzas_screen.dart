import 'package:apk_test/app/features/finanzas/index.dart';
import 'package:flutter/material.dart';

class FinanzasScreen extends StatelessWidget {
  const FinanzasScreen({super.key});

  // Datos Estáticos para las métricas
  static final List<Map<String, dynamic>> metricData = [
    {
      'title': 'Margen Bruto',
      'currentValue': '€€€',
      'objective': 'Objetivo €€€',
      'indicatorColor': Colors.green,
      'progress': 0.75, // 75%
      'updateInfo': 'Actualizado hace 2 días',
      'icon': Icons.check_circle_outline,
    },
    {
      'title': 'BNI',
      'currentValue': '€€€',
      'objective': 'Objetivo €€€',
      'indicatorColor': Colors.orange,
      'progress': 0.40, // 40%
      'updateInfo': 'Actualizado hace 2 días',
      'icon': Icons.error_outline,
    },
    {
      'title': 'Ratio de aprovisionamiento',
      'currentValue': '20%',
      'objective': 'Límite 20%',
      'indicatorColor': Colors.lightGreen,
      'progress': 0.90, // 90%
      'updateInfo': 'Actualizado hace 2 días',
      'icon': Icons.check_circle_outline,
    },
    {
      'title': 'Ratio de personal',
      'currentValue': '28%',
      'objective': 'Límite 30%',
      'indicatorColor': Colors.deepOrange,
      'progress': 0.93, // 93%
      'updateInfo': 'Actualizado hace 4 días',
      'icon': Icons.warning_amber_rounded,
    },
  ];

  // Widget para las pestañas secundarias (Vista general, Ingresos...)
  Widget _buildSecondaryTabs() {
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

  // Widget para los filtros (Todo el holding, Este mes, Plataformas)
  Widget _buildFilters() {
    // Función auxiliar para los botones de filtro
    Widget filterButton(String text) {
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            filterButton('Todo el holding'),
            const SizedBox(width: 8),
            filterButton('Este mes'),
            const SizedBox(width: 8),
            filterButton('Plataformas'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(18)),
              child: Text(
                '€',
                style: const TextStyle(
                    fontSize: 24,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 6,
            ),
            const Text(
              'Finanzas',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 24),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person_outline, color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFilters(),
            _buildSecondaryTabs(),
            const SizedBox(height: 10),
            ...metricData.map((data) {
              return MetricCard(
                title: data['title'] as String,
                currentValue: data['currentValue'] as String,
                objective: data['objective'] as String,
                indicatorColor: data['indicatorColor'] as Color,
                progress: data['progress'] as double,
                updateInfo: data['updateInfo'] as String,
                icon: data['icon'] as IconData,
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
