import 'package:flutter/material.dart';
import 'package:totel/utils/app_colors.dart';
import 'package:totel/views/partner_views/partner_home_screen.dart';

class PartnetNavigationBar extends StatefulWidget {
  const PartnetNavigationBar({super.key});

  @override
  State<PartnetNavigationBar> createState() => _PartnetNavigationBarState();
}

class _PartnetNavigationBarState extends State<PartnetNavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const PartnerHomeScreen(),
    const Center(
      child: Text('Bookmarks'),
    ),
    const Center(
      child: Text('Notifications'),
    ),
    const Center(
      child: Text('Profile'),
    ),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: const IconThemeData(
          color: AppColors.indigoColor,
          size: 30,
        ),
        unselectedIconTheme: const IconThemeData(
          color: AppColors.blackColor,
          size: 25,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmarks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
