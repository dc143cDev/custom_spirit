import 'package:flutter/material.dart';

import '../../../../palette.dart';

class CustomView extends StatefulWidget {
  const CustomView({Key? key}) : super(key: key);

  @override
  State<CustomView> createState() => _CustomViewState();
}

class _CustomViewState extends State<CustomView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: LogoAB(),
        centerTitle: false,
      ),
      body: Row(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 300,
                  height: 300,
                ),
              ],
            ),
          ),
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: [
              NavigationRailDestination(
                icon: SizedBox.shrink(),
                label: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: RotatedBox(
                    quarterTurns: -3,
                    child: Text(
                      '위스키',
                      style: TextStyle(
                        fontFamily: 'SM',
                        fontWeight: FontWeight.w800,
                        color: accentBLue,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              NavigationRailDestination(
                icon: SizedBox.shrink(),
                label: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: RotatedBox(
                    quarterTurns: -3,
                    child: Text(
                      '크래프트 맥주',
                      style: TextStyle(
                        fontFamily: 'SM',
                        fontWeight: FontWeight.w800,
                        color: accentBLue,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              NavigationRailDestination(
                icon: SizedBox.shrink(),
                label: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: RotatedBox(
                    quarterTurns: -3,
                    child: Text(
                      '증류주',
                      style: TextStyle(
                        fontFamily: 'SM',
                        fontWeight: FontWeight.w800,
                        color: accentBLue,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              NavigationRailDestination(
                icon: SizedBox.shrink(),
                label: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: RotatedBox(
                    quarterTurns: -3,
                    child: Text(
                      '전통주',
                      style: TextStyle(
                        fontFamily: 'SM',
                        fontWeight: FontWeight.w800,
                        color: accentBLue,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
