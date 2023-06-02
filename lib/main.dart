import 'package:flutter/material.dart';
import 'package:install_apk/screen/call_record_screen.dart';
import 'package:install_apk/screen/info_screen.dart';
import 'screen/install_apk_screen.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
        icon: Icon(Icons.install_mobile), label: 'Installer'),
    BottomNavigationBarItem(
        icon: Icon(Icons.record_voice_over), label: 'Call Record'),
    BottomNavigationBarItem(
        icon: Icon(Icons.info_outlined), label: 'Info'),
  ];
  int _index = 0;
  Widget _body = InstallAPKScreen();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter Desktop App',
      theme: ThemeData.dark(),
      
      home: Scaffold(
        body: _body,
        bottomNavigationBar: BottomNavigationBar(
          
          type: BottomNavigationBarType.fixed,
          currentIndex: _index,
          items: _items,
          onTap: (int index) {
            setState(() {
               _index = index;
            if(index == 0){_body = InstallAPKScreen();}
            else if (index == 1){_body = CallRecodrdScreen();}
            else if (index == 2){_body = Info();}
            });
           
          },
          )),
    );
  }
}
