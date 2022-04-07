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
      onGenerateRoute: (settings) {
        // Handle '/'
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => CustomNavBar1());
        }
        // Handle '/details/:id'
        var uri = Uri.parse(settings.name!);

        if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'home') {
          var id = uri.pathSegments[1];
          return MaterialPageRoute(builder: (context) => HomePage(id: id));

        }

        else if(uri.pathSegments.length==2 && uri.pathSegments.first=='search'){
          var id=uri.pathSegments[1];
          return MaterialPageRoute(builder: (context)=> SearchPage(id: id));
        }

        else if(uri.pathSegments.length==2 && uri.pathSegments.first=='notification'){
          var id=uri.pathSegments[1];
          return MaterialPageRoute(builder: (context)=> NotificationPage(id: id));
        }

        else if(uri.pathSegments.length==2 && uri.pathSegments.first=='user'){
          var id=uri.pathSegments[1];
          return MaterialPageRoute(builder: (context)=> AccountPage(id: id));
        }


        return MaterialPageRoute(builder: (context) => UnknownScreen());
      },

      
    );
  }
}
class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('404!'),
      ),
    );
  }
}


