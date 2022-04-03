


import 'dart:io';

import 'package:buttons/pages/search_page.dart';
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
  double? width;
  @override
  Widget build(BuildContext context) {
     width=MediaQuery.of(context).size.width;
    return width !>=800? Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Assis.pageTitle(
            listView: ListView(
              children: [
                for(int i=0;i<4;i++)
                  ListTile(
                    onTap:(){
                      setState(() {
                        Assis.currentPage=i;
                      });
                    },
                    title: Text(Assis.pageName[i]),
                    leading: Icon(Assis.icons[i]),
                  ),
              ],
            ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 0.9, color: Colors.grey),
              borderRadius: BorderRadius.circular(20)
            ),
            child: IndexedStack(
              children: const <Widget>[
                HomePage(),
                SearchPage(),
                NotificationPage(),
                AccountPage()
              ],
              index: Assis.currentPage,
            ),
          ),
        ),
      ],
    ):Row(
      children: [
        Container(
          width: width,
          child: IndexedStack(
            children: const <Widget>[
              HomePage(),
              SearchPage(),
              NotificationPage(),
              AccountPage()
            ],
            index: Assis.currentPage,
          ),
        ),
      ],
    );
  }
}
