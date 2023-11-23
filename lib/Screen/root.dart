import 'package:etransit/Screen/CreationAnnonce.dart';
import 'package:etransit/Screen/Message.dart';
import 'package:etransit/Screen/ReservationArticle.dart';
import 'package:etransit/Screen/home.dart';
import 'package:etransit/Screen/profil.dart';
import 'package:etransit/services/AuthService.dart';
import 'package:etransit/theme/color.dart';
import 'package:etransit/widgets/bottombar_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  List<IconData> _tapIcons = [
    Icons.home_rounded,
    Icons.add,
    Icons.messenger_outline,
    Icons.person_rounded
  ];
  List<IconData> tapIcons = [Icons.home_rounded, Icons.person_rounded];

  List<Widget> _pages = [
    Home(),
    CreationAnnonce(),
    Message(),
    Profil(),
  ];
  List<Widget> pages = [
    Home(),
    Profil(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AuthService>().authenticate;
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthService>();
    return Scaffold(
      backgroundColor: appBgColor,
      bottomNavigationBar: _buildBottomBar(
          auth.authenticate == false ? tapIcons : _tapIcons, auth.tabindex!),
      body: _buildBarPage(
          auth.authenticate == false ? pages : _pages, auth.tabindex!),
    );
  }

  Widget _buildBottomBar(List<IconData> tapIcons, int activeTab) {
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
          tapIcons.length,
          (index) => BottomBarItem(
            tapIcons[index],
            isActive: activeTab == index,
            activeColor: primary,
            onTap: () {
              setState(() {
                context.read<AuthService>().setIndex(index);
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBarPage(List<Widget> pages, int activeTab) {
    return IndexedStack(
      index: activeTab,
      children: List.generate(
        pages.length,
        (index) => pages[index],
      ),
    );
  }
}
