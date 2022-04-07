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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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

  double menuWidth = 256;

  bool isPressed = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              if (MediaQuery.of(context).size.width <= 800) {
                _scaffoldKey.currentState?.openDrawer();
                setState(() {
                  menuWidth = 256;
                });
              } else {
                if (menuWidth == 256) {
                  setState(() {
                    menuWidth = 64;
                  });
                } else {
                  setState(() {
                    menuWidth = 256;
                  });
                }
              }
            },
            icon: const Icon(Icons.menu),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: const Text(
            'developers',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 1.2,
        ),
        drawer: Drawer(
          child: myDrawer(),
        ),
        body: myBody(),
        bottomNavigationBar: MediaQuery.of(context).size.width <= 800
            ? Container(
                height: 60,
                color: Colors.white,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (int i = 0; i < icons.length; i++)
                        bottomNavBarItem(i, icons[i])
                    ]),
              )
            : null,
      ),
    );
  }

  //yordamchi funksiyalar
  //body
  Widget myBody() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (MediaQuery.of(context).size.width > 800) myDrawer(),
        if (MediaQuery.of(context).size.width > 800)
          const VerticalDivider(
            color: Colors.grey,
            thickness: 0.4,
          ),
        Flexible(
          child: IndexedStack(
            children: <Widget>[
              HomePage(),
              SearchPage(),
              NotificationPage(),
              AccountPage()
            ],
            index: _currentPage,
          ),
        ),
      ],
    );
  }

  //drawer
  Widget myDrawer() {
    return AnimatedContainer(
      width: menuWidth,
      duration: Duration(milliseconds: 256),
      child: ListView(
        shrinkWrap: true,
        children: [
          for (int i = 0; i < 4; i++)
            menuWidth == 256
                ? InkWell(
                    onTap: () {
                      setState(() {
                        _currentPage=i;
                      });
                      if(_currentPage==0) {
                        Navigator.pushNamed(context,'home/1');
                      }else if(_currentPage==1){
                        Navigator.pushNamed(context, 'search/1');
                      }else if(_currentPage==2){
                        Navigator.pushNamed(context, 'notification/1');
                      }else if(_currentPage==3){
                        Navigator.pushNamed(context, 'user/1');
                      }
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 50,
                      color: _currentPage==i?Color(0xFFE3F2FD):null,
                      child: ListView(
                        padding: EdgeInsets.all(10),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          Icon(
                            icons[i],
                            color: _currentPage==i? Colors.blue:Colors.grey,
                          ),
                          SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(pageName[i],style: TextStyle(
                              color: _currentPage==i?Colors.blue:Colors.black,
                            ),),
                          ),
                        ],
                      ),
                    ),
                  )
                : Icon(
                    icons[i],
                    color: Colors.grey,
                  ),
        ],
      ),
    );
  }

  //bottomNavBar
  Widget bottomNavBarItem(int i, icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          height: 2,
          width: 50,
          color: _currentPage == i ? Colors.blue : Colors.white,
        ),
        IconButton(
          onPressed: () => setState(() {
            _currentPage = i;
          }),
          icon: Icon(icon),
          color: _currentPage == i ? Colors.blue : Colors.grey,
        )
      ],
    );
  }
}
