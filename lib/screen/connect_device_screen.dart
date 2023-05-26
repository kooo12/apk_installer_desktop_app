import 'package:flutter/material.dart';
import 'package:usb_serial/usb_serial.dart';

class ConnectedDevicesScreen extends StatefulWidget {
  @override
  _ConnectedDevicesScreenState createState() => _ConnectedDevicesScreenState();
}

class _ConnectedDevicesScreenState extends State<ConnectedDevicesScreen> {
  List<UsbDevice> connectedDevices = [];

  @override
  void initState() {
    super.initState();
    getConnectedDevices();
  }

  Future<void> getConnectedDevices() async {
    List<UsbDevice> devices = await UsbSerial.listDevices();
    setState(() {
      connectedDevices = devices;
    });
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
          UsbDevice device = connectedDevices[index];
          return ListTile(
            title: Text(device.productName ?? 'Unknown Device'),
            subtitle: Text(device.manufacturerName ?? 'Unknown Manufacturer'),
            onTap: () {
              // Handle device selection
            },
          );
        },
      ),
    );
  }
}
