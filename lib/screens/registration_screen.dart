import 'package:betterbrick/screens/app_screen.dart';
import 'package:betterbrick/screens/registered_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'registered_screen.dart';

import '../constants.dart';
import 'rounded_button.dart';

class RegistrationScreen extends StatefulWidget {

  static String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner = false;

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 5.0,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          email = value;
//Do something with the user input.
                        },
                        decoration:
                        kTextFieldDecoration.copyWith(hintText: 'Email'),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        obscureText: true,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          password = value;
//Do something with the user input.
                        },
                        decoration:
                        kTextFieldDecoration.copyWith(hintText: 'Pass'),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      RoundedButton(
                        title: 'Register',
                        colour: primaryColor,
                        textColor: accentColor,
                        onPressed: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          try{
                            print(email);
                            final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                            if (newUser != null) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => RegisteredScreen(),
                                ),
                              );
                            }
                            setState(() {
                              showSpinner = false;
                            });
                          }
                          catch(e){
                            print(e);
                          }
                        },
                      )
                    ],
                  ),
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
