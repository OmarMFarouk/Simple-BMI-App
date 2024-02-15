import 'package:flutter/material.dart';
import 'package:bmiapp/components/next_box.dart';
import 'package:bmiapp/pages/height_view.dart';
import 'package:bmiapp/pages/result_view.dart';
import '../components/female_box.dart';
import '../components/male_box.dart';

// ignore: must_be_immutable
class GenderScreen extends StatefulWidget {
  const GenderScreen({
    super.key,
  });

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  bool isMale = true;
  bool isMaleClicked = false;
  bool isFemaleClicked = false;
  bool userClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Select Your ",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade500),
              ),
              const Text(
                "Gender",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          MaleBox(
            isClicked: isMaleClicked,
            onTap: userClicked == false
                ? () {
                    setState(() {
                      isMale = true;
                      isMaleClicked = true;
                      userClicked = true;
                    });
                    bmiGender.add(isMale);

                    print(isMale);
                  }
                : () {},
          ),
          FemaleBox(
            isClicked: isFemaleClicked,
            onTap: userClicked == false
                ? () {
                    setState(() {
                      isMale = false;
                      isFemaleClicked = true;
                      userClicked = true;
                    });
                    bmiGender.add(isMale);
                    print(isMale);
                  }
                : () {},
          ),
          NextBox(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HeightView()));
            },
          )
        ],
      ),
    );
  }
}
