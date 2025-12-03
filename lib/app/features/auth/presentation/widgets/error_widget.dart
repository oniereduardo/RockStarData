import 'package:apk_test/app/core/index.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMessage;
  final String? errorTitle;
  final VoidCallback onRetry;
  final bool showRetryButton;

  const ErrorScreen({
    super.key,
    required this.errorMessage,
    this.errorTitle,
    required this.onRetry,
    this.showRetryButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Ilustración de error
          _buildErrorIllustration(context),

          const SizedBox(height: 32),

          // Título del error
          if (errorTitle != null)
            Text(
              errorTitle!,
              style: theme.textTheme.headlineMedium?.copyWith(
                color: AppColor.red,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),

          if (errorTitle != null) const SizedBox(height: 8),

          // Mensaje de error
          Text(
            errorMessage,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: AppColor.textLight,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 40),

          // Botón de reintentar
          if (showRetryButton) _buildRetryButton(context, onRetry),

          const SizedBox(height: 16),

          // Botón de regresar (opcional)
          TextButton(
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
                // Si no se puede hacer pop, redirigir al inicio
                // Esto depende de tu configuración de rutas
              }
            },
            child: Text(
              'Regresar',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: AppColor.primaryDark,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorIllustration(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.5;

    return Icon(
      Icons.error_outline_rounded,
      size: size,
      color: AppColor.error.withOpacity(0.7),
    );
  }
}

Widget _buildRetryButton(BuildContext context, VoidCallback onRetry) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onRetry,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.refresh_rounded, size: 20),
          const SizedBox(width: 8),
          Text(
            'Reintentar',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    ),
  );
}
