import 'package:covid_tracker/constants.dart';
import 'package:flutter/material.dart';

class TinyCard extends StatelessWidget {
  final int number;
  final Color color;
  final String img;

  TinyCard({this.number, this.color, this.img});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          image: AssetImage("assets/images/$img.png"),
          width: 25,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          formatter.format(number),
          style: TextStyle(
            fontSize: 15,
            color: color,
          ),
        ),
      ],
    );
  }
}
