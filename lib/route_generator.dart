import "package:flutter/material.dart";
import "main.dart";

class ShowBmi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ditt BMI är: "),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Go back!'),
            style: ButtonStyle()),
      ),
    );
  }
}


            //          child: new Text(
            //   "material button",
            //   style: new TextStyle(
            //     fontSize: 20.0,
            //     color: Colors.yellow,
            //   ),
            // ), För att stylea knappen!