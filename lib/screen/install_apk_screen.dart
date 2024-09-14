import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:install_apk/controllers/install_apk_controller.dart';
import 'package:install_apk/screen/info_screen.dart';

class InstallAPKScreen extends StatelessWidget {
  final InstallAPKController controller = Get.put(InstallAPKController());

  InstallAPKScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Install APK'),
        titleTextStyle: const TextStyle(letterSpacing: 6),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const Info());
            },
            icon: const Icon(Icons.info),
          )
        ],
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: controller.selectAPKFiles,
            child: const Text('Select APK Files'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => controller.installAPKsToDevice(context),
            child: const Text('Install APKs'),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.apkPaths.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(controller.apkPaths[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => controller.removeAPK(index),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
