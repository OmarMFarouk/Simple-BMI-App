import 'package:flutter/material.dart';
import 'package:bmiapp/pages/gender_view.dart';

import '../components/back_box.dart';

// ignore: must_be_immutable
class ResultScreen extends StatelessWidget {
  ResultScreen({
    super.key,
  });

  genderChecker() {
    if (bmiGender.last == false) {
      return "Female";
    } else {
      return "Male";
    }
  }

  @override
  Widget build(BuildContext context) {
    double bmi =
        (bmiWeight.last / (bmiHeight.last / 100 * bmiHeight.last / 100));
    bmiCalculator() {
      switch (bmi) {
        case > 30:
          return "Very OverWeight";
        case < 29.9 && > 25:
          return "OverWeight";
        case < 24.9 && > 18.5:
          return "Normal";
        case < 18.5:
          return "UnderWeight";

        default:
          "";
      }
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your BMI ",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500),
                ),
                const Text(
                  "RESULT",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(genderChecker()),
            Text("${bmiHeight.last}"),
            Text("${bmiWeight.last}"),
            Text(bmi.round().toString()),
            Text(bmiCalculator().toString()),
            BackBox(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GenderScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

List bmiGender = [];
List bmiHeight = [];
List bmiWeight = [];
