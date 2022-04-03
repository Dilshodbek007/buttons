

import 'package:buttons/pages/home_page.dart';
import 'package:buttons/pages/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Assis{
  static List icons = [
    Icons.home_filled,
    CupertinoIcons.search_circle_fill,
    CupertinoIcons.bell_circle_fill,
    CupertinoIcons.person_fill
  ];
 static List<String> pageName=[
    'Home Page',
    'Search Page',
    'Notification Page',
    'Account Page'
  ];
  static  int? currentPage = 1;

  static Widget pageTitle({required ListView listView}) {
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
      child: listView,
    );
  }
}