import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:usrs_app/constants/constant_color.dart';
import 'package:usrs_app/global/global.dart';

class BookingApp extends StatefulWidget {
  @override
  State<BookingApp> createState() => _BookingAppState();
}

class _BookingAppState extends State<BookingApp> {
  TextEditingController nameTextEditingController = TextEditingController();

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController messageTextEditingController = TextEditingController();

  TextEditingController phoneColorTextEditingController =
      TextEditingController();

  List<String> genderTypeList = ["Male", "Female"];
  List<String> bloodTypeList = ["A+", "A-", "B+", "O+"];

  String? SelectedGenType;

  String? SelectedBloodType;

  // User? currentFirebaseUser;
  saveBookingInfo() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    if (currentFirebaseUser != null) {
      Map bookingInfoMap = {
        "fullName": nameTextEditingController.text.trim(),
        "Email": emailTextEditingController.text.trim(),
        "Phone": phoneColorTextEditingController.text.trim(),
        "message": messageTextEditingController.text.trim(),
        "type": SelectedGenType,
        "typeblod": SelectedBloodType,
      };

      DatabaseReference bookingRef =
          FirebaseDatabase.instance.ref().child("Booking");

      bookingRef.child(currentFirebaseUser!.uid).set(bookingInfoMap);
      Fluttertoast.showToast(msg: "Booking  has been saved. Congratulation");
    } else {
      Navigator.pop(context);
      Timer(Duration(seconds: 10), () {
        Fluttertoast.showToast(msg: "Account has not been created");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
              ),
              SizedBox(
                height: 17,
              ),
              Text(
                'Write Ambulance Booking',
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    size: 120,
                    color: whiteColor,
                  ),
                ],
              ),
              SizedBox(
                height: 17,
              ),
              TextField(
                controller: nameTextEditingController,
                style: TextStyle(color: whiteColor),
                decoration: InputDecoration(
                  labelText: 'fullName',
                  hintText: "name",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: whiteColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: whiteColor),
                  ),
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: whiteColor,
                  ),
                ),
              ),
              TextField(
                controller: emailTextEditingController,
                style: TextStyle(color: whiteColor),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Your Email',
                  hintText: "email",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: whiteColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: whiteColor),
                  ),
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: whiteColor,
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.phone,
                controller: phoneColorTextEditingController,
                style: TextStyle(color: whiteColor),
                decoration: InputDecoration(
                  labelText: 'Telephone',
                  hintText: "phone",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: whiteColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: whiteColor),
                  ),
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: whiteColor,
                  ),
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: whiteColor,
                  ),
                ),
              ),
              TextField(
                controller: messageTextEditingController,
                style: TextStyle(color: whiteColor),
                decoration: InputDecoration(
                  labelText: 'message',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: whiteColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: whiteColor),
                  ),
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: whiteColor,
                  ),
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: whiteColor,
                  ),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              DropdownButton(
                dropdownColor: Colors.grey[900],
                hint: Text(
                  "Choose Gender",
                  style: TextStyle(
                    fontSize: 19,
                    color: whiteColor,
                  ),
                ),
                value: SelectedGenType,
                onChanged: (newVAlue) {
                  setState(() {
                    SelectedGenType = newVAlue.toString();
                  });
                },
                items: genderTypeList.map((gen) {
                  return DropdownMenuItem(
                    child: Text(
                      gen,
                      style: TextStyle(color: whiteColor),
                    ),
                    value: gen,
                  );
                }).toList(),
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButton(
                dropdownColor: Colors.grey[900],
                hint: Text(
                  "choose type blood",
                  style: TextStyle(
                    fontSize: 19,
                    color: whiteColor,
                  ),
                ),
                value: SelectedBloodType,
                onChanged: (newVAlue) {
                  setState(() {
                    SelectedBloodType = newVAlue.toString();
                  });
                },
                items: bloodTypeList.map((blood) {
                  return DropdownMenuItem(
                    child: Text(
                      blood,
                      style: TextStyle(color: whiteColor),
                    ),
                    value: blood,
                  );
                }).toList(),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (nameTextEditingController.text.isNotEmpty &&
                        emailTextEditingController.text.isNotEmpty &&
                        phoneColorTextEditingController.text.isNotEmpty &&
                        messageTextEditingController.text.isNotEmpty &&
                        SelectedGenType != null &&
                        SelectedBloodType != null) {
                      saveBookingInfo();
                      nameTextEditingController.clear();
                      emailTextEditingController.clear();
                      phoneColorTextEditingController.clear();
                      messageTextEditingController.clear();
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                ),
                child: Text(
                  'Booking Now',
                  style: TextStyle(
                    fontSize: 18,
                    color: whiteColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
