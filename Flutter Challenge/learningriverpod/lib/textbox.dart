import 'package:flutter/material.dart';

class Textbox extends StatelessWidget {
  const Textbox({super.key, required this.textItem});
  final String textItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
            hintText: textItem,
            hintStyle: const TextStyle(color: Color(0xE64C6DE3), fontSize: 16),
            fillColor: const Color(0xFFD6DFFD),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                    color: Color.fromARGB(218, 131, 154, 236),
                    width: 0.6,
                    style: BorderStyle.solid)),
            contentPadding: const EdgeInsets.all(14)
            //enabledBorder: OutlineInputBorder()
            ),
      ),
    );
  }
}
