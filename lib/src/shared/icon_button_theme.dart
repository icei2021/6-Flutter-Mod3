import 'package:fl_mod3/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IconButtonThemeWidget extends StatelessWidget {
  const IconButtonThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<ThemeProvider>().changeTheme();
      },
      icon: Icon(
        context.watch<ThemeProvider>().isDark
            ? Icons.light_mode
            : Icons.dark_mode,
      ),
    );
  }
}
