import 'package:covid_tracker/constants.dart';
import 'package:covid_tracker/models/location_data.dart';
import 'package:covid_tracker/screens/input_screen.dart';
import 'package:covid_tracker/services/location_data_service.dart';
import 'package:covid_tracker/widgets/area_list.dart';
import 'package:covid_tracker/widgets/no_data_message.dart';
import 'package:covid_tracker/widgets/stats_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class DashBoardScreen extends StatefulWidget {
  String locationName;
  DashBoardScreen({this.locationName});
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  bool loading = true;
  LocationData data;
  getLocationData(String locationName) async {
    data = await LocationDataService.getData(locationName);
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      loading = true;
    });
    getLocationData(widget.locationName);
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(kBlackColor);

    return Scaffold(
      backgroundColor: loading ? Colors.white : kBlueColor,
      body: SafeArea(
        child: loading
            ? loader
            : Container(
                decoration: kBackgroundDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        widget.locationName,
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.search,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return InputScreen();
                                      }));
                                    }),
                              ],
                            ),
                          ),
                          StatsRow(
                            confirmed: data.all.confirmed,
                            recovered: data.all.recovered,
                            deaths: data.all.deaths,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        decoration: kAreaListContainerDecoration,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Provinces/States",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: kBlueColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: data.area.length == 0
                                  ? NoDataMessage()
                                  : AreaList(
                                      areaListData: data.area,
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
