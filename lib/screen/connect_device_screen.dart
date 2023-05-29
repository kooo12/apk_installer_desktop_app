import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

class ConnectedDevicesScreen extends StatefulWidget {
  @override
  _ConnectedDevicesScreenState createState() => _ConnectedDevicesScreenState();
}

class _ConnectedDevicesScreenState extends State<ConnectedDevicesScreen> {
  List<String> connectedDevices = [];

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startDevicePolling();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startDevicePolling() {
    // Start a timer to periodically check for connected devices
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      updateConnectedDevices();
    });
  }

  Future<void> updateConnectedDevices() async {
    try {
      List<String> devices = await getConnectedDevices();
      setState(() {
        connectedDevices = devices;
      });
    } catch (error) {
      print('Failed to get connected devices: $error');
    }
  }

  Future<List<String>> getConnectedDevices() async {
    ProcessResult result = await Process.run('adb', ['devices','-l']);
    if (result.exitCode == 0) {
      String output = result.stdout;
      List<String> lines = LineSplitter.split(output).toList();
      lines.removeAt(0);
      lines.removeWhere((line) => line.trim().isEmpty);
      List<String> devices = lines.map((line) {
        return line.split('\t').first;
      }).toList();
      return devices;
    } else {
      throw Exception('Failed to get connected devices');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connected Devices'),
      ),
      body: ListView.builder(
        itemCount: connectedDevices.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(connectedDevices[index]),
            
          );
        },
      ),
    );
  }
}
