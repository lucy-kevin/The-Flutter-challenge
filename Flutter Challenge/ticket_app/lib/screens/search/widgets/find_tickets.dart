import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';

class FindTickets extends StatelessWidget {
  const FindTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppStyles.findTicketColor),
      child: Center(
          child: Text(
        "Find Tickets",
        style: AppStyles.textStyle.copyWith(color: Colors.white),
      )),
    );
  }
}
