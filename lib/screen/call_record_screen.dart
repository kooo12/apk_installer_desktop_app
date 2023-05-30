import 'dart:io';
import 'package:flutter/material.dart';
import 'package:install_apk/widget/drawer.dart';

class CallRecodrdScreen extends StatefulWidget {
  const CallRecodrdScreen({super.key});

  @override
  State<CallRecodrdScreen> createState() => _CallRecodrdScreenState();
}

class _CallRecodrdScreenState extends State<CallRecodrdScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerView(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Fix Call Record'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Container(
          child: Center(
            child: Column(
              children: [
                TextButton.icon(onPressed: (){
                  showDialog(context: context, builder: (context){return AlertDialog(
                    title: const Text('Magic UI 6 ?'),
                    content: const Text('Are you sure Magic UI 6?'),
                    actions: [TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Yes')),
                    TextButton(onPressed: (){Navigator.pop(context);}, child: Text('No'))],
                  );});
                }, icon: Icon(Icons.phone_android), label: Text('Honor')),

                SizedBox(height: 50,),

                TextButton.icon(onPressed: (){showHuaweiUi(context);}, icon: Icon(Icons.phone_android), label: Text('Huawei')),
                SizedBox(height: 50,),
                TextButton.icon(onPressed: (){showOppoVersion(context);}, icon: Icon(Icons.phone_android), label: Text('Oppo')),
                SizedBox(height: 50,),
                TextButton.icon(onPressed: (){}, icon: Icon(Icons.phone_android), label: Text('Vivo')),
                SizedBox(height: 50,),
                TextButton.icon(onPressed: (){}, icon: Icon(Icons.phone_android), label: Text('OnePlus')),
                SizedBox(height: 80,),
                Card(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Need to set dialer app as default in setting.',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red)),
                ))
              ],
            ),
          ),
          
        ),
      ),
    );
  }
  void installForHonor(String apkPath) async {
  bool adbExists = await Process.run('adb', ['version'])
  .then((result) => result.exitCode == 0)
  .catchError((error) => false);

  String apkPath = 'assets/apk_files/MagicUI6.apk';

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

  if (!File(apkPath).existsSync()) {
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

  ProcessResult result = await Process.run('adb', ['install', '-r', apkPath]);

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


void showHuaweiUi(context){
  showDialog(context: context, builder: (context){
    return AlertDialog(
      title: const Text('Choose your EMUI version'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(onPressed: (){}, child: Text('EMUI 9'),style: ElevatedButton.styleFrom(backgroundColor: Colors.black,foregroundColor: Colors.amberAccent),),
          SizedBox(height: 8,),
          ElevatedButton(onPressed: (){}, child: Text('EMUI 10.1'),style: ElevatedButton.styleFrom(backgroundColor: Colors.black,foregroundColor: Colors.amberAccent),),
          SizedBox(height: 8,),
          ElevatedButton(onPressed: (){}, child: Text('EMUI 11'),style: ElevatedButton.styleFrom(backgroundColor: Colors.black,foregroundColor: Colors.amberAccent),),
          SizedBox(height: 8,),
          ElevatedButton(onPressed: (){}, child: Text('EMUI 12'),style: ElevatedButton.styleFrom(backgroundColor: Colors.black,foregroundColor: Colors.amberAccent),),

        ],
      ),
    );});
}

void showOppoVersion(context){
  showDialog(context: context, builder: (context){
    return AlertDialog(
      title: const Text('Choose Android Version'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(onPressed: (){}, child: Text('Android 11'),style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 36, 153, 0),foregroundColor: Colors.white),),
          SizedBox(height: 8,),
          ElevatedButton(onPressed: (){}, child: Text('Android 12'),style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 36, 153, 0),foregroundColor: Colors.white),),
        ],
      ),
    );
  });
}




