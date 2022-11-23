

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
import 'package:usrs_app/constants/constant_color.dart';
import 'package:usrs_app/global/global.dart';

import '../Assistants/assistant_methods.dart';

class SelectNearestActiveDriversScreen extends StatefulWidget {
  DatabaseReference? referenceRideRequest;
  SelectNearestActiveDriversScreen({required this.referenceRideRequest});

  @override
  _SelectNearestActiveDriversScreenState createState() =>
      _SelectNearestActiveDriversScreenState();
}

class _SelectNearestActiveDriversScreenState
    extends State<SelectNearestActiveDriversScreen> {
  String fareAmount = "";

  getFareAmountAccordingToVehicleType(int index) {
    if (tripDrictionDetailsInfo != null) {
      if (dList[index]["car_details"]["type"].toString() == "Ambulance-Homey") {
        fareAmount =
            (AssistantMethods.calculateFareAmountFromOriginToDestination(
                        tripDrictionDetailsInfo!) /
                    2)
                .toStringAsFixed(1);
      }
      if (dList[index]["car_details"]["type"].toString() ==
          "Ambulance-bike") //means executive type of car - more comfortable pro level
      {
        fareAmount =
            (AssistantMethods.calculateFareAmountFromOriginToDestination(
                        tripDrictionDetailsInfo!) *
                    2)
                .toStringAsFixed(1);
      }
      if (dList[index]["car_details"]["type"].toString() ==
          "Ambulance-bus") // non - executive car - comfortable
      {
        fareAmount =
            (AssistantMethods.calculateFareAmountFromOriginToDestination(
                    tripDrictionDetailsInfo!))
                .toString();
      }
    }
    return fareAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: blueColor,
        title: const Text(
          "Nearest Online Drivers",
          style: TextStyle(fontSize: 18, color: whiteColor),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            //delete/remove the ride request from database
            widget.referenceRideRequest!.remove();

            SystemNavigator.pop();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: dList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                choosenDriverId = dList[index]["id"].toString();
              });
              Navigator.pop(context, "driverChoosed");
            },
            child: Card(
              color: whiteColor,
              elevation: 3,
              shadowColor: Colors.green,
              margin: const EdgeInsets.all(8),
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Image.asset(
                    "images/" +
                        dList[index]["car_details"]["type"].toString() +
                        ".png",
                    width: 70,
                  ),
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      dList[index]["name"],
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      dList[index]["car_details"]["ambulance_model"],
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SmoothStarRating(
                      rating: dList[index]["ratings"] == null ? 0.0 : double.parse(dList[index]["ratings"]),
                      color: Colors.black,
                      borderColor: Colors.black,
                      allowHalfRating: true,
                      starCount: 5,
                      size: 15,
                    ),
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "\$ " + getFareAmountAccordingToVehicleType(index),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      tripDrictionDetailsInfo != null
                          ? tripDrictionDetailsInfo!.duration_text!
                          : "",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      tripDrictionDetailsInfo != null
                          ? tripDrictionDetailsInfo!.distance_text!
                          : "",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
