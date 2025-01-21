// ignore_for_file: use_build_context_synchronously, unused_import

import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:recycle_app/core/app_routes.dart';
import 'package:recycle_app/core/assets.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late GifController _controller; // تعريف الـ GifController كمتغير instance

  @override
  void initState() {
    super.initState();
    // تهيئة الـ GifController
    _controller = GifController(vsync: this);
    handleData(context); // بدء التعامل مع البيانات
  }

  @override
  void dispose() {
    // التخلص من GifController عند انتهاء الحالة
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Gif(
          image: AssetImage(Assets.logo_gif),
          controller: _controller, // تمرير الـ controller إلى Gif
          autostart: Autostart.no,
          placeholder: (context) => const Text(''),
          onFetchCompleted: () {
            _controller.reset();
            _controller.forward();
          },
        ),
      ),
    );
  }

  Future<void> handleData(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 5));
    if (mounted) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(App_Routes.onboardingmain, (route) => false);
    }
  }
}
