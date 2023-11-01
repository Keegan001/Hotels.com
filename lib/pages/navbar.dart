import 'package:flutter/material.dart';
import 'homepage.dart';
import 'searchpage.dart';
import 'profilepage.dart';

class navbar extends StatefulWidget {
  const navbar({super.key});

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
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
          homePage(),
          searchPage(),
          profilePage(),
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
