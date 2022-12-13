import 'package:flutter/material.dart';
import 'package:kostamobile/palette.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({Key? key}) : super(key: key);

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  //추후에 db에서 받아온 데이터로 위젯 만들어서 뿌려줌. 임시로 위젯 지정
  List<Widget> newsWidget = [
    newsCard(),
    newsCard(),
    newsCard(),
  ];
  @override
  Widget build(BuildContext context) {
    return PageView(
      pageSnapping: true,
      children: [
        newsCard(),
        newsCard(),
        newsCard(),
      ],
    );
  }
}

newsCard() {
  return InkWell(
    onTap: () {
      print('asdf');
    },
    child: Container(
      child: Card(
        elevation: 0,
        child: Column(
          children: [
            Image.asset('assets/images/banner01.png'),
            ListTile(
              title: Text(
                'News Title',
                style: titleText(),
              ),
              subtitle: Text('subtitle'),
            ),
            Padding(
              padding: EdgeInsets.all(18),
              child: Text('이곳에 뉴스 내용을 입력해주세요'),
            ),
          ],
        ),
      ),
    ),
  );
}
