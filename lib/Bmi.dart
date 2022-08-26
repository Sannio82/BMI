import "package:flutter/material.dart";
import "dart:math";

// class Bmi extends StatefulWidget {
//   final Function addBmi;

//   Bmi(this.addBmi);

//   @override
//   State<Bmi> createState() => _BmiState();
// }

// class _BmiState extends State<Bmi>

class _Bmi<Bmi> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  void countBmi() {
    double height = double.parse(heightController.text);
    double weight = double.parse(weightController.text);

    double bmi = weight / pow(height / 100, 2);

    print("$bmi");

    // widget.addBmi(length, height);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
            decoration: InputDecoration(labelText: "Skriv in din längd i cm"),
            controller: heightController),
        TextField(
          decoration: InputDecoration(labelText: "Skriv in din vikt i kg"),
          controller: weightController,
        ),
        ElevatedButton(
          onPressed: countBmi,
          child: Text("Räkna ut BMI"),
        )
      ],
    );
  }
}
