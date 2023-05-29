import 'package:flutter/material.dart';

import 'drawer_header_widget.dart';

Widget drawerView(){
  return Drawer(
    child: ListView(children:  [

        LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return DrawerHeaderWidget();
            },
          ),
        ListTile(title: const Text('Xiaomi Backup Files'),onTap: (){},),
        const SizedBox(height: 10,),
        ListTile(title: const Text('Copy Files to devices'),onTap: (){},),
        const SizedBox(height: 10,),
        ListTile(title: const Text('Reboot device'),onTap: (){},),
        const SizedBox(height: 10,),
        ListTile(title: const Text('Reboot to recovery'),onTap: (){},),
        const SizedBox(height: 10,),
        ListTile(title: const Text('Reboot to bootloader'),onTap: (){},),
        
  ]),
  );
}