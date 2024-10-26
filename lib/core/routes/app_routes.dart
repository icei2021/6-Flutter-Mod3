
import '../../src/auth/presentation/login_page.dart';
import '../../src/profile/presentation/profile_page.dart';

class AppRoutes {
  static const String login = '/login';
  static const String profile = '/profile';

  static final routes = {
    login: (context) => const LoginPage(),
    profile: (context) => const ProfilePage(),
  };
}
