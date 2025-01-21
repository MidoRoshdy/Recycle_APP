// ignore_for_file: constant_pattern_never_matches_value_type, camel_case_types

import 'package:flutter/material.dart';
import 'package:recycle_app/core/enum.dart';
import 'package:recycle_app/screens/-----%20%20%20%20For%20user%20%20%20-----/home/components/categories/categories_u.dart';
import 'package:recycle_app/screens/-----%20%20%20%20For%20user%20%20%20-----/home/components/home%20main/home_u_main.dart';
import 'package:recycle_app/screens/-----%20%20%20%20For%20user%20%20%20-----/home/components/profile/profile_u.dart';
import 'package:recycle_app/screens/-----%20%20%20%20For%20user%20%20%20-----/home/components/recycling%20process/recycling_u.dart';
import 'package:recycle_app/screens/-----For%20employe-----/home/components/categories/categories_E.dart';
import 'package:recycle_app/screens/-----For%20employe-----/home/components/home%20main/home_u_main.dart';
import 'package:recycle_app/screens/-----For%20employe-----/home/components/profile/profile_u.dart';
import 'package:recycle_app/screens/-----For%20employe-----/home/components/recycling%20process/recycling_u.dart';
import 'package:recycle_app/screens/-----For%20employe-----/home/components/scan/components/Scanuser.dart';
import 'package:recycle_app/screens/-----For%20employe-----/home/components/scan/components/checkout.dart';

import 'homestate.dart';

class HomeProvider_E extends ChangeNotifier {
  void init() {
    notifyListeners();
  }

  // ignore: unused_field
  final HomeState_E state = HomeState_E();

  void onNavigationTap(int value) {
    switch (value) {
      case 0:
        state.chosenNavigationItem = ParentsChosenNavigationItem.home;
        break;
      case 1:
        state.chosenNavigationItem =
            ParentsChosenNavigationItem.recycling_process;
        break;
      case 2:
        state.chosenNavigationItem = ParentsChosenNavigationItem.categories;
        break;
      case 3:
        state.chosenNavigationItem = ParentsChosenNavigationItem.profile;
        break;
    }
    notifyListeners();
  }

  // Widget cart_dtails() {
  //   switch (state.cartDetails) {
  //     case CartDetails.checkout:
  //       return const CheackOut_E();
  //     case CartDetails.scan:
  //       return const ScanUser_E();
  //   }
  // }

  Widget chosenPage() {
    switch (state.chosenNavigationItem) {
      case ParentsChosenNavigationItem.home:
        return Home_E_Main();
      case ParentsChosenNavigationItem.recycling_process:
        return Recycling_E();

      case ParentsChosenNavigationItem.categories:
        return Categories_E();
      case ParentsChosenNavigationItem.profile:
        return Profile_E();
      default:
        return const SizedBox();
    }
  }

  void returnHome() {
    state.chosenNavigationItem = ParentsChosenNavigationItem.home;
    state.navigationIndex = 0;
    notifyListeners();
  }
}
