import 'package:flutter/material.dart';

import 'dice.dart';

final BoxDecoration box = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.red,
      Colors.white,
      Colors.blue,
    ],
  ),
);

class ResultScreen extends StatelessWidget {
  final String title;
  const ResultScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: box,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 100,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     MaterialPageRoute(builder: (_) => Dice()),
                  //     (route) => false);
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("dice/home", (route) => false);
                },
                child: Text("Next Round"),
                style: buttonStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
