import 'package:covid_tracker/models/location_data.dart';
import 'package:covid_tracker/widgets/tiny_card.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class AreaList extends StatelessWidget {
  List<Data> areaListData;

  AreaList({this.areaListData});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thickness: 5,
      isAlwaysShown: true,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              shadowColor: Colors.black38,
              child: ListTile(
                title: Text(
                  areaListData[index].areaName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: kBlueColor,
                  ),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TinyCard(
                        img: "cc",
                        color: kYellowColor,
                        number: areaListData[index].confirmed,
                      ),
                      TinyCard(
                        img: "rr",
                        color: kGreenColor,
                        number: areaListData[index].recovered,
                      ),
                      TinyCard(
                        img: "dd",
                        color: kRedColor,
                        number: areaListData[index].deaths,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: areaListData.length,
        ),
      ),
    );
  }
}
