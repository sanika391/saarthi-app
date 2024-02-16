
import 'dart:async';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saheli_app/common/widgets/customBtn.dart';
import 'package:saheli_app/views/login.dart';
import 'package:saheli_app/widgets/Chatbot/chatbot.dart';
import 'package:saheli_app/widgets/SafeRoutes/SafeHome.dart';
import 'package:saheli_app/widgets/custom_widgets/CustomCarousel.dart';
import 'package:saheli_app/widgets/custom_widgets/custom_appBar.dart';
import 'package:shake/shake.dart';
import 'package:telephony/telephony.dart';
import 'package:volume_watcher/volume_watcher.dart';

import '../db/databases.dart';
import '../model/PhoneContact.dart';
import '../widgets/NearbyLocations/nearby_places.dart';
import '../widgets/emergency.dart';


class HomePage extends StatefulWidget {
  int qIndex = 0;

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  getRandomQuote() {
    Random random = Random();
    setState(() {
      qIndex = random.nextInt(6);
    });
  }
  int qIndex = 0;
  void initState(){
    super.initState();
    getRandomQuote();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 236, 208),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, top: 8.0, bottom: 9.0, right: 8.0),
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 57, 116),
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                  child: Container(
                    color: Colors.grey.shade100,
                  ),
                ),
                SizedBox(height: 10),                CustomAppBar(
                  quoteIndex: qIndex,
                  onTap: getRandomQuote(),
                ),
                SizedBox(height: 10),
                SizedBox(height: 10),
                SizedBox(
                  height: 10,
                  child: Container(
                    color: Colors.grey.shade100,
                  ),
                ),

                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: 10),
                      SafeHome(),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Incase of emergency",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),
                      Emergency(),

                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Find on Map",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      LiveSafe(),
                      SizedBox(height: 10),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Explore Inspiring Stories",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      CustomCarouel(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

    );
  }


}
