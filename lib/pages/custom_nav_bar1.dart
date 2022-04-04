

import 'package:buttons/pages/account_page.dart';
import 'package:buttons/pages/app_body.dart';
import 'package:buttons/pages/drawer_page.dart';
import 'package:buttons/pages/home_page.dart';
import 'package:buttons/pages/notification_page.dart';
import 'package:buttons/pages/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomNavBar1 extends StatefulWidget {
   const CustomNavBar1({Key? key}) : super(key: key);

  @override
  State<CustomNavBar1> createState() => _CustomNavBar1State();
}

class _CustomNavBar1State extends State<CustomNavBar1> {

  List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    const NotificationPage(),
    const AccountPage()
  ];

  List icons = [
    Icons.home_filled,
    CupertinoIcons.search_circle_fill,
    CupertinoIcons.bell_circle_fill,
    CupertinoIcons.person_fill
  ];
  int currentPage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: const Text('developers',style: TextStyle(color: Colors.black),),
          elevation: 0,
        ),
        drawer: const Drawer(
            child: MyDrawer()),
        body: MyBody(),
        bottomNavigationBar: MediaQuery.of(context).size.width<=800?Container(
          height: 60,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for(int i=0;i<icons.length; i++)
                bottomNavBarItem(i, icons[i])
                ]
          ),
        ):null,
      ),
    );
  }

  Widget bottomNavBarItem(int i, icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          height: 2,
          width: 50,
          color: currentPage == i ? Colors.blue : Colors.white,
        ),
        IconButton(
          onPressed: () =>
              setState(() {
                currentPage = i;
              }),
          icon: Icon(icon),
          color: currentPage == i ? Colors.blue : Colors.grey,)
      ],
    );
  }

}

