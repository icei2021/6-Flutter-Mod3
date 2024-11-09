
import '../../src/auth/presentation/login_page.dart';
import '../../src/permissions/presentation/permission_page.dart';
import '../../src/profile/presentation/profile_page.dart';

class AppRoutes {
  static const String login = '/login';
  static const String profile = '/profile';
  static const String permissions = '/permissions';

  static final routes = {
    login: (context) => const LoginPage(),
    profile: (context) => const ProfilePage(),
    permissions: (context) => const PermissionPage(),
  };
}
