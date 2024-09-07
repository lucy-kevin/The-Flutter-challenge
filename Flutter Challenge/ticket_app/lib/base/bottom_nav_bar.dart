import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_app/Controller/buttom_nav_controller.dart';
import 'package:ticket_app/screens/home/home_screen.dart';
import 'package:ticket_app/screens/profiles/profiles.dart';
import 'package:ticket_app/screens/search/search_screen.dart';

import 'package:ticket_app/screens/tickets/widget/ticket_screen.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});
  //Dependency injection
  final ButtomNavController controller = Get.put(ButtomNavController());

  final appScreens = [
    const HomeScreen(),
    const SearchScreen(),
    const TicketScreen(),
    const ProfilesScreen(),
  ];
  //change our index for bottom nav bar

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
            body: appScreens[controller.selectedIndex.value],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.selectedIndex.value,
              onTap: controller.onItemTapped,
              selectedItemColor: Colors.blueGrey,
              unselectedItemColor: const Color(0xff526400),
              showSelectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
                  label: "Ticket",
                ),
                BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
                  label: "Person",
                ),
              ],
            ));
      },
    );
  }
}
