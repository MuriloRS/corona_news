import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigation extends StatefulWidget {
  int _currentIndex;
  PageController _pageController;

  BottomNavigation(this._currentIndex, this._pageController);
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) => setState(() {
        widget._currentIndex = index;
      }),
      currentIndex: widget._currentIndex,
      elevation: 3,
      showUnselectedLabels: true,
      selectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(color: Colors.white),
      unselectedIconTheme: IconThemeData(color: Colors.grey[500]),
      unselectedLabelStyle: TextStyle(color: Colors.grey[500]),
      unselectedItemColor: Colors.grey[500],
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.help_outline,
          ),
          title: Text(
            "Prevenção",
          ),
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.description,
            ),
            title: Text(
              "Recentes",
            ),
            backgroundColor: Colors.black),
        BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.map
            ),
            title: Text(
              "Mapa",
            ),
            backgroundColor: Colors.black),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
            ),
            title: Text(
              "Contato",
            ),
            backgroundColor: Colors.black)
      ],
    );
  }
}
