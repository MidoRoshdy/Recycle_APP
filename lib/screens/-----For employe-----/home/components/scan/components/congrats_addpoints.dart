// ignore_for_file: camel_case_types, file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/core/app_routes.dart';

import 'package:recycle_app/core/assets.dart';
import 'package:recycle_app/main.dart';
import 'package:recycle_app/screens/-----For%20employe-----/home/provider/homeprovider.dart';
import 'package:sizer/sizer.dart';

class CongratsAddingPoints extends StatefulWidget {
  const CongratsAddingPoints({super.key});

  @override
  State<CongratsAddingPoints> createState() => _CongratsAddingPointsState();
}

class _CongratsAddingPointsState extends State<CongratsAddingPoints> {
  @override
  Widget build(BuildContext context) {
    handleData(context);
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        Divider(
          height: 20.h,
          color: Colors.transparent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("congratiolations!",
                style: TextStyle(
                    fontSize: 23.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have been signed in ",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("successfuly",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400)),
          ],
        ),
        Divider(
          height: 5.h,
          color: Colors.transparent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.congrats, scale: 5.5.sp),
          ],
        ),
      ]),
    ));
  }

  Future<void> handleData(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 5));

    Navigator.of(context)
        .pushNamedAndRemoveUntil(App_Routes.home_E, (route) => false);
  }
}
