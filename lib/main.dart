import 'package:flutter/material.dart';
import "route_generator.dart";
import "dart:math";
import "Bmi.dart";

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
  bool woman = false;
  bool man = false;
  bool noGender = false;

  // var heightController = "";
  // var weightController = "";

  final heightController = TextEditingController();
  final weightController = TextEditingController();

  void _countBmi() {
    setState(() {
      double height = double.parse(heightController.text);
      double weight = double.parse(weightController.text);

      double bmiCounted = weight / pow(height / 100, 2);

      bmi = double.parse((bmiCounted).toStringAsFixed(2));

      double.parse((12.3412).toStringAsFixed(2));

      category();
      genderSelection();

      print("$bmi");
    });
  }

  void category() {
    setState(() {
      String kat1 = "undervikt";
      String kat2 = "normalvikt";
      String kat3 = "övervikt";
      String kat4 = "fetma";

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

      print("Det räknas som $kategori");
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

      print("$gender");
    });
  }

  void reset() {
    setState(() {
      bmi = 0.0;
      gender = "";

      heightController.text = "";
      weightController.text = "";
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
            onPressed: _countBmi,
            child: Text(
              "Räkna ut BMI",
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            color: Colors.orange,
            child: Column(
              children: <Widget>[
                Text(
                  "$gender BMI är: $bmi",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 6.0),
                Text(
                  "$kategori",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              reset();
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ShowBmi(),
              //   ),
              // );
            },
            child: Text("Rensa"),
          )
        ],
      ),
    );
  }
}
// final List<Modellen> helaTodoListan = [];

// void startToDo(BuildContext context) {
//   showModalBottomSheet(
//       context: context,
//       builder: (_) => GestureDetector(
//             child: NyTodo(addNewTodo),
//           ));
// }

// void addNewTodo(String title, String comment, String date) {
//   final newToDo = Modellen(title, comment, date);
//   setState(() {
//     helaTodoListan.add(
//         newToDo); // Här lägger man till sakerna från Modellen till den nya listan
//   });
// }

// TextField(
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               label: Text("Längd i cm"),
//             ),
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           TextField(
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               label: Text("Vikt i kg"),
//             ),
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           Text("Jag är"),
//           ElevatedButton(
//             child: Text("Man"),
//             onPressed: () {},
//           ),
//           ElevatedButton(
//             child: Text("Kvinna"),
//             onPressed: () {},
//           ),
//           ElevatedButton(
//             child: Text("Spelar ingen roll"),
//             onPressed: () {},
//           ),
//           ElevatedButton(
//             child: Text('Beräkna BMI'),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ShowBmi()),
//               );
//             },
//           ),


 // Container(
                    //   height: 100.0,
                    //   width: 100.0,
                    //   decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     color: Colors.amber,
                    //     boxShadow: [
                    //       BoxShadow(
                    //           color: Colors.black26,
                    //           offset: Offset(0, 2),
                    //           blurRadius: 6.0)
                    //     ],
                    //   ),
                    // ),
