import 'package:permission_handler/permission_handler.dart';

abstract class PermissionUtil {
  static Future<bool> hasPermission(Permission permission) async {
    PermissionStatus status = await permission.request();

    return switch (status) {
      PermissionStatus.granted => true,
      PermissionStatus.restricted => false,
      PermissionStatus.limited => true,
      PermissionStatus.permanentlyDenied => !(await openAppSettings()),
      PermissionStatus.provisional => true,
      PermissionStatus.denied => _handleDenied(permission),
    };
  }

  static Future<bool> _handleDenied(Permission permission) async {
    bool isShown = await permission.shouldShowRequestRationale;
    if (isShown) {
      final status = await permission.request();
      return status == PermissionStatus.granted;
    } else {
      return false;
    }
  }
}