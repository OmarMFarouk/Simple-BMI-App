import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:bmiapp/components/back_box.dart';
import 'package:bmiapp/components/next_box.dart';
import 'package:bmiapp/pages/gender_view.dart';
import 'package:bmiapp/pages/weight_view.dart';

import 'result_view.dart';

// ignore: must_be_immutable
class HeightView extends StatefulWidget {
  HeightView({
    super.key,
  });

  @override
  State<HeightView> createState() => _HeightViewState();
}

double currentHeight = 130;

class _HeightViewState extends State<HeightView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
              "Height",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: currentHeight,
                    height: currentHeight * 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: AssetImage("images/sized.PNG"))),
                  ),
                  SfSlider.vertical(
                      showTicks: true,
                      showDividers: true,
                      showLabels: true,
                      interval: 5,
                      enableTooltip: true,
                      max: 180,
                      min: 130,
                      value: currentHeight.round(),
                      onChanged: ((value) {
                        setState(() {
                          currentHeight = value;
                          bmiHeight.add(currentHeight.round());
                        });
                      }))
                ],
              ),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BackBox(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GenderScreen()));
              },
            ),
            NextBox(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WeightView()));
              },
            )
          ],
        )
      ]),
    );
  }
}
