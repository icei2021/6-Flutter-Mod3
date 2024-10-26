import 'package:flutter/material.dart';

import '../../shared/icon_button_theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        actions: const [
          IconButtonThemeWidget(),
        ],
      ),
    );
  }
}
