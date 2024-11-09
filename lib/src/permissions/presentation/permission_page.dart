import 'package:fl_mod3/core/utils/location_util.dart';
import 'package:flutter/material.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({super.key});

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permisos'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              getLocation();
            },
            child: const Text('Ubicacion'),
          ),
          Text(
            result,
            style: const TextStyle(fontSize: 82),
          ),
        ],
      ),
    );
  }

  Future<void> getLocation() async {
    
    final locationResp = await LocationUtil.getLocation();
    if (locationResp.error != null) {
      result = 'Error ${locationResp.error}';
    }

    if (locationResp.location != null) {
      result =
          'Ubicacion ${locationResp.location!.latitude} ${locationResp.location!.longitude}';
    }

    setState(() {});
  }
}
