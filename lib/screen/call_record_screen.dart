import 'dart:io';
import 'package:flutter/material.dart';
import 'package:install_apk/widget/drawer.dart';

class CallRecodrdScreen extends StatefulWidget {
  const CallRecodrdScreen({super.key});

  @override
  State<CallRecodrdScreen> createState() => _CallRecodrdScreenState();
}

class _CallRecodrdScreenState extends State<CallRecodrdScreen> {
  String apkPathHonor = 'assets/apk_files/MagicUI6.apk';
  String apkPathEmui9 = 'assets/apk_files/EMUI9.apk';
  String apkPathEmui10 = 'assets/apk_files/EMUI10.1.apk';
  String apkPathEmui11 = 'assets/apk_files/EMUI 11.apk';
  String apkPathEmui12 = 'assets/apk_files/EMUI 12.apk';
  String apkPathOppo11 = 'assets/apk_files/base.apk';
  String apkPathOppo12 = 'assets/apk_files/Coloros12 dialer.apk';
  String apkPathOppoSecond12 = 'assets/apk_files/OnePlus_Dailer.apk';
  String apkPathRealme = 'assets/apk_files/OnePlus_Dailer.apk';
  String apkPathVivo = 'assets/apk_files/OnePlus_Dailer.apk';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerView(context),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Fix Call Record'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Container(
            child: Center(
              child: Column(
                children: [
                  TextButton.icon(onPressed: (){
                    showDialog(context: context, builder: (context){return AlertDialog(
                      title: const Text('Magic UI 6 ?'),
                      content: const Text('Are you sure Magic UI 6?'),
                      actions: [TextButton(onPressed: (){installForHonor(apkPathHonor);Navigator.pop(context);}, child: Text('Yes')),
                      TextButton(onPressed: (){Navigator.pop(context);}, child: Text('No'))],
                    );});
                  }, icon: Icon(Icons.phone_android), label: Text('Honor')),
      
                  SizedBox(height: 50,),
      
                  TextButton.icon(onPressed: (){showHuaweiUi(context);}, icon: Icon(Icons.phone_android), label: Text('Huawei')),
                  SizedBox(height: 50,),
                  TextButton.icon(onPressed: (){showOppoVersion(context);}, icon: Icon(Icons.phone_android), label: Text('Oppo')),
                  SizedBox(height: 50,),
                  TextButton.icon(onPressed: (){installForVivo(apkPathVivo);}, icon: Icon(Icons.phone_android), label: Text('Vivo')),
                  SizedBox(height: 50,),
                  TextButton.icon(onPressed: (){installForRealme(apkPathRealme);}, icon: Icon(Icons.phone_android), label: Text('Realme')),
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
      ),
    );
  }


void showHuaweiUi(context){
  showDialog(context: context, builder: (context){
    return AlertDialog(
      title: const Text('Choose your EMUI version'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(onPressed: (){installForEmui9(apkPathEmui9);}, child: Text('EMUI 9'),style: ElevatedButton.styleFrom(backgroundColor: Colors.black,foregroundColor: Colors.amberAccent),),
          SizedBox(height: 8,),
          ElevatedButton(onPressed: (){installForEmui10(apkPathEmui10);}, child: Text('EMUI 10.1'),style: ElevatedButton.styleFrom(backgroundColor: Colors.black,foregroundColor: Colors.amberAccent),),
          SizedBox(height: 8,),
          ElevatedButton(onPressed: (){installForEmui11(apkPathEmui11);}, child: Text('EMUI 11'),style: ElevatedButton.styleFrom(backgroundColor: Colors.black,foregroundColor: Colors.amberAccent),),
          SizedBox(height: 8,),
          ElevatedButton(onPressed: (){installForEmui12(apkPathEmui12);}, child: Text('EMUI 12'),style: ElevatedButton.styleFrom(backgroundColor: Colors.black,foregroundColor: Colors.amberAccent),),

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
          ElevatedButton(onPressed: (){installForOppo11(apkPathOppo11);}, child: Text('Android 11'),style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 36, 153, 0),foregroundColor: Colors.white),),
          SizedBox(height: 8,),
          ElevatedButton(onPressed: (){showSelectFileOppo12(context);}, child: Text('Android 12'),style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 36, 153, 0),foregroundColor: Colors.white),),
        ],
      ),
    );
  });
}

void showSelectFileOppo12(context){
  showDialog(context: context, builder: (context){
    return AlertDialog(
      title: const Text('Choose method'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(onPressed: (){installForOppoMethod1(apkPathOppo12);Navigator.pop(context);}, child: Text('Method 1')),
          SizedBox(height: 8,),
          TextButton(onPressed: (){installForOppoMethod2(apkPathOppoSecond12);Navigator.pop(context);}, child: Text('Method 2')),
        ],
      ),
    );
  });
}

void installForHonor(String apkPathHonor) async {
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

  if (!File(apkPathHonor).existsSync()) {
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

  ProcessResult result = await Process.run('adb', ['install', '-r', apkPathHonor]);

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

  void installForEmui9(String apkPathEmui9) async {
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

  if (!File(apkPathEmui9).existsSync()) {
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

  ProcessResult result = await Process.run('adb', ['install', '-r', apkPathEmui9]);

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

  void installForEmui10(String apkPathEmui10) async {
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

  if (!File(apkPathEmui10).existsSync()) {
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

  ProcessResult result = await Process.run('adb', ['install', '-r', apkPathEmui10]);

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

    void installForEmui11(String apkPathEmui11) async {
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

  if (!File(apkPathEmui11).existsSync()) {
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

  ProcessResult result = await Process.run('adb', ['install', '-r', apkPathEmui11]);

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

    void installForEmui12(String apkPathEmui12) async {
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

  if (!File(apkPathEmui12).existsSync()) {
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

  ProcessResult result = await Process.run('adb', ['install', '-r', apkPathEmui12]);

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

    void installForOppo11(String apkPathOppo11) async {
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

  if (!File(apkPathOppo11).existsSync()) {
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

  ProcessResult result = await Process.run('adb', ['install', '-r', apkPathOppo11]);

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

    void installForOppoMethod1(String apkPathOppo12) async {
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

  if (!File(apkPathOppo12).existsSync()) {
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

  ProcessResult result = await Process.run('adb', ['install', '-r', apkPathOppo12]);

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

    void installForOppoMethod2(String apkPathOppoSecond12) async {
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

  if (!File(apkPathOppoSecond12).existsSync()) {
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

  ProcessResult result = await Process.run('adb', ['install', '-r', apkPathOppoSecond12]);

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

    void installForRealme(String apkPathRealme) async {
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

  if (!File(apkPathRealme).existsSync()) {
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

  ProcessResult result = await Process.run('adb', ['install', '-r', apkPathRealme]);

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

    void installForVivo(String apkPathVivo) async {
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

  if (!File(apkPathVivo).existsSync()) {
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

  ProcessResult result = await Process.run('adb', ['install', '-r', apkPathVivo]);

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

  }