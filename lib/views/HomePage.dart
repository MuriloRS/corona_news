import 'package:corona_news/views/BottomNavigation.dart';
import 'package:corona_news/views/PrevencaoScreen.dart';
import 'package:corona_news/views/RecentNewsScreen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;

  PageController _pageController = PageController(
    initialPage: 1,
  );

  final tabs = [
    PrevencaoScreen(),
    RecentNewsScreen(),
    Container(),
    Container()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Corona News",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      bottomNavigationBar: BottomNavigation(_currentIndex, _pageController),
      body: tabs[_currentIndex]
    ));
  }
}
