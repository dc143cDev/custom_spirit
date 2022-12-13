import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kostamobile/app/modules/news/views/news_banner.dart';
import 'package:kostamobile/app/modules/news/views/news_tab.dart';
import 'package:kostamobile/palette.dart';

import '../controllers/news_controller.dart';

class NewsView extends GetView<NewsController> {
  const NewsView({Key? key}) : super(key: key);
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 280,
                child: ScrollBanner(),
              ),
              Container(
                child: Text(
                  'News',
                  style: TextStyle(
                    fontFamily: 'SM',
                    fontWeight: FontWeight.w800,
                    color: textDark,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: NewsTab(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
