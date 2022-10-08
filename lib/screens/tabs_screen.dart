import 'package:chamcong_app/screens/account_screen.dart';
import 'package:chamcong_app/screens/calendar_work_screen.dart';
import 'package:chamcong_app/screens/home_screen.dart';
import 'package:chamcong_app/screens/noti_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      'page': HomeScreen(),
      'title': 'Trang chu',
    },
    {
      'page': CalendarWorkScreen(),
      'title': 'Trang chu',
    },
    {
      'page': NotiScreen(),
      'title': 'Trang chu',
    },
    {
      'page': AccountScreen(),
      'title': 'Trang chu',
    },
  ];

  int _pageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Icon(
              Icons.location_pin,
              color: Theme.of(context).primaryColor,
            ),
            Text(
              '48 Tố Hữu, Trung Văn, Từ Liêm, Hà Nội',
            ),
          ],
        ),
      ),
      body: _pages[_pageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.white,
        unselectedItemColor: Color(0xFF74777A),
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _pageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Color(0xFF74777A),
            ),
            activeIcon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            activeIcon: Icon(Icons.calendar_month),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            activeIcon: Icon(Icons.notifications),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            activeIcon: Icon(Icons.account_circle),
            label: '',
          )
        ],
      ),
    );
  }
}
