

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNavBar1 extends StatefulWidget {
  const CustomNavBar1({Key? key}) : super(key: key);

  @override
  State<CustomNavBar1> createState() => _CustomNavBar1State();
}

class _CustomNavBar1State extends State<CustomNavBar1> {

  List<Widget> pages=[
    Container(
      color: Colors.white,
      child: const Center(
        child: Text('Home Page'),
      ),
    ),
    Container(
      color: Colors.white,
      child: const Center(
        child: Text('Search Page'),
      ),
    ),
    Container(
      color: Colors.white,
      child: const Center(
        child: Text('Notification Page'),
      ),
    ),
    Container(
      color: Colors.white,
      child: const Center(
        child: Text('Account Page'),
      ),
    ),
  ];
  int _currentPage=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentPage],
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            bottomNavBarItem(0, Icons.home_filled),
            bottomNavBarItem(1, CupertinoIcons.search_circle_fill),
            bottomNavBarItem(2, CupertinoIcons.bell_circle_fill),
            bottomNavBarItem(3, CupertinoIcons.person_fill),
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
}
