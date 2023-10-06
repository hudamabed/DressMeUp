// ignore_for_file: non_constant_identifier_names
import 'package:dressmeup/screens/user/details_screen.dart';
import 'package:dressmeup/screens/user/home_screen.dart';
import 'package:dressmeup/screens/user/profile_screen.dart';
import 'package:dressmeup/screens/user/shopping_screen.dart';
import 'package:dressmeup/screens/user/wishListScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController{
  int _navigatorValue = 0;
  Widget _currentScreen = const HomeScreen();
  get navigator => _navigatorValue;
  get currentScrren => _currentScreen;
  void ChangeNavigatorValue(int Selector) {
    _navigatorValue = Selector;
    switch (Selector) {
      case 0:
        {
          _currentScreen = const HomeScreen();
          break;
        }
      case 1:
        {
          _currentScreen =   const DetailsScreen();
          break;
        }
      case 2:
        {
          _currentScreen = const ShoppingScreen();
          break;
        }
      case 3:
        {
          _currentScreen = const wishListScreen();
          break;
        }
      case 4:
        {
          _currentScreen = const ProfileScreen();
          break;
        }
    }
    update();
  }
}