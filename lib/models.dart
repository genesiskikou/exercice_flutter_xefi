import 'package:flutter/material.dart';

// ignore: camel_case_types
class ButtonModels extends StatelessWidget {
  ButtonModels(
      {super.key,
      required this.background,
      required this.colorborder,
      required this.colortexte,
      required this.texte});

  String texte;
  Color colorborder;
  Color background;
  Color colortexte;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          side: BorderSide(color: colorborder),
          padding: const EdgeInsets.all(2),
        ),
        onPressed: () {},
        child: Text(
          texte.toUpperCase(),
          style: TextStyle(
            color: colortexte,
          ),
        ),
      ),
    );
  }
}
