

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNavBar2 extends StatefulWidget {
  const CustomNavBar2({Key? key}) : super(key: key);

  @override
  State<CustomNavBar2> createState() => _CustomNavBar2State();
}

class _CustomNavBar2State extends State<CustomNavBar2> {
  bool isPressed1=false;
  bool isPressed2=false;
  bool isPressed3=false;
  bool isPressed4=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isPressed1=true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: PageView(
        children: [

        ],
      ),
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
                    if(isPressed1){
                      isPressed1=false;
                    }else{
                      isPressed1=true;
                      isPressed3=false;
                      isPressed2=false;
                      isPressed4=false;
                    }
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
                        color:  isPressed1?Colors.blue:Colors.white,
                      ),
                       Expanded(child: Icon(Icons.home_filled,color:isPressed1?Colors.blue:Colors.grey,))
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    if(isPressed2){
                      isPressed2=false;
                    }else{
                      isPressed2=true;
                      isPressed3=false;
                      isPressed4=false;
                      isPressed1=false;
                    }
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
                        color: isPressed2?Colors.blue:Colors.white,
                      ),
                       Expanded(child: Icon(CupertinoIcons.search_circle_fill,color:isPressed2?Colors.blue:Colors.grey,))
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    if(isPressed3){
                      isPressed3=false;
                    }else{
                      isPressed3=true;
                      isPressed4=false;
                      isPressed2=false;
                      isPressed1=false;
                    }
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
                        color: isPressed3?Colors.blue:Colors.white,
                      ),
                      Expanded(child: Icon(CupertinoIcons.bell_fill,color:isPressed3?Colors.blue:Colors.grey,))
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    if(isPressed4){
                      isPressed4=false;
                    }else{
                      isPressed4=true;
                      isPressed3=false;
                      isPressed2=false;
                      isPressed1=false;
                    }
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
                        color:  isPressed4?Colors.blue:Colors.white,
                      ),
                      Expanded(child: Icon(CupertinoIcons.person_fill,color:isPressed4?Colors.blue:Colors.grey,))
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
