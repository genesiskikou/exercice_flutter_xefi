import 'package:flutter/material.dart';

// ignore: camel_case_types
class ButtonModels extends StatelessWidget {
  const ButtonModels({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          side: const BorderSide(color: Colors.black),
          padding: const EdgeInsets.all(2),
        ),
        onPressed: () {},
        child: Text(
          "+ de détails".toUpperCase(),
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class ButtonModelsEnregistrer extends StatelessWidget {
  const ButtonModelsEnregistrer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(2),
        ),
        onPressed: () {},
        child: Text(
          "Enregistrer".toUpperCase(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
