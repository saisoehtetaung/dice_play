import 'package:dice_play/fols/success.dart';
import 'package:flutter/material.dart';
import './fols/dice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "dice/home",
      onGenerateRoute: (setting) {
        switch (setting.name) {
          case "dice/home":
            return MaterialPageRoute(builder: (_) => Dice());
            break;
          case "dice/result":
            return MaterialPageRoute(
                builder: (_) =>
                    ResultScreen(title: setting.arguments?.toString() ?? ""));
            break;
        }
      },
      // home: Dice(),
    );
  }
}
