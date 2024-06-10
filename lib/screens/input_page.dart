import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bottom_button.dart';
import '../components/sex_widget.dart';
import '../components/simple_box.dart';
import '../constants.dart';
import 'package:bmi_calculator/bmi.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.MALE;
  int bmiHeight = 170;
  int bmiWeight = 70;
  int bmiAge = 37;

  void updateWeight(int weight) {
    setState(() {
      bmiWeight = weight;
    });
  }

  void updateAge(int age) {
    setState(() {
      bmiAge = age;
    });
  }

  double calculateBMI(int weight, int height) {
    //((height / 100)^2);
    return 2.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI CALCULATOR'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 26,
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: GestureDetector(
                child: SimpleBox(
                  colour: selectedGender == Gender.MALE ? kActiveCardColor : kInactiveCardColor,
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
                  colour: selectedGender == Gender.FEMALE ? kActiveCardColor : kInactiveCardColor,
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
              colour: kGreyC,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.ideographic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        bmiHeight.toString(),
                        style: kHeavyStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      overlayColor: Color(0x29EB1555),
                      activeTrackColor: Color(0xFFEB1555),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                    ),
                    child: Slider(
                      value: bmiHeight.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          bmiHeight = newValue.round();
                        });
                      },
                      max: 200,
                      min: 100,
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SimpleBox(
                colour: kGreyC,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Weight',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      bmiWeight.toString(),
                      style: kHeavyStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () => updateWeight(bmiWeight + 1),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () => updateWeight(bmiWeight - 1),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SimpleBox(
                colour: kGreyC,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Age',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      bmiAge.toString(),
                      style: kHeavyStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () => updateAge(bmiAge + 1),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () => updateAge(bmiAge - 1),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        BottomButton(
            buttonTitle: 'Calculate',
            onTap: () {
              Bmi calc = Bmi(weight: bmiWeight, height: bmiHeight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmiResults: calc.getBMI(),
                            resultText: calc.getResults(),
                            interpretation: calc.getInterpretation(),
                          )));
            }),
      ]),
    );
  }
}
