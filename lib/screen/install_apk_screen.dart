import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:install_apk/screen/connect_device_screen.dart';
import 'package:install_apk/widget/drawer.dart';


class InstallAPKScreen extends StatefulWidget {
  const InstallAPKScreen({super.key});

  @override
  _InstallAPKScreenState createState() => _InstallAPKScreenState();
}

class _InstallAPKScreenState extends State<InstallAPKScreen> {
  List<String> apkPaths = [];
  double installationProgress = 0;
  bool installing = false;
  bool installationComplete = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerView(context),
      appBar: AppBar(
        title: const Text('Installation'),
        titleTextStyle: const TextStyle(letterSpacing: 6),
        
      ),
      body: Container(
        decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/light.jpg'),fit: BoxFit.cover),
        
      ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (cont) => ConnectedDevicesScreen()));
                        },
                        icon: const Icon(Icons.phone_android),
                        label: const Text('Conected Devices'),
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                        ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        selectAPKFiles();
                      },
                      child: const Text('Select APK Files'),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                installAPKsToDevice();
              },
              child: const Text('Install APKs'),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
            ),
            const SizedBox(height: 10),
            Container(
              child: Column(
                children: [
                  if (installing)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 20, 50),
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.blue,
                        minHeight: 5,
                        value: installationProgress,
                      ),
                    ),
                  if (installationComplete)
                    const Card(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Done',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ))
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: apkPaths.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(apkPaths[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          removeAPK(index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void selectAPKFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['apk'],
    );

    if (result != null && result.files.isNotEmpty) {
      List<String> paths = result.files.map((file) => file.path!).toList();
      setState(() {
        apkPaths.addAll(paths);
      });
    }
  }

  void removeAPK(int index) {
    setState(() {
      apkPaths.removeAt(index);
    });
  }

  void installAPKsToDevice() async {
    bool adbExists = await Process.run('adb', ['version'])
        .then((result) => result.exitCode == 0)
        .catchError((error) => false);

    if (!adbExists) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('ADB Not Found'),
          content: const Text(
              'ADB is not installed or not added to the system PATH.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    if (apkPaths.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('No APKs Selected'),
          content: const Text('Please select APK files to install.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }
    int totalApks = apkPaths.length;
    int installedApks = 0;
    installing = true;
    installationComplete = false;
    setState(() {});

    for (String apkPath in apkPaths) {
      ProcessResult result =
          await Process.run('adb', ['install', '-r', apkPath]);
      if (result.exitCode == 0) {
        installedApks++;
      } else {
        installedApks++;
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Installation Failed'),
            content: Text('Failed to install APK: ${result.stderr}'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
      double progress = installedApks / totalApks;
      setState(() {
        installationProgress = progress;
      });
    }
    installing = false;
    installationComplete = true;
    setState(() {});
  }
}
