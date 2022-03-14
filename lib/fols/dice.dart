import 'dart:math';

import 'package:dice_play/fols/success.dart';
import 'package:flutter/material.dart';

final ButtonStyle buttonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.red.shade500),
  elevation: MaterialStateProperty.all(2),
);

class Dice extends StatefulWidget {
  Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  final Random random = Random();

  int dice1 = 6;
  int dice2 = 6;

  bool buttonValue = true;

  String? errorText;

  final TextEditingController controller = TextEditingController();

  double sliderValue = 1;

  Future<void> go() async {
    if (!buttonValue) return;
    // if (controller.text.isEmpty) {
    //   errorText = "Invalid Number";
    //   setState(() {});
    //   return;
    // }
    // if (errorText != null) {
    //   setState(() {});
    //   return;
    // }
    buttonValue = false;
    dice1 = random.nextInt(6) + 1;
    dice2 = random.nextInt(6) + 1;
    setState(() {});

    await Future.delayed(Duration(seconds: 2), () {
      buttonValue = true;
    });
    if ((dice1 + dice2) != sliderValue.toInt()) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          "dice/result", (route) => false,
          arguments: "Failed");
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(
      //         builder: (_) => ResultScreen(
      //               title: "Failed",
      //             )),
      //     (route) => false);
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil(
          "dice/result", (route) => false,
          arguments: "Success");
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(
      //         builder: (_) => ResultScreen(
      //               title: "Success",
      //             )),
      //     (route) => false);
    }
  }

  OutlineInputBorder border({Color? color, double? width}) =>
      OutlineInputBorder(
        borderSide: BorderSide(
            width: width ?? 1.0, color: color ?? Colors.red.shade500),
      );

  Widget getDice(int count) => Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.7),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.35),
                  offset: Offset(-1, 1),
                  blurRadius: 1,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (count <= 3) ...{
                  Row(
                    children: [
                      for (int i = 0; i < count; i++) ...{
                        spot(),
                      }
                    ],
                  ),
                } else if (count == 5) ...{
                  SizedBox(
                    width: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        spot(),
                        spot(),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        spot(),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        spot(),
                        spot(),
                      ],
                    ),
                  ),
                } else if (count == 4) ...{
                  SizedBox(
                    width: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 0; i <= 2; i++) ...{spot()},
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 0; i <= 2; i++) ...{spot()},
                      ],
                    ),
                  ),
                } else ...{
                  SizedBox(
                    width: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 0; i <= 2; i++) ...{spot()},
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 0; i <= 2; i++) ...{spot()},
                      ],
                    ),
                  ),
                },
              ],
            ),
          ),
        ],
      );

  Widget spot() => Container(
        width: 10,
        height: 10,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Play Dice App")),
      body: Container(
        decoration: box,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // two Dices
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getDice(dice1),
                getDice(dice2),
              ],
            ),
            // error Text
            // if (errorText != null) ...{
            //   Text(
            //     errorText!,
            //     style: TextStyle(
            //       fontSize: 18,
            //       fontStyle: FontStyle.italic,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.red,
            //     ),
            //   )
            // },

            // your guess number
            Text(
              "${sliderValue.toInt()}",
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),

            // text lucky number
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Form(
            //     autovalidateMode: AutovalidateMode.onUserInteraction,
            //     child: Row(
            //       children: [
            //         Expanded(
            //           child: TextFormField(
            //             controller: controller,
            //             validator: (a) {
            //               errorText = int.tryParse(a ?? '') == null
            //                   ? "InvalidNumber"
            //                   : int.parse(a!) > 12
            //                       ? "InvalidNumber"
            //                       : null;
            //               return null;
            //             },
            //             onEditingComplete: () {
            //               setState(() {});
            //             },
            //             keyboardType: TextInputType.number,
            //             decoration: InputDecoration(
            //               fillColor: Color.fromRGBO(255, 255, 255, 0.8),
            //               filled: true,
            //               hintText: "Enter Your Lucky Number",
            //               hintStyle: TextStyle(
            //                 fontSize: 16,
            //                 fontWeight: FontWeight.w500,
            //                 color: Colors.grey,
            //               ),
            //               border: border(),
            //               focusedBorder: border(),
            //               enabledBorder: border(),
            //               errorBorder: border(color: Colors.red, width: 2),
            //               focusedErrorBorder:
            //                   border(color: Colors.red, width: 2),
            //               errorText: null,
            //             ),
            //           ),
            //         ),
            //         SizedBox(width: 20),
            //         SizedBox(
            //           width: 100,
            //           height: 55,
            //           child: ElevatedButton(
            //             onPressed: () => go(),
            //             child: Text("Go"),
            //             style: buttonStyle,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Slider(
                divisions: 11,
                value: sliderValue,
                min: 1,
                max: 12,
                inactiveColor: Colors.white,
                activeColor: Colors.red.shade400,
                thumbColor: Colors.amber.shade400,
                onChanged: (a) {
                  sliderValue = a;
                  setState(() {});
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 140),
              child: SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () => go(),
                  child: Text("Go"),
                  style: buttonStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
