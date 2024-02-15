import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:bmiapp/components/result_box.dart';
import 'package:bmiapp/pages/result_view.dart';

import '../components/back_box.dart';
import 'height_view.dart';

class WeightView extends StatefulWidget {
  const WeightView({
    super.key,
  });

  @override
  State<WeightView> createState() => _HeightViewState();
}

double currentWeight = 40;

class _HeightViewState extends State<WeightView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
              "Weight",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SfRadialGauge(
              axes: [
                RadialAxis(
                  maximum: 120,
                  minimum: 40,
                  showLastLabel: true,
                  showTicks: true,
                  pointers: [
                    NeedlePointer(
                      animationDuration: 2,
                      value: currentWeight,
                      animationType: AnimationType.easeInCirc,
                    )
                  ],
                  isInversed: false,
                ),
              ],
            ),
          ),
        ),
        Text(currentWeight.round().toString()),
        SfSlider(
          showDividers: true,
          showLabels: true,
          showTicks: true,
          min: 40,
          max: 120,
          value: currentWeight,
          onChanged: (value) {
            setState(() {
              currentWeight = value;
              print(currentWeight);
              bmiWeight.add(currentWeight.round());
            });
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BackBox(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HeightView()));
              },
            ),
            ResultBox(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultScreen()));
              },
            )
          ],
        )
      ]),
    );
  }
}
