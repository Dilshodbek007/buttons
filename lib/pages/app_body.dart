import 'dart:io';

import 'package:buttons/pages/drawer_page.dart';
import 'package:buttons/pages/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'account_page.dart';
import 'assistants.dart';
import 'home_page.dart';
import 'notification_page.dart';

class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  List icons = [
    Icons.home_filled,
    CupertinoIcons.search_circle_fill,
    CupertinoIcons.bell_circle_fill,
    CupertinoIcons.person_fill
  ];
  List<String> pageName = [
    'Home Page',
    'Search Page',
    'Notification Page',
    'Account Page'
  ];
  double? width;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (MediaQuery.of(context).size.width > 800) const MyDrawer(),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 0.9, color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
            child: IndexedStack(
              children: const <Widget>[
                HomePage(),
                SearchPage(),
                NotificationPage(),
                AccountPage()
              ],
              index: currentPage,
            ),
          ),
        ),
      ],
    );
  }
}
