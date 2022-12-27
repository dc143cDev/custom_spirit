import 'package:flutter/material.dart';
import 'package:kostamobile/app/modules/admin/views/funding_console.dart';
import 'package:kostamobile/app/modules/admin/views/product_console.dart';
import 'package:kostamobile/app/modules/admin/views/user_console.dart';
import 'package:kostamobile/app/modules/custom/views/custom_view.dart';
import 'package:kostamobile/app/modules/funding/views/funding_view.dart';
import '../../../../model/user/user_list.dart';
import '../../my/views/my_view.dart';
import '../../news/views/news_view.dart';

import '../../../../palette.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Widget> pages = [
    UserList(),
    ProductConsole(),
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
        backgroundColor: bgColor,
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.people_sharp), label: 'User'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Product'),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
