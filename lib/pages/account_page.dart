
import 'package:flutter/material.dart';


class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 35,
            itemBuilder: (BuildContext context,int index)=>
                SizedBox(
                  height: 50,
                  child: ListTile(
                      leading: const Icon(Icons.person),
                      trailing: const Text("Account",
                        style: TextStyle(
                            color: Colors.green,fontSize: 15),),
                      title:Text("List item $index")
                  ),
                )
        ),
      ),
    );
  }
}
