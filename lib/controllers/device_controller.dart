import 'package:adb_command_runner/adb_command_runner.dart';
import 'package:get/get.dart';
import 'dart:async';

class DeviceController extends GetxController {
  final adbCommandRunner = AdbCommandRunner();

  // Observables for connected devices
  var connectedDevices = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    startDevicePolling();
  }

  // Function to start polling for connected devices
  void startDevicePolling() {
    // Poll every second to update connected devices
    ever(connectedDevices,
        (_) => updateConnectedDevices()); // React on every change
    updateConnectedDevices();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      updateConnectedDevices();
    });
  }

  // Function to update the list of connected devices
  Future<void> updateConnectedDevices() async {
    try {
      // Execute 'adb devices -l' to get connected devices
      String? result = await adbCommandRunner.runAdbCommand('devices -l');
      List<String> lines = result!.split('\n');
      lines.removeAt(0); // Remove the header
      lines.removeWhere((line) => line.trim().isEmpty); // Remove empty lines

      // Extract device IDs
      var devices = lines.map((line) => line.split(' ').first).toList();

      // Update the observable list
      connectedDevices.assignAll(devices);
    } catch (e) {
      print('Error running adb command: $e');
    }
  }
}
