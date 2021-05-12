import 'package:covid_tracker/screens/dashboard_screen.dart';
import 'package:covid_tracker/screens/input_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _loading = true;
  String _locationName;
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(kBlueColor);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: _loading
              ? loader
              : (_locationName == null
                  ? InputScreen()
                  : DashBoardScreen(
                      locationName: _locationName,
                    )),
        ),
      ),
    );
  }

  void getLocationData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String locationName = (prefs.getString('locName'));
    _locationName = locationName;
    await Future.delayed(Duration(milliseconds: 300));
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _loading = true;
    });
    getLocationData();
  }
}
