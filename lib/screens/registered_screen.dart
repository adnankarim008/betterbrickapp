


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisteredScreen extends StatefulWidget {

  static String id = 'app_screen';
  @override
  _RegisteredScreenState createState() => _RegisteredScreenState();
}

class _RegisteredScreenState extends State<RegisteredScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          // The containers in the background
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .5,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFF4BDC31),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "BETTER",
                      style: TextStyle(
                          color: Color(0xff2E4550),
                          fontSize: 40,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "BRICK",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .5,
                color: Colors.grey[50],
              )
            ],
          ),

          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .35,
                right: 20.0,
                left: 20.0),
            child: Container(
              height: 400.0,
              width: MediaQuery.of(context).size.width * .85,
              child: Container(
                child: Padding(
                    padding:
                    const EdgeInsets.only(left: 15, right: 15, top: 30),
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("SUCCESSFULLY",style: TextStyle(color: Color(0xff2E4550),fontSize: 30,fontWeight:FontWeight.w900 ),),
                        Text("REGISTERED",style: TextStyle(color: Color(0xFF4BDC31),fontSize: 40,fontWeight:FontWeight.bold),)
                      ],

                    )
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 15.0, // soften the shadow
                        spreadRadius: 3.0, //extend the shadow
                        offset: Offset(
                          0.0, // Move to right 10  horizontally
                          10.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
