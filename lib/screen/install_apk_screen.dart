import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:install_apk/screen/info_screen.dart';

class InstallAPKScreen extends StatefulWidget {
  @override
  _InstallAPKScreenState createState() => _InstallAPKScreenState();
}

class _InstallAPKScreenState extends State<InstallAPKScreen> {
  List<String> apkPaths = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Install APK'),
        titleTextStyle: TextStyle(letterSpacing: 6),
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Info()));
        }, icon: Icon(Icons.info))],
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              selectAPKFiles();
            },
            child: Text('Select APK Files'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              installAPKsToDevice();
            },
            child: Text('Install APKs'),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: apkPaths.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(apkPaths[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
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
          title: Text('ADB Not Found'),
          content:
              Text('ADB is not installed or not added to the system PATH.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
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
          title: Text('No APKs Selected'),
          content: Text('Please select APK files to install.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    for (String apkPath in apkPaths) {
      ProcessResult result =
          await Process.run('adb', ['install', '-r', apkPath]);
      if (result.exitCode == 0) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Installation Successful'),
            content: Text('APK installed successfully.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Installation Failed'),
            content: Text('Failed to install APK: ${result.stderr}'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }
}
