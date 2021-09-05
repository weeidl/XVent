import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xvent/theme/colors.dart';

import '../home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> tabs = [
    HomePage(),
    Text('1'),
    Text('2'),
    Text('3'),
    Text('3'),
  ];

  Color getIconColor(index) {
    return _selectedIndex == index ? XVentColor.yellow : XVentColor.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: tabs[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: XVentColor.buttonBar,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              color: getIconColor(0),
            ),
            label: 'Home',
            // label: AppLocalizations.of(context)!.fundraiser,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/love.svg',
              color: getIconColor(1),
            ),
            label: '1',
            // label: AppLocalizations.of(context)!.reports,
          ),
          BottomNavigationBarItem(
            icon: Container(
              child: SvgPicture.asset(
                'assets/icons/add_vent.svg',
                // color: XVentColor.yellow,
              ),
            ),
            // label: AppLocalizations.of(context)!.notifications,
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/calendar.svg',
              color: getIconColor(3),
            ),
            // label: AppLocalizations.of(context)!.notifications,
            label: '3',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/profile.svg',
              color: getIconColor(4),
            ),
            label: '4',
            // label: AppLocalizations.of(context)!.profile,
          ),
        ],
        selectedItemColor: XVentColor.yellow,
        unselectedItemColor: XVentColor.gray,
        selectedLabelStyle: TextStyle(
          fontFamily: 'SFPro',
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: XVentColor.textColor,
          fontStyle: FontStyle.normal,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'SFPro',
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: XVentColor.textColor,
          fontStyle: FontStyle.normal,
        ),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
