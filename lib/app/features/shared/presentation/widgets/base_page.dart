import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasePage extends StatelessWidget {
  final Widget body;
  final String? title;
  final Color? backgroundColor;
  final Color? appBarColor;
  final List<Widget>? actions;
  final Widget? leading;
  final bool showAppBar;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? drawer;

  const BasePage({
    super.key,
    required this.body,
    this.title,
    this.backgroundColor,
    this.appBarColor,
    this.actions,
    this.leading,
    this.showAppBar = true,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.drawer,
  });

  @override
  Widget build(BuildContext context) {
    // Configurar el color de la status bar
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      drawer: drawer,
      body: SafeArea(
        child: body,
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
