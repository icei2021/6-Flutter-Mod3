import 'package:fl_mod3/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../../shared/icon_button_theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          IconButtonThemeWidget(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const FlutterLogo(size: 200),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Nombre completo',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.profile,
                );
              },
              child: const Text('Ingresar'),
            ),
          ],
        ),
      ),
    );
  }
}
