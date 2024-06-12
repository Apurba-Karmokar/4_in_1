import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final Color appBarColor;
  final Color iconColor;

  Footer({
    required this.selectedIndex,
    required this.onItemTapped,
    required this.appBarColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.cloud, color: iconColor),
          label: 'Weather',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.quiz, color: iconColor),
          label: 'Quizzer',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calculate, color: iconColor),
          label: 'Calculator',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: iconColor),
          label: 'About Me',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.amber[800],
      backgroundColor: appBarColor,
      unselectedItemColor: iconColor,
      onTap: onItemTapped,
    );
  }
}
