import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ticket_app/base/bottom_nav_bar.dart';
import 'package:ticket_app/routes/app_routes.dart';
import 'package:ticket_app/screens/home/all_hotels.dart';
import 'package:ticket_app/screens/home/all_tickets.dart';
import 'package:ticket_app/screens/hotel_detail.dart';
import 'package:ticket_app/screens/tickets/widget/ticket_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //home: const BottomNavBar(),
      routes: {
        AppRoutes.homePage: (context) => BottomNavBar(),
        AppRoutes.allTickets: (context) => const AllTickets(),
        AppRoutes.ticketScreen: (context) => const TicketScreen(),
        AppRoutes.allHotels: (context) => const AllHotels(),
        AppRoutes.hotelDetail: (context) => const HotelDetail(),
      },
    );
  }
}
