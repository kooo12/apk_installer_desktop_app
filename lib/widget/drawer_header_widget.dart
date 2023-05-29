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
  String displayedTime = 'Welcome'; // Default initial value


  @override
  void initState() {
    super.initState();
    textStreamController = StreamController<String>();
    textStream = textStreamController.stream;
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      DateTime now = DateTime.now();
      String greeting = getGreeting(now.hour);
      String formattedTime = '$greeting ${now.hour}:${now.minute}';
      setState(() {
        displayedTime = formattedTime;
      });
    });
  }

  String getGreeting(int hour) {
    if (hour >= 0 && hour < 12) {
      return 'Good Morning';
      
    } else if (hour >= 12 && hour < 18) {
      return 'Good Afternoon';
    } else {
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
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Color.fromARGB(174, 151, 86, 226),
      ),
      child: Text(
        displayedTime,
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}

