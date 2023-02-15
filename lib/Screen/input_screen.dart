import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Screen/reuseable.dart';
import '../Screen/result_screen.dart';
import '../Screen/calculator_brain.dart';

const inactiveCardColor = Color(0xFF111328);
const activeCardColor = Color(0xFF37384d);

//holds the gender inform
enum Gender { male, female }

class Input_Page extends StatefulWidget {
  const Input_Page({Key? key}) : super(key: key);

  @override
  State<Input_Page> createState() => _Input_PageState();
}

class _Input_PageState extends State<Input_Page> {
  int height = 180;
  int weight = 60;
  int age = 18;

  Color maleColourCard = inactiveCardColor;
  Color femaleColourCard = inactiveCardColor;

  //male = 1, female= 2
  void updateColour(Gender selectGender) {
    //male card pressed
    if (selectGender == Gender.male) {
      if (maleColourCard == inactiveCardColor) {
        maleColourCard = activeCardColor;
        //making the female colour inactive when clicked the male
        femaleColourCard = inactiveCardColor;
      } else {
        maleColourCard = inactiveCardColor;
      }
    }

    //female card pressed
    if (selectGender == Gender.female) {
      if (femaleColourCard == inactiveCardColor) {
        femaleColourCard = activeCardColor;

        //making the male colour inactive when clicked the female
        maleColourCard = inactiveCardColor;
      } else {
        femaleColourCard = inactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        title: const Text('BMI HEALTH CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(Gender.male);
                      });
                    },
                    child: Reuseable(
                      colour: maleColourCard,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(FontAwesomeIcons.mars, size: 80.0),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'MALE',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Color(0xFF8D8E98),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(Gender.female);
                      });
                    },
                    child: Reuseable(
                      colour: femaleColourCard,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(FontAwesomeIcons.venus, size: 80.0),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'FEMALE',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Color(0xFF8D8E98),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Reuseable(
                    colour: const Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'HEIGHT',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              height.toString(),
                              style: const TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const Text(
                              'cm',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xFF8D8E98),
                              ),
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: const Color(0xFFEB1555),
                            inactiveTrackColor: const Color(0xFF8D8E98),
                            activeTrackColor: Colors.white,
                            overlayColor: const Color(0x29EB1555),
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 15.0),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 30.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                            min: 120.0,
                            max: 300.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reuseable(
                    colour: const Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              weight.toString(),
                              style: const TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const Text(
                              'kg',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xFF8D8E98),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              backgroundColor: const Color(0xFF4C4F5E),
                              child: const Icon(FontAwesomeIcons.plus,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              elevation: 0.0,
                              backgroundColor: const Color(0xFF4C4F5E),
                              child: const Icon(FontAwesomeIcons.minus,
                                  color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reuseable(
                    colour: const Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              age.toString(),
                              style: const TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const Text(
                              'Yrs',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xFF8D8E98),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              backgroundColor: const Color(0xFF4C4F5E),
                              child: const Icon(FontAwesomeIcons.plus,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(
                                  () {
                                    age--;
                                  },
                                );
                              },
                              elevation: 0.0,
                              backgroundColor: const Color(0xFF4C4F5E),
                              child: const Icon(FontAwesomeIcons.minus,
                                  color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain cal =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    //getting the result from the bmi calculator_brain
                    bmiResult: cal.calculateBMI(),
                    interpretation: cal.interpretation(),
                    resultText: cal.getResult(),
                  ),
                ),
              );
            },
            child: Container(
              child: Center(
                child: Text(
                  'CHECK RESULT',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              color: const Color(0xFFEB1555),
              margin: const EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.only(bottom: 10.0),
              width: double.infinity,
              height: 60.0,
            ),
          ),
        ],
      ),
    );
  }
}
