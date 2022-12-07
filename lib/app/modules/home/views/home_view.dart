import 'package:flutter/material.dart';
import 'package:kostamobile/app/modules/custom/views/custom_view.dart';
import 'package:kostamobile/app/modules/funding/views/funding_view.dart';
import '../../news/views/news_view.dart';

import '../../../../palette.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Widget> pages = [
    NewsView(),
    CustomView(),
    FundingView(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryLight,
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 18,
        selectedLabelStyle:
            TextStyle(fontFamily: 'SM', fontWeight: FontWeight.w700),
        unselectedLabelStyle:
            TextStyle(fontFamily: 'SM', fontWeight: FontWeight.w300),
        selectedItemColor: accentBLue,
        backgroundColor: primaryLight,
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.people_sharp), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_drink_rounded), label: 'Custom'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Funding'),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
