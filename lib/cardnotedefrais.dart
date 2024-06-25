import 'package:exercice_flutter_1/models.dart';
import 'package:flutter/material.dart';

class Cardnotedefrais extends StatefulWidget {
  const Cardnotedefrais({super.key});

  @override
  _CardnotedefraisState createState() => _CardnotedefraisState();
}

class ColorItem {
  ColorItem(this.name, this.color);
  final String name;
  final Color color;
}

class _CardnotedefraisState extends State<Cardnotedefrais> {
  late ColorItem currentChoice;
  List<ColorItem> items = [
    ColorItem("validé", Colors.green),
    ColorItem("soumis", Colors.yellow),
    ColorItem("annulé", Colors.red),
  ];

  @override
  void initState() {
    super.initState();
    currentChoice = items[0]; // Initialize currentChoice here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card Sample')),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ListTile(
                        title: Text('DuJardin Jean'),
                        subtitle: Text('Cinéma - Comédien'),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: currentChoice.color,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: DropdownButton<ColorItem>(
                          isExpanded: true,
                          value: currentChoice,
                          dropdownColor: currentChoice.color,
                          items: items.map((ColorItem item) {
                            return DropdownMenuItem<ColorItem>(
                              value: item,
                              child: Center(
                                child: Text(
                                  item.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (ColorItem? value) {
                            setState(() {
                              currentChoice = value!;
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Row(children: [
                    Expanded(
                        flex: 1,
                        child: ButtonModels(
                          background: Colors.orange,
                          texte: "enregistrer",
                          colortexte: Colors.white,
                          colorborder: Colors.transparent,
                        )),
                    Expanded(
                        flex: 1,
                        child: ButtonModels(
                          background: Colors.white,
                          texte: "+ de détails",
                          colortexte: Colors.grey,
                          colorborder: Colors.black,
                        )),
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
