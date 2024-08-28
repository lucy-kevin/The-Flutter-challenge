import 'package:flutter/material.dart';
import 'package:ticket_app/base/widgets/text_style_forth.dart';
import 'package:ticket_app/base/widgets/text_style_third.dart';

class AppColumnTextLayout extends StatelessWidget {
  final String topText;
  final String bottomText;
  final bool? isColor;
  final CrossAxisAlignment alignment;
  const AppColumnTextLayout(
      {super.key,
      required this.topText,
      required this.bottomText,
      required this.alignment,
      this.isColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        TextStyleThird(
          text: topText,
          isColor: isColor,
        ),
        SizedBox(
          height: 5,
        ),
        TextStyleForth(
          text: bottomText,
          isColor: isColor,
        ),
      ],
    );
  }
}
