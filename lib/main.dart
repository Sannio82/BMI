import 'package:flutter/material.dart';
import "route_generator.dart";
import "dart:math";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        shadowColor: Colors.lightGreenAccent,
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double bmi = 0.0;
  String kategori = "";
  String gender = "";
  String name = "";
  bool woman = false;
  bool man = false;
  bool noGender = false;

  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final nameController = TextEditingController();

  void _countBmi() {
    setState(() {
      double height = double.parse(heightController.text);
      double weight = double.parse(weightController.text);

      double bmiCounted = weight / pow(height / 100, 2);

      bmi = double.parse((bmiCounted).toStringAsFixed(2));

      category();
      genderSelection();
      setName();
    });
  }

  void setName() {
    setState(() {
      name = (nameController.text.toString());
    });
  }

  void category() {
    setState(() {
      String kat1 = "Det räknas som undervikt";
      String kat2 = "Det räknas som normalvikt";
      String kat3 = "Det räknas som övervikt";
      String kat4 = "Det räknas som fetma";

      if (bmi < 18.5) {
        kategori = kat1;
      } else if (bmi >= 18.5 && bmi <= 25) {
        kategori = kat2;
      } else if (bmi > 25 && bmi <= 30) {
        kategori = kat3;
      } else if (bmi > 30) {
        kategori = kat4;
      } else {
        kategori = "";
      }
    });
  }

  void genderSelection() {
    setState(() {
      if (woman == true) {
        gender = "Du är kvinna och ditt";
      } else if (man == true) {
        gender = "Du är man och ditt";
      } else if (noGender == true) {
        gender = "Du har inte angett kön, ditt";
      } else {
        gender = "Du har inte angett kön, ditt";
      }
    });
  }

  void reset() {
    setState(() {
      bmi = 0.0;
      gender = "";
      name = "";

      heightController.text = "";
      weightController.text = "";
      nameController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI-räknare"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Jag är:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  woman = true;
                },
                child: Column(
                  children: <Widget>[
                    Text(
                      "Kvinna",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  man = true;
                },
                child: Column(
                  children: <Widget>[
                    Text(
                      "Man",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  noGender == true;
                },
                child: Column(
                  children: <Widget>[
                    Text(
                      "Vill ej säga",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                ),
              ),
            ],
          ),
          TextField(
              decoration: InputDecoration(
                labelText: "Jag heter",
                border: OutlineInputBorder(),
              ),
              controller: nameController),
          TextField(
              decoration: InputDecoration(
                  labelText: "Skriv in din längd i cm",
                  border: OutlineInputBorder()),
              controller: heightController),
          TextField(
            decoration: InputDecoration(
                labelText: "Skriv in din vikt i kg",
                border: OutlineInputBorder()),
            controller: weightController,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green.shade300,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            ),
            onPressed: () {
              _countBmi();
              _sendDataToBmi(context);
            },
            child: Text(
              "Se resultat!",
              style: TextStyle(fontSize: 22, color: Colors.grey.shade900),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green.shade300,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            ),
            onPressed: () {
              reset();
            },
            child: Text(
              "Nollställ",
              style: TextStyle(fontSize: 22, color: Colors.grey.shade900),
            ),
          )
        ],
      ),
    );
  }

  void _sendDataToBmi(BuildContext context) {
    String kategoriResultat = kategori;
    String genderResultat = gender;
    double bmiResultat = bmi;
    String nameResultat = name;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ShowBmi(
            kategoriR: kategoriResultat,
            genderR: genderResultat,
            bmiR: bmiResultat,
            nameR: nameResultat,
          ),
        ));
  }
}
