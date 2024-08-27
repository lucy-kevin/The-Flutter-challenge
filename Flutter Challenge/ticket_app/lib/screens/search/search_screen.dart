import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/widgets/app_double_text.dart';
import 'package:ticket_app/screens/search/widgets/app_text_icon.dart';
import 'package:ticket_app/screens/search/widgets/app_ticket_tabs.dart';
import 'package:ticket_app/screens/search/widgets/find_tickets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            "What are\nyou looking for?",
            style: AppStyles.headLineStyle1.copyWith(fontSize: 35),
          ),
          const SizedBox(
            height: 15,
          ),
          const AppTicketTabs(),
          const SizedBox(
            height: 20,
          ),
          const AppTextIcon(
            icon: Icons.flight_takeoff,
            text: 'Departure',
          ),
          const SizedBox(
            height: 20,
          ),
          const AppTextIcon(
            icon: Icons.flight_land,
            text: 'Arrival',
          ),
          const SizedBox(
            height: 20,
          ),
          const FindTickets(),
          const SizedBox(
            height: 20,
          ),
          AppDoubleText(
            bigText: 'Upcoming Flights',
            smallText: 'View all',
            func: () => Navigator.pushNamed(context, "/all_tickets"),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Container(
                width: size.width * .42,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.shade200,
                        blurRadius: 5,
                        spreadRadius: 10,
                      )
                    ]),
                child: const Text("A long text"),
              )
            ],
          )
        ],
      ),
    );
  }
}
