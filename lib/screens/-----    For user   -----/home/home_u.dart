import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:recycle_app/screens/-----%20%20%20%20For%20user%20%20%20-----/home/components/nav_bar/nav_bar.dart';
import 'package:recycle_app/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/homeprovider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: context.watch<HomeProvider_U>().chosenPage(),
        bottomNavigationBar: const BottomNavBaru());
  }
}
