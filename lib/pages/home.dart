import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:healthng/pages/covid.dart';
import 'package:healthng/pages/explore.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  PageController _pageController = PageController();

  List<IconData> iconList = [
    Feather.home,
    Feather.grid,
    Feather.map,
    Feather.map_pin,
    Feather.user
  ];


  void onTabTapped(int index) {
    setState(() {
     _currentIndex = index;
     
   });
   _pageController.animateToPage(index,
      curve: Curves.easeIn,
      duration: Duration(milliseconds: 400));
   
  }



 @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _currentIndex,
        inactiveColor: Colors.grey[800],
        activeColor: Colors.green.shade800,
        onTap: (index) => onTabTapped(index),
      ),
      body: PageView(
        controller: _pageController,

        physics: NeverScrollableScrollPhysics(),  
        children: <Widget>[
          Explore(),
          Covid(),
         // BlogPage(),
          //BookmarkPage(),
          //ProfilePage(),
        ],
      ),
    );
  }
}
