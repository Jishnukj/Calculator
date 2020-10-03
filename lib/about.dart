import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator/drawer.dart';
class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body:Center(

        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.transparent,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage("assets/m2.png"),
                        fit: BoxFit.fill)
                      ),
                    ),
                    new Container(
                        alignment: Alignment.center,
                        padding: new EdgeInsets.fromLTRB(10, 30, 10, 0),
                        child: new Text("Developd By Jishnu K J",style: new TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),)),
                    new Container(
                        alignment: Alignment.center,
                        padding: new EdgeInsets.fromLTRB(10, 31, 10, 0),
                        child: new Text("jishnukjayan97@gmail.com",style: new TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal
                        ),)),


                  ],


                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
