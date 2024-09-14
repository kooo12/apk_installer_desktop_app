import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:install_apk/controllers/device_controller.dart';

class HomeDashboard extends GetView<DeviceController> {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connected Devices'),
      ),
      body: Obx(() {
        // Use Obx to reactively update the UI when connected devices change
        var devices = controller.connectedDevices;

        if (devices.isEmpty) {
          return const Center(child: Text('No devices connected'));
        }

        return ListView.builder(
          itemCount: devices.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(devices[index]),
            );
          },
        );
      }),
    );
  }
}
