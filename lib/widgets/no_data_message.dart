import 'package:flutter/material.dart';

import '../constants.dart';

class NoDataMessage extends StatelessWidget {
  const NoDataMessage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "No Data Available",
        style: TextStyle(
          fontSize: 25,
          color: kBlueColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
