import 'package:flutter/material.dart';

class Reuseable extends StatelessWidget {
  final Color colour;
  final Widget cardChild;

  Reuseable({required this.colour, required this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
