// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/homeprovider.dart';
import 'package:recycle_app/screens/-----For%20employe-----/home/components/nav_bar/nav_bar.dart';
import 'package:recycle_app/screens/-----For%20employe-----/home/provider/homeprovider.dart';

class Home_E extends StatelessWidget {
  const Home_E({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: context.watch<HomeProvider_E>().chosenPage(),
        bottomNavigationBar: const BottomNavBare());
  }
}
