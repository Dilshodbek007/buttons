

import 'package:buttons/pages/account_page.dart';
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

  List<Widget> pages=[
    const HomePage(),
    const SearchPage(),
    const NotificationPage(),
    const AccountPage()
  ];
  int _currentPage=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          children: const <Widget>[
            HomePage(),
            SearchPage(),
            NotificationPage(),
            AccountPage()
          ],
        index: _currentPage,
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            bottomNavBarItem(0,icons[0]),
            bottomNavBarItem(1,icons[1]),
            bottomNavBarItem(2,icons[2]),
            bottomNavBarItem(3,icons[3]),
          ],
        ),
      ),
    );
  }
  Widget bottomNavBarItem(int i,icon){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin:const EdgeInsets.only(bottom: 10),
          height: 2,
          width: 50,
          color:  _currentPage==i?Colors.blue:Colors.white,
        ),
        IconButton(
          onPressed: ()=> setState(() {
            _currentPage=i;
          }),
          icon: Icon(icon),color: _currentPage==i?Colors.blue:Colors.grey,)
      ],
    );
  }

  List icons=[
    Icons.home_filled,
    CupertinoIcons.search_circle_fill,
    CupertinoIcons.bell_circle_fill,
    CupertinoIcons.person_fill
  ];

}
