import 'package:flutter/material.dart';
import 'package:ticket_app/base/utils/app_json.dart';
import 'package:ticket_app/base/widgets/ticket_view.dart';
import 'package:ticket_app/routes/app_routes.dart';
import 'package:ticket_app/screens/tickets/widget/ticket_screen.dart';

class AllTickets extends StatelessWidget {
  const AllTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Tickets",
        ),
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Column(
              children: ticketList
                  .map((singleTicket) => GestureDetector(
                        onTap: () {
                          var index = ticketList.indexOf(singleTicket);
                          print("I am tapped on $index");
                          Navigator.pushNamed(context, AppRoutes.ticketScreen,
                              arguments: {"index": index});
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: TicketView(
                            ticket: singleTicket,
                            wholeScreen: true,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
