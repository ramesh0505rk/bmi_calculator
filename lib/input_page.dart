import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'box_widget.dart';
import 'content_widget.dart';
import 'constants.dart';
import 'result_page.dart';
import 'bmi_functionality.dart';

class BmiCalc extends StatefulWidget {
  const BmiCalc({super.key});

  @override
  State<BmiCalc> createState() => _BmiCalcState();
}

Color? bgLeft = Color(0xFF1D1F29);
Color? bgRight = Color(0xFF1D1F29);
Color? textColorLeft = Colors.white70;
Color? textColorRight = Colors.white70;
int height = 180;
int weight = 60;
int age = 18;

class _BmiCalcState extends State<BmiCalc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Bmi Calculator',
              style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Color(0xFFEB1555),
                  fontSize: 30),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                //stack no - 1
                children: [
                  Expanded(
                    child: BoxWidget(
                      onPress: () {
                        setState(() {
                          bgLeft = Color(0xFF1D1F33);
                          bgRight = kInactiveColor;
                          textColorLeft = Colors.white;
                          textColorRight = Colors.white70;
                        });
                      },
                      backgroundColor: bgLeft,
                      childContent: ContentWidget(
                        iconColor: textColorLeft,
                        imgPath: 'assets/maleIconSvg.svg',
                        text: 'Male',
                      ),
                    ),
                  ),
                  Expanded(
                    child: BoxWidget(
                      onPress: () {
                        setState(() {
                          bgLeft = kInactiveColor;
                          bgRight = Color(0xFF1D1F33);
                          textColorLeft = Colors.white70;
                          textColorRight = Colors.white;
                        });
                      },
                      backgroundColor: bgRight,
                      childContent: ContentWidget(
                        iconColor: textColorRight,
                        imgPath: 'assets/femaleIconSvg.svg',
                        text: 'Female',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              //stack - 2
              child: BoxWidget(
                childContent: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: TextStyle(
                          fontFamily: 'pacifico',
                          fontSize: 25,
                          color: textColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                              color: textColor, fontFamily: 'pacifico'),
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 13),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
                backgroundColor: Color(0xFF1D1F33),
              ),
            ),
            Expanded(
              //stack - 3
              child: Row(
                children: [
                  Expanded(
                    child: BoxWidget(
                      childContent: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: TextStyle(
                              fontFamily: 'Pacifico',
                              fontSize: 25,
                              color: textColor,
                            ),
                          ),
                          Text(
                            weight.toString(),
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIcon(
                                icon: Icons.remove,
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIcon(
                                icon: Icons.add,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                      backgroundColor: Color(0xFF1D1F33),
                    ),
                  ),
                  Expanded(
                    child: BoxWidget(
                      childContent: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: TextStyle(
                              fontFamily: 'Pacifico',
                              fontSize: 25,
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              fontSize: 50,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIcon(
                                icon: Icons.remove,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIcon(
                                icon: Icons.add,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      backgroundColor: Color(0xFF1D1F33),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ResultPage(
                        bmiCalc: BmiCalculation(weight: weight, height: height),
                      );
                    }));
                  },
                  child: Text(
                    'Calculate your Bmi.',
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 20,
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    )),
                    minimumSize: MaterialStatePropertyAll(Size(373, 75)),
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xFFEB1555)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ));
  }
}

class RoundIcon extends StatelessWidget {
  RoundIcon({this.icon, this.onPress}) {}
  final IconData? icon;
  dynamic onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(
        icon,
        color: Colors.white,
      ),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff0A0D22),
    );
  }
}
