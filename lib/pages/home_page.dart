import 'package:arrahikulmakhtoom/constants/colors.dart';
import 'package:arrahikulmakhtoom/pages/reading_page.dart';
import 'package:arrahikulmakhtoom/pages/settings_page.dart';
import 'package:arrahikulmakhtoom/provider/provider.dart';
import 'package:arrahikulmakhtoom/widgets/bottom_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/functions.dart';
import 'landing_screen.dart';

class Homepage extends StatefulWidget {
  static MaterialPageRoute route =
      MaterialPageRoute(builder: (builder) => const Homepage());
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex = 0;
  var controller = PageController(initialPage: 0);
  final List<Widget> _pages = [
    const LandingScreen(),
    Container(),
    const SettingPage(),
    const SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Builder(builder: (context) {
        return PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            children: _pages);
      }),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  BottomNavigationBar _bottomNavBar() {
    return BottomNavigationBar(
      showUnselectedLabels: false,
      showSelectedLabels: false,
      iconSize: 25,
      items: bottomNavigationBarItems(selectedIndex),
      currentIndex: selectedIndex,
      unselectedItemColor: Colors.grey,
      selectedItemColor: primaryColor,
      onTap: (index) async {
        if (index == 1) {
          var prov = Provider.of<DataProvider>(context, listen: false);
          Navigator.push(context, ReadingPage.route(prov.lastReadIndex, prov.lastReadChapter));
        } else if (index == 2) {
          showLanguageChange(context);
        } else {
          setState(() {
            selectedIndex = index;
          });
          await controller.animateToPage(index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut);
        }
      },
    );
  }
}
