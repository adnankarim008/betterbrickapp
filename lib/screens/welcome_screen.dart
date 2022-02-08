import 'package:betterbrick/screens/login_screen.dart';
import 'package:betterbrick/screens/registration_screen.dart';
import 'package:betterbrick/screens/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:betterbrick/api/notification_api.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
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
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome to the Better Brick App",
                        style: TextStyle(
                            color: Color(0xFF4BDC31),
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Discover how managing masonry is made easy",
                          style: TextStyle(
                              color: Color(0xff445574),
                              fontSize: 13,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 20,
                      ),
                      RoundedButton(
                          title: "Sign Up",
                          colour: Color(0xff445574),
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.pushNamed(context, RegistrationScreen.id);
                          }),
                      RoundedButton(
                        title: "I have an account",
                        colour: Colors.white,
                        textColor: Color(0xff445574),
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.id);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                NotificationService()
                                    .showNotification(0, "Alert", "Notification alert after 5 seconds", 5);
                              },
                              child: Text(
                                "Scheduled Notification",
                                style: TextStyle(
                                    color: Color(0xff445574),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w900),
                              )),
                          TextButton(
                              onPressed: () {
                                NotificationService()
                                    .showNotificationNow(0, "Alert", "Notification works instantly");},
                              child: Text(
                                "Notification",
                                style: TextStyle(
                                    color: Color(0xff445574),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w900),
                              ))
                        ],
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
