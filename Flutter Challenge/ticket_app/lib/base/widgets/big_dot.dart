import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';

class BigDot extends StatelessWidget {
  final bool? isColor;
  const BigDot({super.key, this.isColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: isColor == null
            ? Border.all(width: 2.5, color: AppStyles.ticketColor)
            : Border.all(width: 2.5, color: AppStyles.bigCircleColor),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
