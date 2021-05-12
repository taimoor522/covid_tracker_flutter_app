import 'package:covid_tracker/widgets/suggestion_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class InputScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(kBlackColor);
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: kBackgroundDecoration,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Enter Country Name",
                  style: TextStyle(
                    fontFamily: "Itim",
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                      primaryColor: Colors.white, accentColor: Colors.white),
                  child: SuggestionInputfield(),
                ),

                // just to lift content up...
                SizedBox(
                  height: 150,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
