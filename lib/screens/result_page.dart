import 'dart:ffi';

import 'package:bmi_calculater/components/container_box.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculater/constants.dart';
import 'package:pretty_gauge/pretty_gauge.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({required this.bmiResult, required this.resultText, required this.interpretation});

  final double bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomCenter,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ContainerBox(
              colour: Colors.white38,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  PrettyGauge(
                    gaugeSize: 350,
                    minValue: 0,
                    maxValue: 40,
                    segments: [
                      GaugeSegment('UnderWeight', 18.5, Colors.red),
                      GaugeSegment('Normal', 6.4, Colors.green),
                      GaugeSegment('OverWeight', 5, Colors.orange),
                      GaugeSegment('Obese', 10.1, Colors.pink),
                    ],
                    valueWidget: Text(
                      bmiResult.toStringAsFixed(1),
                      style: const TextStyle(fontSize: 45, color: Colors.white,),
                    ),
                    currentValue: bmiResult.toDouble(),
                    needleColor: Colors.blue,
                  ),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              onPress: () {},
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                color: kActiveCardColor,
                borderRadius: BorderRadius.all(Radius.circular(50),),
              ),
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: kLargeButtonTextStyle,
                ),
              ),
              width: 450.0,
              height: 80.0,
              margin: EdgeInsets.all(15.0),
            ),
          ),
        ],
      ),
    );
  }
}
