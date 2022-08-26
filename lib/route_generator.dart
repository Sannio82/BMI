import "package:flutter/material.dart";
import "main.dart";

class ShowBmi extends StatelessWidget {
  String kategoriR;
  double bmiR;
  String genderR;

  ShowBmi({
    Key? key,
    required this.kategoriR,
    required this.bmiR,
    required this.genderR,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultat!"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.all(10),
            color: Colors.green.shade300,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "$genderR BMI är: $bmiR",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  SizedBox(height: 6.0),
                  Text(
                    "$kategoriR",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green.shade300,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Gå tillbaka",
              style: TextStyle(fontSize: 22, color: Colors.grey.shade900),
            ),
          ),
        ],
      ),
    );
  }
}
