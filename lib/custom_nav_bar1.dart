

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
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentPage=0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentPage],
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.white,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    _currentPage=0;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  color:Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 2,
                        width: 50,
                        color:  _currentPage==0?Colors.blue:Colors.white,
                      ),
                      Expanded(child: Center(child:Icon(Icons.home_filled,color: _currentPage==0?Colors.blue:Colors.grey,)))
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    _currentPage=1;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  color:Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 2,
                        width: 50,
                        color: _currentPage==1?Colors.blue:Colors.white,
                      ),
                      Expanded(child: Icon(CupertinoIcons.search_circle_fill,color: _currentPage==1?Colors.blue:Colors.grey,))
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    _currentPage=2;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  color:Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 2,
                        width: 50,
                        color: _currentPage==2?Colors.blue:Colors.white,
                      ),
                      Expanded(child: Icon(CupertinoIcons.bell_fill,color: _currentPage==2?Colors.blue:Colors.grey,))
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    _currentPage=3;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  color:Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 2,
                        width: 50,
                        color:  _currentPage==3?Colors.blue:Colors.white,
                      ),
                      Expanded(child: Icon(CupertinoIcons.person_fill,color: _currentPage==3?Colors.blue:Colors.grey,))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
