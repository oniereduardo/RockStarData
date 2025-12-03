import 'package:apk_test/app/core/config/extensiones.dart';
import 'package:apk_test/app/features/finanzas/index.dart';
import 'package:flutter/material.dart';

class FinanzasScreen extends StatelessWidget {
  const FinanzasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Container(
                  height: 5.0.hp(context),
                  width: 10.0.wp(context),
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(24)),
                  child: Center(
                    child: Text(
                      '€',
                      style: TextStyle(
                        fontSize: 24.0.sp(context),
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
          ),
          Filters(),
          SecundaryFilterTab(),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
                child: Column(
              children: [
                ...metricData.map(
                  (data) {
                    return MetricCard(
                      title: data['title'] as String,
                      currentValue: data['currentValue'] as String,
                      objective: data['objective'] as String,
                      indicatorColor: data['indicatorColor'] as Color,
                      progress: data['progress'] as double,
                      updateInfo: data['updateInfo'] as String,
                      icon: data['icon'] as IconData,
                    );
                  },
                ),
              ],
            )),
          )
        ],
      ),
    );
  }

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
}
