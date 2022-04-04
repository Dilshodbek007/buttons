

import 'package:buttons/pages/custom_nav_bar1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'assistants.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int currentPage = 0;
  List<String> pageName=[
    'Home Page',
    'Search Page',
    'Notification Page',
    'Account Page'
  ];
  List icons = [
    Icons.home_filled,
    CupertinoIcons.search_circle_fill,
    CupertinoIcons.bell_circle_fill,
    CupertinoIcons.person_fill
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: const BoxDecoration(
          border: Border(
              right: BorderSide(
                color: Colors.grey,
                width: .8,
              )
          )
      ),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        children: [
          for(int i=0;i<4;i++)
            ListTile(
              onTap:(){
                setState(() {
                  currentPage=i;
                });
              },
              title: Text(pageName[i]),
              leading: Icon(icons[i]),
            ),
        ],
      ),
    );
  }
}
