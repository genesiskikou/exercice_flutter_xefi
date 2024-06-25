import 'package:flutter/material.dart';

class quantite extends StatefulWidget {
  const quantite({super.key});

  @override
  _quantiteState createState() => _quantiteState();
}

class _quantiteState extends State<quantite> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Quantité')),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Quantité"),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(2),
                  side: const BorderSide(color: Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    count++;
                  });
                },
                child: const Icon(Icons.add),
              ),
            ),
            Text('$count'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(2),
                  side: const BorderSide(color: Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    count--;
                  });
                },
                child: const Icon(Icons.remove),
              ),
            ),
          ],
        ),
      ),
    );
  }
}