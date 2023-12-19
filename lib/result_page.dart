import 'package:flutter/material.dart';
import 'bmi_functionality.dart';

class ResultPage extends StatelessWidget {
  String resultString = 'Normal';
  String score = '0';
  String suggestions = 'Good';

  BmiCalculation? bmiCalc;

  ResultPage({this.bmiCalc}) {
    score = bmiCalc!.calculateBmi();
    resultString = bmiCalc!.result();
    suggestions = bmiCalc!.suggestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Your Result',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Pacifico',
                color: Color(0xFFEB1555),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xFF1D1F33),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        resultString,
                        style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 25,
                            color: bmiCalc!.resColor),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        score,
                        style: TextStyle(
                          fontSize: 130,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          suggestions,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Pacifico',
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Recalculate',
                  style: TextStyle(fontFamily: 'Pacifico', fontSize: 20),
                ),
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  )),
                  minimumSize: MaterialStatePropertyAll(Size(373, 75)),
                  backgroundColor: MaterialStatePropertyAll(Color(0xFFEB1555)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
