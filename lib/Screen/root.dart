import 'package:etransit/Screen/Message.dart';
import 'package:etransit/Screen/home.dart';
import 'package:etransit/Screen/profil.dart';
import 'package:etransit/theme/color.dart';
import 'package:etransit/widgets/bottombar_item.dart';
import 'package:flutter/material.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int _activeTab = 0;

  List<IconData> _tapIcons = [
    Icons.home_rounded,
    Icons.add,
    Icons.messenger_outline,
    Icons.person_rounded
  ];

  List<Widget> _pages = [
    Home(),
    Container(),
    Message(),
    Profil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      bottomNavigationBar: _buildBottomBar(),
      body: _buildBarPage(),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: 75,
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: bottomBarColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.1),
            blurRadius: .5,
            spreadRadius: .5,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          _tapIcons.length,
          (index) => BottomBarItem(
            _tapIcons[index],
            isActive: _activeTab == index,
            activeColor: primary,
            onTap: () {
              setState(() {
                _activeTab = index;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBarPage() {
    return IndexedStack(
      index: _activeTab,
      children: List.generate(
        _tapIcons.length,
        (index) => _pages[index],
      ),
    );
  }
}
