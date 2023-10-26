import 'package:bmi_calculater/constants.dart';
import 'package:flutter/material.dart';

class DataContainer extends StatelessWidget {
  DataContainer({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color:Colors.white
        ),
        SizedBox(height: 15.0),
        Text(
          title,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}