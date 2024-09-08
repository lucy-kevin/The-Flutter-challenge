import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:learningriverpod/Styles/appStyles.dart';
import 'package:learningriverpod/button.dart';
import 'package:learningriverpod/textbox.dart';

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(),
        body: ListView(children: [
      Column(children: [
        Stack(children: [
          const SizedBox(
            height: 170,
            width: 1000,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Color(0x1F5977E5),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10000000),
                    bottomLeft: Radius.circular(10000000),
                  )
                  // : const BorderRadius.only(
                  //     topRight: Radius.circular(10),
                  //     bottomRight: Radius.circular(10),
                  //   ),
                  ),
            ),
          ),
          Positioned(
            bottom: 45,
            left: 130,
            child: Text(
              "LucyRaise",
              style: Appstyles.title.copyWith(color: Appstyles.buttonFill),
            ),
          ),
          Positioned(
              bottom: 74,
              left: 239,
              child: Icon(
                FluentSystemIcons.ic_fluent_heart_filled,
                color: Appstyles.buttonFill,
              )),
        ]),
        const SizedBox(
          height: 20,
        ),
        Container(
          //padding: EdgeInsets.symmetric(horizontal: 24),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(children: [
            Text(
              "Create an Account",
              style: Appstyles.title,
            ),
            const SizedBox(
              height: 30,
            ),
            const Textbox(
              textItem: 'Name',
            ),
            const SizedBox(
              height: 30,
            ),
            const Textbox(
              textItem: 'Enter Email Address',
            ),
            const SizedBox(
              height: 30,
            ),
            const Textbox(
              textItem: 'Choose Password',
            ),
            const SizedBox(
              height: 30,
            ),
            const Button(textItem: "Sign Up"),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account "),
                Text("Login",
                    style: TextStyle(
                        color: Appstyles.buttonFill,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "OR",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            const Button(
              textItem: "Sign Up with Google",
              isWhite: true,
            )
          ]),
        ),
      ]),
    ]));
  }
}
