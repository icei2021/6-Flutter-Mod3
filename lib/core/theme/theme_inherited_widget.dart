import 'dart:developer';

import 'package:flutter/material.dart';

class ThemeInheritedWidget extends InheritedWidget {
  const ThemeInheritedWidget({
    super.key,
    required super.child,
    required this.changeTheme,
    required this.isDark,
  });

  final Function changeTheme;
  final bool isDark;

  static ThemeInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeInheritedWidget>()!;
    // return context.findAncestorWidgetOfExactType<ThemeInheritedWidget>()!;
  }

  @override
  bool updateShouldNotify(ThemeInheritedWidget oldWidget) {
    log('Old ${oldWidget.isDark} - New $isDark');
    return oldWidget.isDark != isDark;
  }
}
