import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/user/all_search_screen.dart';
import '../screens/user/kid_search_screen.dart';
import '../screens/user/men_search_screen.dart';
import '../screens/user/women_search_screen.dart';

class SearchViewModel extends GetxController {
  TextEditingController search = TextEditingController();

  void onChangeSearch() {
    AllSearchScreen.displayList = AllSearchScreen.dioMethods.products
        .where((element) =>
            element.title.toLowerCase().contains(search.text.toLowerCase())).toSet();
    update();
  }

  void onChangeSearchMan() {
    MenSearchScreen.displayList = MenSearchScreen.dioMethods.man
        .where((element) =>
            element.title.toLowerCase().contains(search.text.toLowerCase())).toSet();
    update();
  }

  void onChangeSearchWomen() {
    WomenSearchScreen.displayList = WomenSearchScreen.dioMethods.women
        .where((element) =>
            element.title.toLowerCase().contains(search.text.toLowerCase())).toSet();
    update();
  }

  void onChangeSearchKid() {
    KidSearchScreen.displayList = KidSearchScreen.dioMethods.kid
        .where((element) =>
            element.title.toLowerCase().contains(search.text.toLowerCase())).toSet();
    update();
  }
  
}
