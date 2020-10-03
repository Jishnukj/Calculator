import 'package:calculator/about.dart';
import 'package:calculator/main.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Calculator",style: new TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            color: Colors.white
          ))

        ],
      ),decoration: BoxDecoration(color: Colors.blueAccent),),
          ListTile(title: Text("Home"),focusColor: Colors.green,
            onTap: (){

              Navigator.push(context, MaterialPageRoute(builder: (context) => Calculator()));
            },),
          ListTile(title: Text("About"),focusColor: Colors.green,
            onTap: (){

              Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
            },)

        ],
      ),
    );
  }
}
