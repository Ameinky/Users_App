import 'package:flutter/material.dart';
import 'package:usrs_app/constants/constant_color.dart';
import 'package:usrs_app/global/global.dart';
import 'package:usrs_app/splashScreen/splash_screen.dart';

import '../mainScreens/about_screen.dart';
import '../mainScreens/profile_screen.dart';
import '../mainScreens/trips_history_screen.dart';

class MyDrawer extends StatefulWidget {
  String? name;
  String? email;

  MyDrawer({this.name, this.email});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          //drawer header
          Container(
            height: 165,
            color: whiteColor,
            child: DrawerHeader(
              decoration: const BoxDecoration(color: blueColor),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.person,
                    size: 60,
                    color: whiteColor,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.name.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.email.toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            color: whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(
            height: 12.0,
          ),

          //drawer body
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (c) => ProfileScreen()));
            },
            child: const ListTile(
              leading: Icon(
                Icons.person,
                color: whiteColor,
              ),
              title: Text(
                "Visit Profile",
                style: TextStyle(color: whiteColor),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => TripsHistoryScreen()));
            },
            child: const ListTile(
              leading: Icon(
                Icons.history,
                color: whiteColor,
              ),
              title: Text(
                "Report",
                style: TextStyle(color: whiteColor),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (c) => AboutScreen()));
            },
            child: const ListTile(
              leading: Icon(
                Icons.info,
                color: whiteColor,
              ),
              title: Text(
                "About",
                style: TextStyle(color: whiteColor),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              fAuth.signOut();
              Navigator.push(
                  context, MaterialPageRoute(builder: (c) => MySplachScreen()));
            },
            child: const ListTile(
              leading: Icon(
                Icons.logout,
                color: whiteColor,
              ),
              title: Text(
                "Sign Out",
                style: TextStyle(color: whiteColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
