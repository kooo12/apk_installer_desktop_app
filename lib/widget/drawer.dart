import 'dart:io';
import 'package:flutter/material.dart';
import 'drawer_header_widget.dart';


String apkPathChinaMarket = 'assets/apk_files/yingyonghui.market.apk';

Widget drawerView(BuildContext context){
  return Drawer(
    child: ListView(children:  [
        LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return DrawerHeaderWidget();
            },
          ),
        ListTile(title: const Text('Install China App Market'),onTap: (){installChinaMarket(apkPathChinaMarket,context);},),
        const SizedBox(height: 10,),
        ListTile(title: const Text('Reboot device'),onTap: ()async{Process.run('adb', ['reboot']);},),
        const SizedBox(height: 10,),
        ListTile(title: const Text('Reboot to recovery'),onTap: ()async {await Process.run('adb', ['reboot','recovery']);},),
        const SizedBox(height: 10,),
        ListTile(title: const Text('Reboot to bootloader'),onTap: ()async{await Process.run('adb', ['reboot','-bootloader']);},),
        
  ]),
  );
}

void installChinaMarket(String apkPathChinaMarket , BuildContext context) async {
  bool adbExists = await Process.run('adb', ['version'])
  .then((result) => result.exitCode == 0)
  .catchError((error) => false);


  if (!adbExists) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('ADB Not Found'),
          content: Text('ADB is not installed or not added to the system PATH.'),
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

  if (!File(apkPathChinaMarket).existsSync()) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Your File is damage.'),
          content: Text('Please contact to Developer.'),
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

  ProcessResult result = await Process.run('adb', ['install', '-r', apkPathChinaMarket]);

  if (result.exitCode == 0) {
    showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Installation Successful'),
            content: Text('Now change dialer as defalut app.'),
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