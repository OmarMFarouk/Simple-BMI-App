import 'package:flutter/material.dart';

class FemaleBox extends StatelessWidget {
  const FemaleBox({super.key, required this.onTap, required this.isClicked});
  final VoidCallback onTap;

  final bool isClicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.bottomCenter,
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.27,
        decoration: BoxDecoration(
            boxShadow: isClicked == false
                ? [
                    const BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        spreadRadius: 5,
                        offset: Offset(10, 10))
                  ]
                : null,
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(35),
            image: DecorationImage(
              image: AssetImage(
                "images/Female.PNG",
              ),
            )),
        child: Text(
          "Female",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
