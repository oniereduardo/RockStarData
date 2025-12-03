import 'package:flutter/material.dart';

class MetricCard extends StatelessWidget {
  final String title;
  final String currentValue;
  final String objective;
  final Color indicatorColor;
  final double progress; // 0.0 a 1.0 para la barra de progreso
  final String updateInfo;
  final IconData icon;

  const MetricCard({
    super.key,
    required this.title,
    required this.currentValue,
    required this.objective,
    required this.indicatorColor,
    required this.progress,
    required this.updateInfo,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título y Menú de tres puntos
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(icon, color: indicatorColor, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Icon(Icons.more_vert, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 10),

            // Valor actual
            Text(
              currentValue,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: indicatorColor,
              ),
            ),
            const SizedBox(height: 15),

            // Barra de progreso (usando LinearProgressIndicator)
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(indicatorColor),
                minHeight: 8,
              ),
            ),
            const SizedBox(height: 10),

            // Información de actualización y objetivo/límite
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  updateInfo,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  objective,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}