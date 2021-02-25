import 'package:flutter/material.dart';
import 'package:flutter_app/screens/nav_pages/discover_page.dart';
import 'package:flutter_app/screens/nav_pages/home_page.dart';
import 'package:flutter_app/screens/nav_pages/profile_page.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var _index = 0;

  Widget bodyWidget() {
    switch (_index) {
      case 0:
        return HomePage();
        break;
      case 1:
        return DiscoverPage();
        break;
      case 2:
        return ProfilePage();
        break;
    }
    return null;
  }

  void _selectPage(int index) {
    if (mounted) {
      setState(() {
        _index = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyWidget(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (index) => _selectPage(index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Ana Sayfa'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Keşfet'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
