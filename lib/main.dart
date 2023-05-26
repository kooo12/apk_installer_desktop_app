import 'package:flutter/material.dart';
import 'screen/install_apk_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Desktop App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: InstallAPKScreen(),
    );
  }
}