import 'package:flutter/material.dart';

Widget drawerView(){
  return Drawer(
    child: ListView(children:  [
        const DrawerHeader(
        decoration: BoxDecoration(color: Color.fromARGB(155, 195, 168, 230)),
        child: Text('Selected devices',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))),
        ListTile(title: const Text('Reboot device'),onTap: (){},),
        SizedBox(height: 10,),
        ListTile(title: const Text('Reboot to recovery'),onTap: (){},),
        SizedBox(height: 10,),
        ListTile(title: const Text('Reboot to bootloader'),onTap: (){},),
  ]),
  );
}