import 'dart:async';
import 'package:flutter/material.dart';
import 'package:usrs_app/authentication/login_screen.dart';
import 'package:usrs_app/constants/constant_color.dart';
import 'package:usrs_app/mainScreens/main_screen.dart';

import '../Assistants/assistant_methods.dart';
import '../global/global.dart';

class MySplachScreen extends StatefulWidget {
  const MySplachScreen({Key? key}) : super(key: key);

  @override
  State<MySplachScreen> createState() => _MySplachScreenState();
}

class _MySplachScreenState extends State<MySplachScreen> {
  startTimer() {
    fAuth.currentUser != null
        ? AssistantMethods.readCurrentOnlineUserInfo()
        : null;
    Timer(const Duration(seconds: 2), () async {
      if (await fAuth.currentUser != null) {
        currentFirebaseUser = fAuth.currentUser;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainScreen()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
              Image.asset(
                      'images/ambulance.png',
                      height: 320,
                      fit: BoxFit.cover,
                    ),

                    const Text(
                      'Users App & In Amblunace Booking',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
            // Container(
            //   color: blueColor,
            //   child: Padding(
            //     padding: const EdgeInsets.all(16.0),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
                  
                    
            //       ],
            //     ),
            //   ),
            // ),
         
          ],
        ),
      ),
    );
  }
}
