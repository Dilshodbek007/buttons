import 'package:buttons/pages/account_page.dart';
import 'package:buttons/pages/home_page.dart';
import 'package:buttons/pages/notification_page.dart';
import 'package:buttons/pages/search_page.dart';
import 'package:flutter/material.dart';

import 'pages/custom_nav_bar1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CustomNavBar1(),

      onGenerateRoute: (settings){
        if (settings.name == '/home') {
          return MaterialPageRoute(builder: (context) => HomePage());
        }

        else if(settings.name=='/search'){
          return  MaterialPageRoute(builder: (context) => SearchPage());
        }

        else if(settings.name=='/notification'){
          return  MaterialPageRoute(builder: (context) => NotificationPage());
        }

        else if(settings.name=='/account'){
          return  MaterialPageRoute(builder: (context) => AccountPage());
        }

      },
      
    );
  }
}



