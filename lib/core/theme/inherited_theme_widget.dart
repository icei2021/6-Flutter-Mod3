import 'package:flutter/material.dart';

class InheritedThemeWidget extends InheritedWidget {
  const InheritedThemeWidget({super.key, required super.child});
  
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
