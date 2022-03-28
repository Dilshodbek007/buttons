import 'package:buttons/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


class BottomNavbar1 extends StatefulWidget {
  const BottomNavbar1({Key? key}) : super(key: key);

  @override
  State<BottomNavbar1> createState() => _BottomNavbar1State();
}

class _BottomNavbar1State extends State<BottomNavbar1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context, screens: [
        Container(
          alignment: Alignment.center,
          child: const Text(
              'Home Page'
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text(
              'Search Page'
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text(
              'Notification Page'
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text(
              'Account Page'
          ),
        ),
      ],
        items: [
          PersistentBottomNavBarItem(
            icon: const Icon(MyFlutterApp.home,),
            activeColorPrimary: Colors.blue,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(MyFlutterApp.search,color: Colors.grey,),
            activeColorPrimary:Colors.blue,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(MyFlutterApp.bell),
            activeColorPrimary: Colors.blue,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(MyIcon.user_1),
            activeColorPrimary: Colors.blue,
            inactiveColorPrimary: Colors.grey,
          ),
        ],
        navBarStyle: NavBarStyle.style3,

      ),
    );
  }
}
