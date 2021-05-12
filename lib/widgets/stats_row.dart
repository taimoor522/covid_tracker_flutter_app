import 'package:covid_tracker/widgets/stats_card.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class StatsRow extends StatelessWidget {
  final confirmed;
  final recovered;
  final deaths;

  StatsRow({this.deaths, this.recovered, this.confirmed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StatsCard(
          color: kYellowColor,
          label: "Confirmed",
          number: confirmed,
        ),
        StatsCard(
          color: kGreenColor,
          label: "Recovered",
          number: recovered,
        ),
        StatsCard(
          color: kRedColor,
          label: "Deaths",
          number: deaths,
        ),
      ],
    );
  }
}
