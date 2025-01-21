// ignore_for_file: camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Profile_E extends StatefulWidget {
  const Profile_E({super.key});

  @override
  State<Profile_E> createState() => _Profile_EState();
}

class _Profile_EState extends State<Profile_E> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Profile_E'),
        ),
      ),
    );
  }
}
