import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

//컬러 팔레트
const primaryLight = Color(0xFFececec);
const bgColor = Color(0xFFffffff);
const accentBLue = Color(0xFF0c5474);
const accentGold = Color(0xFFe5b84e);
const secondaryColor = Color(0xFF467066);
const baseColor = Color(0xFFdce4ec);
const textDark = Color(0xFF000302);

const maxWidth = 920.0;

//폰트 테마
titleText() {
  return const TextStyle(
    fontWeight: FontWeight.w600,
    fontFamily: 'SM',
    color: textDark,
    fontSize: 20,
  );
}

titleTextWhite() {
  return const TextStyle(
    fontWeight: FontWeight.w300,
    fontFamily: 'IBM',
    color: baseColor,
    fontSize: 20,
  );
}

titleTextWhiteSmall() {
  return const TextStyle(
    fontWeight: FontWeight.w300,
    fontFamily: 'IBM',
    color: baseColor,
    fontSize: 14,
  );
}

normalText() {
  return const TextStyle(
    fontWeight: FontWeight.w300,
    fontFamily: 'IBM',
    color: textDark,
    fontSize: 23,
  );
}

boldText() {
  return const TextStyle(
    fontWeight: FontWeight.w600,
    fontFamily: 'IBM',
    color: textDark,
    fontSize: 30,
  );
}

class LogoL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'FUNDRINK',
      style: TextStyle(
        fontFamily: 'SM',
        fontWeight: FontWeight.w800,
        color: primaryLight,
        fontSize: 50,
      ),
    );
  }
}

class LinePrimary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 5,
        ),
        Container(
          color: primaryLight,
          width: 132,
          height: 3,
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          color: primaryLight,
          width: 15,
          height: 3,
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          color: primaryLight,
          width: 132,
          height: 3,
        ),
      ],
    );
  }
}

class LineAccent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 5,
        ),
        Container(
          color: accentBLue,
          width: 132,
          height: 3,
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          color: accentBLue,
          width: 15,
          height: 3,
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          color: accentBLue,
          width: 132,
          height: 3,
        ),
      ],
    );
  }
}
