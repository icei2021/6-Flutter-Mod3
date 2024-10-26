import 'package:fl_mod3/core/theme/theme_inherited_widget.dart';
import 'package:flutter/material.dart';

import 'core/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDark = false;

  @override
  Widget build(BuildContext context) {
    return ThemeInheritedWidget(
      changeTheme: () {
        _isDark = !_isDark;
        setState(() {});
      },
      isDark: _isDark,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: _isDark ? Brightness.dark : Brightness.light,
          useMaterial3: true,
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
          ),
        ),
        routes: AppRoutes.routes,
        initialRoute: AppRoutes.login,
      ),
    );
  }
}
