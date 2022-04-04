


import 'package:buttons/pages/search_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'account_page.dart';
import 'home_page.dart';
import 'notification_page.dart';


class CustomNavBar1 extends StatefulWidget {
   const CustomNavBar1({Key? key}) : super(key: key);

  @override
  State<CustomNavBar1> createState() => _CustomNavBar1State();
}

class _CustomNavBar1State extends State<CustomNavBar1> {

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
  int _currentPage = 0;

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
        drawer:  Drawer(
            child: MediaQuery.of(context).size.width<=800?myDrawer():null),
        body:  myBody(),
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


//yordamchi funksiyalar
  Widget bottomNavBarItem(int i, icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          height: 2,
          width: 50,
          color:_currentPage == i ? Colors.blue : Colors.white,
        ),
        IconButton(
          onPressed: () =>
              setState(() {
                _currentPage = i;
              }),
          icon: Icon(icon),
          color: _currentPage == i ? Colors.blue : Colors.grey,)
      ],
    );
  }
  Widget myDrawer() {
    return Container(
      width: 200,
      decoration: const BoxDecoration(
          border: Border(
              right: BorderSide(
                color: Colors.grey,
                width: .8,
              ))),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          for (int i = 0; i < 4; i++)
            ListTile(
              onTap: () {
                setState(() {
                 _currentPage = i;
                });
              },
              title: Text(pageName[i]),
              leading: Icon(icons[i]),
            ),
        ],
      ),
    );
  }
  Widget myBody(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (MediaQuery.of(context).size.width > 800) myDrawer(),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 0.9, color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
            child: IndexedStack(
              children:  <Widget>[
                HomePage(),
                SearchPage(),
                NotificationPage(),
                AccountPage()
              ],
              index: _currentPage,
            ),
          ),
        ),
      ],
    );
  }
}









