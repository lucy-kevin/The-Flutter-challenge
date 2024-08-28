import 'package:flutter/material.dart';

import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/widgets/app_double_text.dart';
import 'package:ticket_app/screens/search/widgets/app_text_icon.dart';
import 'package:ticket_app/screens/search/widgets/app_ticket_tabs.dart';
import 'package:ticket_app/screens/search/widgets/find_tickets.dart';
import 'package:ticket_app/screens/search/widgets/ticket_promotion.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          const AppTicketTabs(
            firstTab: 'All Tickets',
            secondTab: 'Hotels',
          ),
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
          const TicketPromotion(),
        ],
      ),
    );
  }
}
