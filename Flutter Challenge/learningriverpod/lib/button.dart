import 'package:flutter/material.dart';
import 'package:learningriverpod/Styles/appStyles.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.textItem, this.isWhite});
  final String textItem;
  final bool? isWhite;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13),
      width: 385,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isWhite == null ? Appstyles.buttonFill : Colors.white,
          border: Border.all(
              color:
                  isWhite == null ? Colors.transparent : Appstyles.buttonFill)),
      child: Center(
        child: isWhite == null
            ? Text(textItem, style: Appstyles.buttonText)
            : Text(
                textItem,
                style:
                    Appstyles.buttonText.copyWith(color: Appstyles.buttonFill),
              ),
      ),
    );
  }
}
