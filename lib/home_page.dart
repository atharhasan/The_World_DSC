import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:the_world/continents.dart';
import 'package:the_world/favorite.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return SplashScreenView(
      navigateRoute: AfterSplash(),
      duration: 5000,
      imageSize: 400,
      imageSrc: "images/splashearth.png",
      text: "DSC World",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 40.0,
      ),
      colors: [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: Colors.teal[50],
    );
  }
}

class AfterSplash extends StatefulWidget {
  @override
  _AfterSplashState createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  // the value of dark mode function.
  bool _switchValue = false;

  //The index of bottom navigation bar.
  int _currentIndex = 0;
  PageController _pageController= PageController();
  final List<Widget> _screen = [
    Continents(),
    Favorite(),
  ];

// to define selected index in bottom navigation bar.
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void onItemTapped(int _currentIndex){
    _pageController.jumpToPage(_currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PageView(
        controller: _pageController,
        children: _screen,
        onPageChanged: onTabTapped,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orangeAccent[400],
        selectedItemColor: Colors.pink[900],
        items: <BottomNavigationBarItem> [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
       BottomNavigationBarItem(icon: Icon(Icons.star_border),label: 'Favorite'),
      ],
        onTap: onItemTapped,
        currentIndex: _currentIndex,
      ),
    );
  }
}
