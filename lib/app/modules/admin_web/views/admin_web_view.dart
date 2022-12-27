import 'package:flutter/material.dart';
import 'package:kostamobile/api/get_product_api.dart';
import 'package:kostamobile/app/modules/admin/views/funding_console.dart';
import 'package:kostamobile/app/modules/admin/views/product_console.dart';
import 'package:kostamobile/model/user/user_list.dart';
import 'package:kostamobile/palette.dart';

import '../../../../network.dart';

class AdminWebView extends StatefulWidget {
  const AdminWebView({Key? key}) : super(key: key);

  @override
  State<AdminWebView> createState() => _AdminWebViewState();
}

class _AdminWebViewState extends State<AdminWebView> {
  List<Widget> _screens = [
    UserList(),
    ProductConsole(),
    FundingConsole(),
  ];
  int _selectedIndex = 0;

  late String productTable = '';
  late String userTable = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserTable();
  }

  getUserTable() async {
    Network network = Network('http://localhost:8000/getUserTable');

    var jsonData = await network.getJsonData();
    userTable = await jsonData[0]['COUNT(*)'];
  }

  _getProductTable() async {
    Network network = Network('http://localhost:8000/getProductTable');

    var jsonData = await network.getJsonData();
    productTable = await jsonData[0]['COUNT(*)'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
              selectedIconTheme: IconThemeData(color: Colors.white),
              unselectedIconTheme: IconThemeData(color: Colors.white54),
              backgroundColor: accentBLue,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                  getUserTable();
                  _getProductTable();
                });
              },
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.people_sharp),
                  label: Text(
                    'User',
                    style: TextStyle(
                        fontFamily: 'SM', fontWeight: FontWeight.w300),
                  ),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: Text(
                    'Product',
                    style: TextStyle(
                        fontFamily: 'SM', fontWeight: FontWeight.w300),
                  ),
                ),
              ],
              selectedIndex: _selectedIndex),
          Expanded(flex: 8, child: _screens[_selectedIndex]),
          SizedBox(
            width: 15,
          ),
          // Expanded(
          //   flex: 3,
          //   child: SizedBox(
          //     child: Container(
          //       color: primaryLight,
          //       child: Container(
          //         child: Column(
          //           children: [
          //             Container(
          //               child: Column(
          //                 children: [
          //                   Text(
          //                     'Product Count:',
          //                     style: boldText(),
          //                   ),
          //                   Text(
          //                     '${productTable}',
          //                     style: TextStyle(
          //                       fontFamily: 'SM',
          //                       fontWeight: FontWeight.w800,
          //                       color: primaryLight,
          //                       fontSize: 20,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               decoration: BoxDecoration(
          //                 color: accentBLue,
          //                 borderRadius: BorderRadius.circular(50),
          //               ),
          //             ),
          //             Container(
          //               child: Column(
          //                 children: [
          //                   Text(
          //                     'Registered User Count:',
          //                     style: boldText(),
          //                   ),
          //                   Text(
          //                     '${userTable}',
          //                     style: TextStyle(
          //                       fontFamily: 'SM',
          //                       fontWeight: FontWeight.w800,
          //                       color: primaryLight,
          //                       fontSize: 20,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               decoration: BoxDecoration(
          //                 color: accentBLue,
          //                 borderRadius: BorderRadius.circular(50),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
