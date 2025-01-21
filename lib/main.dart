import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/core/app_routes.dart';
import 'package:recycle_app/screens/-----%20%20%20%20For%20user%20%20%20-----/home/provider/homeprovider.dart';
import 'package:recycle_app/screens/-----%20%20%20%20For%20user%20%20%20-----/user%20handle/forget%20pass/provider/forget_U_provider.dart';
import 'package:recycle_app/screens/-----%20%20%20%20For%20user%20%20%20-----/user%20handle/login/provider/login_U_provider.dart';
import 'package:recycle_app/screens/-----%20%20%20%20For%20user%20%20%20-----/user%20handle/register/provider/register_U_provder.dart';
import 'package:recycle_app/screens/-----For%20All%20Users-----/onbourding/provider/onbprovider.dart';
import 'package:recycle_app/screens/-----For%20employe-----/home/provider/homeprovider.dart';
import 'package:recycle_app/screens/-----For%20employe-----/user%20handle/forget%20pass/provider/forget_E_provider.dart';
import 'package:recycle_app/screens/-----For%20employe-----/user%20handle/login/provider/login_E_provider.dart';
import 'package:recycle_app/screens/-----For%20employe-----/user%20handle/register/provider/register_provder.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => onbprovider()),
          ChangeNotifierProvider(create: (context) => Login_E_Provider()),
          ChangeNotifierProvider(create: (context) => CreateAccountProvider()),
          ChangeNotifierProvider(create: (context) => ForgetPass_E_provider()),
          ChangeNotifierProvider(
              create: (context) => CreateAccountProvider_U()),
          ChangeNotifierProvider(create: (context) => Login_U_Provider()),
          ChangeNotifierProvider(create: (context) => ForgetPass_U_provider()),
          ChangeNotifierProvider(create: (context) => HomeProvider_U()),
          ChangeNotifierProvider(create: (context) => HomeProvider_E()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: App_Routes.splash,
          theme: ThemeData.light(),
          onGenerateRoute: App_Routes.onGenerateRoute,
        ),
      );
    });
  }
}
