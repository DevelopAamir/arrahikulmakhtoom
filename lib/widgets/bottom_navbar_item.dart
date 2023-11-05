import 'package:flutter/material.dart';

import '../constants/colors.dart';

bottomNavigationBarItems(selectedIndex) {
  return [
    BottomNavigationBarItem(
        icon: Column(
          children: [
            Icon(Icons.circle,
                color: selectedIndex == 0 ? primaryColor : Colors.transparent,
                size: 10),
            const SizedBox(
              height: 5,
            ),
            const ImageIcon(AssetImage('assets/images/landingScreen/home.png'),)
            
          ],
        ),
        label: 'Home'),
    BottomNavigationBarItem(
        icon: Column(
          children: [
            Icon(Icons.circle,
                color: selectedIndex == 1 ? primaryColor : Colors.transparent,
                size: 10),
            const SizedBox(
              height: 5,
            ),
            const ImageIcon(AssetImage('assets/images/landingScreen/lastread.png')),
          ],
        ),
        label: 'Last Read'),
    BottomNavigationBarItem(
        icon: Column(
          children: [
            Icon(Icons.circle,
                color: selectedIndex == 2 ? primaryColor : Colors.transparent,
                size: 10),
            const SizedBox(
              height: 5,
            ),
            const ImageIcon(AssetImage('assets/images/landingScreen/translate.png')),
          ],
        ),
        label: 'Translate'),
    BottomNavigationBarItem(
        icon: Column(
          children: [
            Icon(Icons.circle,
                color: selectedIndex == 3 ? primaryColor : Colors.transparent,
                size: 10),
            const SizedBox(
              height: 5,
            ),
            const ImageIcon(AssetImage('assets/images/landingScreen/settings.png')),
          ],
        ),
        label: 'Settings'),
  ];
}
