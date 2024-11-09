import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

import 'permission_util.dart';

abstract class LocationUtil {
  static final Location _location = Location();

  static Future<bool> _serviceIsEnable() async {
    final serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      return await _location.requestService();
    }
    return true;
  }
  

  static Future<({LocationData? location, String? error})> getLocation() async {
    final isServiceEnable = await _serviceIsEnable();
    final hasPermission = await PermissionUtil.hasPermission(ph.Permission.location);

    if (isServiceEnable && hasPermission) {
      final location = await _location.getLocation();
      return (location: location, error: null as String?);
    } else {
      return (
        location: null,
        error: !isServiceEnable ? 'Servicio deshabilitado' : 'Sin permisos'
      );
    }
  }
}
