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
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();
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
  bool isDrawerOn = false;
  bool isPressed = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isPressed=true;
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
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: const Text(
            'developers',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
        ),
        onEndDrawerChanged: (isOpen) {
         setState(() {
           isDrawerOn=isOpen;
         });
        },
        onDrawerChanged: (isOpen) {
          setState(() {
            isDrawerOn=isOpen;
          });
        },
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

  Widget myDrawer() {
    return SizedBox(
      width: 256,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          for (int i = 0; i < 4; i++)
            Container(
              color: isPressed?_currentPage==i?Colors.blue:Colors.white:null,
              child: ListTile(
                onTap: () {
                  setState(() {
                    _currentPage = i;
                    isPressed=true;
                  });
                  if(isDrawerOn==true) Navigator.pop(context);
                },
                title: Text(pageName[i]),
                leading: Icon(icons[i]),
              ),
            ),
        ],
      ),
    );
  }

  Widget myBody() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (MediaQuery.of(context).size.width > 800 && isDrawerOn == false)
          myDrawer(),
        if (MediaQuery.of(context).size.width > 800)
        const VerticalDivider(
          color: Colors.grey,
          thickness: 1,
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
}
