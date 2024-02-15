import 'package:flutter/material.dart';
import 'package:bmiapp/pages/gender_view.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GenderScreen(),
    );
  }
}
