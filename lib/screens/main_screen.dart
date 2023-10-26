import 'result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../calculator_brain.dart';
import '../components/container_box.dart';
import '../components/data.container.dart';
import '../constants.dart';

enum Gender {
  male,
  female,
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  Gender? selectedGender = Gender.male;
  int height = 180;
  int weight = 70;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR      (Developed by ❤ Rohan)"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ContainerBox(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: DataContainer(
                        icon: FontAwesomeIcons.mars,
                        title: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ContainerBox(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: DataContainer(
                        icon: FontAwesomeIcons.venus,
                        title: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              )
          ),
          Expanded(
            child: ContainerBox(
              colour: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text('cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0XFF8D8E98),
                      activeTrackColor: kActiveCardColor,
                      thumbColor: Color(0xFF38bfe8),
                      overlayColor: Color(0X2938bfe8),
                      thumbShape:
                      RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                      RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ), onPress: () {  },
            ),
          ),
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ContainerBox(
                      colour: kInactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FloatingActionButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                onPressed: (){
                                  setState(() {
                                    if(weight > 0) {
                                      weight--;
                                    }
                                  });
                                },
                                backgroundColor: kActiveCardColor,
                                child: Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white
                                ),
                              ),
                              SizedBox(
                                  width: 15.0
                              ),
                              FloatingActionButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                backgroundColor: kActiveCardColor,
                                child: Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      onPress: () {  },
                    ),
                  ),
                  Expanded(
                    child: ContainerBox(
                      colour: kInactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FloatingActionButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                onPressed: (){
                                  setState(() {
                                    if(age > 0) {
                                      age--;
                                    }
                                  });
                                },
                                backgroundColor: kActiveCardColor,
                                child: Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white
                                ),
                              ),
                              SizedBox(
                                  width: 15.0
                              ),
                              FloatingActionButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                backgroundColor: kActiveCardColor,
                                child: Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      onPress: () {  },
                    ),
                  ),
                ],
              ),
          ),
          GestureDetector(
            onTap: () {

              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultsPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                )),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: kActiveCardColor,
                borderRadius: BorderRadius.all(Radius.circular(50),),
              ),
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: kLargeButtonTextStyle,
                ),
              ),
              width: 450.0,
              height: 80.0,
              margin: EdgeInsets.all(15.0),
            ),
          )
        ],
      ),
    );
  }
}

