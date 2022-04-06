import 'package:flutter/material.dart';
import 'package:food_deliver/pages/home/main_full_page.dart';
import 'package:food_deliver/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages = [
    MainFoodPage(),
    Container(
        child: Center(
      child: Text("Next page1"),
    )),
    Container(
        child: Center(
      child: Text("Next page2"),
    )),
    Container(
      child: Center(
        child: Text("Next page3"),
      ),
    ),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: AppColors.textColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          //selectedfont size 0.0

          currentIndex: _selectedIndex,
          onTap: onTapNav,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.archive),
              label: "history",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: "cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "me",
            )
          ]),
    );
  }
}
