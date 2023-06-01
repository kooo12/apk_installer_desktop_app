import 'dart:async';

import 'package:flutter/material.dart';

class DrawerHeaderWidget extends StatefulWidget {
  @override
  _DrawerHeaderWidgetState createState() => _DrawerHeaderWidgetState();
}

class _DrawerHeaderWidgetState extends State<DrawerHeaderWidget> {
  late Timer timer;
  late StreamController<String> textStreamController;
  late Stream<String> textStream;
  String displayedTime = 'Welcome to Installer'; // Default initial value


  @override
  void initState() {
    super.initState();
    textStreamController = StreamController<String>();
    textStream = textStreamController.stream;
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      DateTime now = DateTime.now();
      String greeting = getGreeting(now.hour);
      String formattedTime = '$greeting ${now.hour}:${now.minute}';
      setState(() {
        displayedTime = formattedTime;
      });
    });
  }

  String getGreeting(int hour) {
    if (hour >= 0 && hour < 11) {
      return 'Good Morning';
      
    } else if (hour >= 11 && hour < 16) {
      return 'Good Afternoon';
    }
    else if (hour >= 16 && hour < 20) {
      return 'Good Afternoon';
    }
     else {
      return 'Good Night';
    }
  }

  @override
  void dispose() {
    timer.cancel();
    textStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: DrawerHeader(
        decoration: BoxDecoration(
          color: Color.fromARGB(174, 151, 86, 226),
        ),
        child: Column(
            children: [
              Text(
                displayedTime,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 15,),
              ListTile(title : Text('Note :',style: TextStyle(fontWeight: FontWeight.bold),), subtitle: Text('If you want to install apks on Xiaomi devices, you need to sign in Mi Account and turn on install via USB in developer options.And then when the pop up appear, click install for each apk.',style: TextStyle(fontWeight: FontWeight.w700),),)
            ],
          ),
        ),
      );
  }
}

