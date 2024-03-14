import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'SearchPage.dart';
import 'ProfilePage.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentindex = 0;
  PageController pC = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const ScrollPhysics(),
        controller: pC,
        onPageChanged: (value) {
          setState(() {
            currentindex = value;
          });
        },
        children: [
          HomePage(),
          SearchPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentindex,
        backgroundColor: const Color.fromARGB(255, 248, 206, 255),
        elevation: 0.0,
        height: 80,
        onDestinationSelected: (value) {
          pC.animateToPage(
            value,
            duration: const Duration(milliseconds: 500),
            curve: Curves.decelerate,
          );
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.house),
            label: 'For You',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
      ),
    );
  }
}
