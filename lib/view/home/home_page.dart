import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trip_budgeter_2410/views/home/profile_tab.dart';

import 'about_us_tab.dart';
import 'home_tab.dart';
import 'notification_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Widget> _tabs;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabs = [
      HomeTab(),
      NotificationTab(),
      AboutUsTab(),
      ProfileTab()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: Colors.white.withOpacity(0.4),
        activeColor: Color(0xFF6B6C69),
        inactiveColor: Color(0xFFB0B0A0),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bell),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.info),
            label: 'About Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
        tabBuilder: (BuildContext context, int index) {
        return _tabs[index];
      },
    );
  }
}
