import 'dart:developer';

import 'package:fl_mod3/core/theme/theme_inherited_widget.dart';
import 'package:flutter/material.dart';

class IconButtonThemeWidget extends StatelessWidget {
  const IconButtonThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeInheritedWidget.of(context);
    log('Theme isDark ${theme.isDark}');

    return IconButton(
      onPressed: () {
        theme.changeTheme();
      },
      icon: Icon(
        theme.isDark
            ? Icons.light_mode
            : Icons.dark_mode,
      ),
    );
  }
}
