

import 'package:buttons/pages/custom_nav_bar1.dart';
import 'package:flutter/material.dart';

import 'assistants.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
        child: Assis.pageTitle(
          listView: ListView(
            children: [
              for(int i=0;i<4;i++)
                ListTile(
                  onTap:(){
                    setState(() {
                      Assis.currentPage=i;
                    });
                  },
                  title: Text(Assis.pageName[i]),
                  leading: Icon(Assis.icons[i]),
                ),
            ],
          ),
        ),
      )
    );
  }
}
