import 'package:flutter/material.dart';
import 'dart:async';

import 'package:kostamobile/palette.dart';

class ScrollBanner extends StatefulWidget {
  const ScrollBanner({Key? key}) : super(key: key);

  @override
  State<ScrollBanner> createState() => _ScrollBannerState();
}

class _ScrollBannerState extends State<ScrollBanner> {
  int currentPage = 0;
  //배너 이미지
  List bannerPNG = [
    'assets/images/banner01.png',
    'assets/images/banner02.png',
    'assets/images/banner03.png',
    'assets/images/banner04.png',
    'assets/images/banner05.png',
    'assets/images/banner06.png'
  ];
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (currentPage < 5) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      _pageController.animateToPage(currentPage,
          duration: Duration(seconds: 3), curve: Curves.easeInSine);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      pageSnapping: true,
      controller: _pageController,
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
            width: 700,
            height: 400,
            color: accentBLue,
            child: Image.asset(
              bannerPNG[index],
              fit: BoxFit.cover,
            ));
      },
    );
  }
}
