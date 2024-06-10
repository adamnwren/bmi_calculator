import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'number_widget.dart';
import 'sex_widget.dart';
import 'simple_box.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  void updateGender() {
    setState(() {
      selectedGender = Gender.FEMALE;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 26,
        ),
      ),
      body: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: GestureDetector(
                child: SimpleBox(
                  colour: selectedGender == Gender.MALE ? activeCardColor : inactiveCardColor,
                  cardChild: SexWidget(
                    sex: 'Male',
                    icon: FontAwesomeIcons.male,
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedGender = Gender.MALE;
                  });
                }),
          ),
          Expanded(
            child: GestureDetector(
                child: SimpleBox(
                  colour: selectedGender == Gender.FEMALE ? activeCardColor : inactiveCardColor,
                  cardChild: SexWidget(sex: 'Female', icon: FontAwesomeIcons.female),
                ),
                onTap: () {
                  setState(() {
                    selectedGender = Gender.FEMALE;
                  });
                }),
          ),
        ]),
        Row(children: [
          Expanded(
            child: SimpleBox(
              colour: greyC,
              cardChild: Placeholder(),
            ),
          ),
        ]),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SimpleBox(colour: greyC, cardChild: NumberWidget(title: 'Weight', child: Placeholder())),
              SimpleBox(
                colour: greyC,
                cardChild: NumberWidget(title: 'Age', child: Placeholder()),
              ),
            ],
          ),
        ),
        Container(
          color: pinkC,
          margin: EdgeInsets.only(top: 15.0),
          width: double.infinity,
          height: bottomContainerHeight,
        ),
      ]),
    );
  }
}
